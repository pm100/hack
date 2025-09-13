use crate::constants;
use anyhow::{Context, Result};
use common::pdb::database::{Pdb, SourceMap};
use pest::{iterators::Pair, Parser};
use std::collections::BTreeMap;
use std::io::Write;
use std::{collections::HashMap, fs};
#[derive(pest_derive::Parser)]
#[grammar = "assembler/asm.pest"]
pub struct AsmParser;
pub enum Format {
    RawBinary,
    RawHex,
    Hackem,
    Test,
}

pub struct Assembler<'pdb> {
    labels: HashMap<String, i64>,
    instructions: Vec<u16>,
    forward_references: BTreeMap<String, Vec<isize>>,
    lines: Vec<(String, Option<u16>)>,
    halt_addr: u16,
    generated_inst_addr: Option<u16>,
    verbose: bool,
    source_map: Vec<SourceMap>,
    pdb: &'pdb mut Pdb,
    current_data_address: u16,
    data: Vec<(u16, u16)>,
}

impl<'pdb> Assembler<'pdb> {
    pub fn new(pdb: &'pdb mut Pdb) -> Assembler {
        Self {
            labels: HashMap::new(),
            instructions: Vec::new(),
            forward_references: BTreeMap::new(),
            lines: Vec::new(),
            halt_addr: 0,
            generated_inst_addr: None,
            verbose: false,
            source_map: Vec::new(),
            pdb,
            current_data_address: 0,
            data: Vec::new(),
        }
    }
    pub fn run(&mut self, source: &str, _name: &str, verbose: bool) -> Result<()> {
        self.verbose = verbose;
        let parsed = AsmParser::parse(Rule::program, source)?;
        for pair in parsed {
            //  if pair.as_rule() != Rule::comment {
            self.generated_inst_addr = None;
            //}
            let line = pair.clone().as_str().trim().trim_matches('\"');
            if verbose {
                println!("          {}", line);
            }
            match pair.as_rule() {
                Rule::a_inst => self.parse_a(pair)?,
                Rule::c_inst => self.parse_c(pair)?,
                Rule::l_inst => self.parse_l(pair)?,
                Rule::directive => self.parse_directive(pair)?,
                Rule::d_inst => self.parse_d(pair)?,
                Rule::comment => {
                    // ++pdb 0:18:9
                    if let Some(pdb_line) = line.strip_prefix("// ++pdb ") {
                        let parts: Vec<&str> = pdb_line.split(':').collect();
                        if parts.len() == 3
                        /*&& self.generated_inst_addr.is_some()*/
                        {
                            let file = parts[0].parse::<usize>().context("bad file_no")?;
                            let line_no = parts[1].parse::<usize>().context("bad line_no")?;
                            let col_no = parts[2].parse::<usize>().context("bad col_no")?;
                            self.pdb.source_map.push(SourceMap {
                                file,
                                line_no,
                                col_no,
                                addr: self.instructions.len() as u16,
                            });
                        }
                    }
                }
                Rule::EOI => {}
                _ => {
                    println!("unhandled rule {:?}", pair);
                    unreachable!()
                }
            }
            self.lines
                .push((line.to_string(), self.generated_inst_addr));
        }
        self.complete()?;
        Ok(())
    }

