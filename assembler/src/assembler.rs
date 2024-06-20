use crate::{constants, Format};
use anyhow::{Context, Result};
use pest::{iterators::Pair, Parser};
use std::collections::BTreeMap;
use std::io::Write;
use std::{collections::HashMap, fs};
#[derive(pest_derive::Parser)]
#[grammar = "asm.pest"]
pub struct AsmParser;

pub struct Assembler {
    labels: HashMap<String, i64>,
    instructions: Vec<u16>,
    forward_references: BTreeMap<String, Vec<isize>>,
    lines: Vec<(String, Option<u16>)>,
    halt_addr: u16,
    generated_inst_addr: Option<u16>,
    verbose: bool,
}

impl Assembler {
    pub fn new() -> Assembler {
        Self {
            labels: HashMap::new(),
            instructions: Vec::new(),
            forward_references: BTreeMap::new(),
            lines: Vec::new(),
            halt_addr: 0,
            generated_inst_addr: None,
            verbose: false,
        }
    }
    pub fn run(&mut self, source: &str, _name: &str, verbose: bool) -> Result<()> {
        self.verbose = verbose;
        let parsed = AsmParser::parse(Rule::program, source)?;
        for pair in parsed {
            self.generated_inst_addr = None;
            let line = pair.clone().as_str().trim().trim_matches('\"');
            if verbose {
                println!("          {}", line);
            }
            match pair.as_rule() {
                Rule::a_inst => self.parse_a(pair)?,
                Rule::c_inst => self.parse_c(pair)?,
                Rule::l_inst => self.parse_l(pair)?,
                Rule::comment => (),
                Rule::EOI => self.complete()?,
                _ => {
                    unreachable!()
                }
            }
            self.lines
                .push((line.to_string(), self.generated_inst_addr));
        }

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
                writeln!(ofile, "hackem v1.0 0x{0:4x}", self.halt_addr)?;
                writeln!(ofile, "ROM@0000")?;
                for line in self.instructions.iter() {
                    writeln!(ofile, "{:04x}", line)?;
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
                out.push(format!("{:>22}{}", "", line));
            }
        }
        out.join("\n")
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

    fn complete(&mut self) -> Result<()> {
        let mut var_count = 16;
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
        println!();
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
