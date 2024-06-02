use anyhow::{Context, Result};
use pest::{iterators::Pair, Parser};
use std::{collections::HashMap, fs};

use crate::{constants, Format};
#[derive(pest_derive::Parser)]
#[grammar = "asm.pest"]
pub struct AsmParser;

pub struct Assembler {
    labels: HashMap<String, i64>,
    instructions: Vec<u16>,
    forward_references: HashMap<String, Vec<isize>>,
}

impl Assembler {
    pub fn new() -> Assembler {
        Self {
            // variables: HashMap::new(),
            labels: HashMap::new(),
            instructions: Vec::new(),
            forward_references: HashMap::new(),
        }
    }
    pub fn run(&mut self, source: &str, _name: &str) -> Result<()> {
        let parsed = AsmParser::parse(Rule::program, source)?;
        for pair in parsed {
            match pair.as_rule() {
                Rule::a_inst => self.parse_a(pair)?,
                Rule::c_inst => self.parse_c(pair)?,
                Rule::l_inst => self.parse_l(pair)?,
                Rule::EOI => self.complete()?,
                _ => {
                    unreachable!()
                }
            }
        }

        Ok(())
    }

    pub fn output_code(self, output_name: &str, format: Format) -> Result<()> {
        let code = self
            .instructions
            .iter()
            .map(|x| match format {
                Format::RawBinary => format!("{:016b}", *x),
                Format::RawHex => format!("{:04x}", *x),
            })
            .collect::<Vec<String>>()
            .join("\n");
        println!("writing to file {}", output_name);
        fs::write(output_name, code).expect("Unable to write file");
        Ok(())
    }
    fn parse_a(&mut self, pair: Pair<Rule>) -> Result<()> {
        let this_pair = pair.into_inner().next().unwrap();
        match this_pair.as_rule() {
            Rule::int => {
                let num = this_pair.as_str().parse::<i64>().context("bad num")?;
                self.instructions.push(num as u16);
            }
            Rule::hex_num => {
                let num = i64::from_str_radix(&this_pair.as_str()[2..], 16).context("bad num")?;
                self.instructions.push(num as u16);
            }
            Rule::label => {
                let label = this_pair.as_str();
                if let Some(reserved_symbol) = Self::lookup_symbol(label) {
                    self.instructions.push(reserved_symbol);
                    return Ok(());
                }
                if self.labels.contains_key(label) {
                    self.instructions
                        .push(*self.labels.get(label).unwrap() as u16);
                } else {
                    let fref = self
                        .forward_references
                        .entry(label.to_string())
                        .or_default();
                    fref.push(self.instructions.len() as isize);
                    self.instructions.push(0);
                }
            }
            _ => unreachable!(),
        }
        Ok(())
    }

    fn complete(&mut self) -> Result<()> {
        let mut var_count = 16;
        for (label, indexes) in self.forward_references.iter() {
            if let Some(addr) = self.labels.get(label) {
                for index in indexes {
                    self.instructions[*index as usize] = *addr as u16;
                }
            } else {
                // assume all undefined lables are variables
                for index in indexes {
                    println!("Variable {} => {}", &label, var_count);
                    self.instructions[*index as usize] = var_count as u16;
                    var_count += 1;
                }
            }
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

        self.instructions.push(
            Self::generate_comp(comp) << 6
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