    pub fn output_code(self, output_name: &str, format: Format) -> Result<()> {
        let mut ofile = fs::File::create(output_name)?;
        if self.verbose {
            println!(
                "Writing file {}, format {}",
                output_name,
                match format {
                    Format::Hackem => "hackem",
                    Format::RawBinary => "binary",
                    Format::RawHex => "hex",
                    Format::Test => "test",
                }
            );
        }
        match format {
            // hackem format
            //  - hackem v1.0 0xhhhh
            // where hhhh is the address of the sys.halt call
            //  - ROM@aaaa
            // or
            //  - RAM@aaaa
            // where aaa is the start address of a block of code
            // to be loaded into ROM or RAM respectively
            Format::Hackem => {
                writeln!(ofile, "hackem v1.0 0x{:04x}", self.halt_addr)?;
                writeln!(ofile, "ROM@0000")?;
                for line in self.instructions.iter() {
                    writeln!(ofile, "{:04x}", line)?;
                }
                let mut last_addr = 0;
                for (data, addr) in self.data.iter() {
                    if *addr != last_addr + 1 {
                        writeln!(ofile, "RAM@{:04x}", addr)?;
                    }
                    last_addr = *addr;
                    writeln!(ofile, "{:04x}", data)?;
                }
            }
            Format::Test => {
                for (off, line) in self.instructions.iter().enumerate() {
                    writeln!(ofile, " cpu.rom[{}]=0x{:04x};", off, line)?;
                }
            }
            Format::RawBinary | Format::RawHex => {
                for line in self.instructions.iter() {
                    match format {
                        Format::RawBinary => writeln!(ofile, "{:016b}", line)?,
                        Format::RawHex => writeln!(ofile, "{:04x}", line)?,
                        _ => unreachable!(),
                    }
                }
            }
        }
        Ok(())
    }
    pub fn listing(&self) -> String {
        let mut out = Vec::new();
        for (ref line, ref inst_addr) in &self.lines {
            if let Some(addr) = inst_addr {
                out.push(format!(
                    "0x{:04x} ({:04}) 0x{:04x}  {}",
                    addr, addr, self.instructions[*addr as usize], line
                ));
            } else {
                out.push(format!("{:>23}{}", "", line));
            }
        }
        out.join("\n")
    }
    fn gen_data(&mut self, data: u16) {
        self.data.push((data, self.current_data_address));
        self.current_data_address += 1;
    }
    fn gen_inst(&mut self, inst: u16) {
        self.instructions.push(inst);
        self.generated_inst_addr = Some(self.instructions.len() as u16 - 1);
    }
    fn parse_a(&mut self, pair: Pair<Rule>) -> Result<()> {
        let this_pair = pair.into_inner().next().unwrap();
        match this_pair.as_rule() {
            Rule::int => {
                let num = this_pair.as_str().parse::<i64>().context("bad num")?;
                self.gen_inst(num as u16);
            }
            Rule::hex_num => {
                let num = i64::from_str_radix(&this_pair.as_str()[2..], 16).context("bad num")?;
                self.gen_inst(num as u16);
            }
            Rule::label => {
                let label = this_pair.as_str();
                if let Some(reserved_symbol) = Self::lookup_symbol(label) {
                    self.gen_inst(reserved_symbol);
                    return Ok(());
                }

                if self.labels.contains_key(label) {
                    self.gen_inst(*self.labels.get(label).unwrap() as u16);
                } else {
                    if self.verbose {
                        println!("Forward reference to {}", label);
                    }
                    let fref = self
                        .forward_references
                        .entry(label.to_string())
                        .or_default();
                    fref.push(self.instructions.len() as isize);
                    self.gen_inst(0);
                }
            }
            _ => unreachable!(),
        }
        Ok(())
    }
    fn parse_directive(&mut self, pair: Pair<Rule>) -> Result<()> {
        let this_pair = pair.into_inner().next().unwrap();
        match this_pair.as_rule() {
            Rule::dot_org => self.parse_dot_org(this_pair)?,
            _ => unreachable!(),
        }
        Ok(())
    }

    fn parse_maybe_hex(numstr: &str) -> Option<u16> {
        if numstr.starts_with("0x") | numstr.starts_with("0X") {
            if let Ok(num) = u16::from_str_radix(&numstr[2..], 16) {
                return Some(num);
            }
        } else if let Ok(num) = numstr.parse::<u16>() {
            return Some(num);
        }
        None
    }

    fn parse_dot_org(&mut self, pair: Pair<Rule>) -> Result<()> {
        let this_pair = pair.into_inner().next().unwrap();
        println!("directive {:?}", this_pair);
        let addr_str = this_pair.as_str();
        let addr = Self::parse_maybe_hex(addr_str).unwrap();
        self.current_data_address = addr;
        Ok(())
    }

    fn parse_d(&mut self, pair: Pair<Rule>) -> Result<()> {
        let this_pair = pair.into_inner().next().unwrap();
        match this_pair.as_rule() {
            Rule::word_inst => self.parse_word(this_pair)?,
            _ => {
                println!("unreachable! {:?}", this_pair);
            }
        }
        Ok(())
    }
    fn parse_word(&mut self, pair: Pair<Rule>) -> Result<()> {
        //   println!("data {:?}", pair);
        let pair = pair.into_inner().next().unwrap();

        let num_str = pair.as_str();
        let num = Self::parse_maybe_hex(num_str).unwrap();
        self.gen_data(num);
        Ok(())
    }
    fn complete(&mut self) -> Result<()> {
        let mut var_count = constants::STATIC as i64;
        if self.verbose {
            println!("----Fixup---------");
        }
        for (label, indexes) in self.forward_references.iter() {
            if self.verbose {
                println!("Resolving forward references to {} ", label);
            }

            if let Some(addr) = self.labels.get(label) {
                for index in indexes {
                    if self.verbose {
                        println!("{} => {}", index, addr);
                    }
                    self.instructions[*index as usize] = *addr as u16;
                }
                if let Some(func) = &mut self.pdb.symbols.iter_mut().find(|x| {
                    x.name == *label && x.symbol_type == common::pdb::database::SymbolType::Func
                }) {
                    func.address = *addr as u16;
                }
            } else {
                // assume all undefined lables are variables
                if self.verbose {
                    println!("Label {} undefined, assuming its a variable", &label);
                }
                for index in indexes {
                    if self.verbose {
                        println!("{} => {}", index, var_count);
                    }
                    self.instructions[*index as usize] = var_count as u16;
                }
                var_count += 1;
            }
        }
        for sm in self.source_map.iter() {
            println!("{:?}", sm);
        }
        Ok(())
    }
    fn parse_c(&mut self, pair: Pair<Rule>) -> Result<()> {
        // [dest=]  comp  [;jump]
        // valid combinations:
        // dest=comp;jump
        // comp;jump
        // dest=comp

        let mut pair_iter = pair.into_inner();
        let mut this_pair = pair_iter.next().unwrap();
        let mut dest = String::new();
        // do we have a dest?
        if this_pair.as_rule() == Rule::dest {
            dest = this_pair.as_str().to_string();
            this_pair = pair_iter.next().unwrap();
        }
        // mandatory comp
        let comp = this_pair.as_str();
        let this_pair = pair_iter.next();
        let jump;
        // do we have a jump?
        if let Some(this_pair) = this_pair {
            jump = this_pair.as_str();
        } else {
            jump = "";
        }

        self.gen_inst(
            0xe000
                | Self::generate_comp(comp) << 6
                | Self::generate_dest(&dest) << 3
                | Self::generate_jump(jump),
        );

        Ok(())
    }
    fn parse_l(&mut self, pair: Pair<Rule>) -> Result<()> {
        let this_pair = pair.into_inner().next().unwrap();
        let label = this_pair.as_str();
        if Self::lookup_symbol(label).is_some() {
            return Err(anyhow::anyhow!("label reserved "));
        }
        if self.labels.contains_key(label) {
            return Err(anyhow::anyhow!("label {} already defined", label));
        }
        self.labels
            .insert(label.to_string(), self.instructions.len() as i64);

        if let Some(func) =
            &mut self.pdb.symbols.iter_mut().find(|x| {
                x.name == label && x.symbol_type == common::pdb::database::SymbolType::Func
            })
        {
            func.address = self.instructions.len() as u16;
        }
        if label == "Sys.halt" {
            self.halt_addr = self.instructions.len() as u16;
        }
        Ok(())
    }
    fn generate_dest(dest: &str) -> u16 {
        let mut ret = 0;
        if dest.contains('A') {
            ret |= 0b100;
        }
        if dest.contains('D') {
            ret |= 0b010;
        }
        if dest.contains('M') {
            ret |= 0b001;
        }
        ret
    }
    fn generate_comp(comp: &str) -> u16 {
        match comp {
            "0" => 0b0101010,
            "1" => 0b0111111,
            "-1" => 0b0111010,
            "D" => 0b0001100,
            "A" => 0b0110000,
            "!D" => 0b0001101,
            "!A" => 0b0110001,
            "-D" => 0b0001111,
            "-A" => 0b0110011,
            "D+1" => 0b0011111,
            "A+1" => 0b0110111,
            "D-1" => 0b0001110,
            "A-1" => 0b0110010,
            "D+A" => 0b0000010,
            "D-A" => 0b0010011,
            "A-D" => 0b0000111,
            "D&A" => 0b0000000,
            "D|A" => 0b0010101,
            "M" => 0b1110000,
            "!M" => 0b1110001,
            "-M" => 0b1110011,
            "M+1" => 0b1110111,
            "M-1" => 0b1110010,
            "D+M" => 0b1000010,
            "D-M" => 0b1010011,
            "M-D" => 0b1000111,
            "D&M" => 0b1000000,
            "D|M" => 0b1010101,
            _ => unreachable!(),
        }
    }
    fn generate_jump(jump: &str) -> u16 {
        match jump {
            "JGT" => 0b001,
            "JEQ" => 0b010,
            "JGE" => 0b011,
            "JLT" => 0b100,
            "JNE" => 0b101,
            "JLE" => 0b110,
            "JMP" => 0b111,
            "" => 0b000,
            _ => unreachable!(),
        }
    }
    fn lookup_symbol(symbol: &str) -> Option<u16> {
        let val = match symbol {
            "R0" => constants::R0,
            "R1" => constants::R1,
            "R2" => constants::R2,
            "R3" => constants::R3,
            "R4" => constants::R4,
            "R5" => constants::R5,
            "R6" => constants::R6,
            "R7" => constants::R7,
            "R8" => constants::R8,
            "R9" => constants::R9,
            "R10" => constants::R10,
            "R11" => constants::R11,
            "R12" => constants::R12,
            "R13" => constants::R13,
            "R14" => constants::R14,
            "R15" => constants::R15,

            "SCREEN" => constants::SCREEN,
            "KBD" => constants::KBD,
            "SP" => constants::SP,
            "LCL" => constants::LCL,
            "ARG" => constants::ARG,
            "THIS" => constants::THIS,
            "THAT" => constants::THAT,
            _ => return None,
        };

        Some(val)
    }
}
