use anyhow::{Context, Result};
use pest::{iterators::Pair, Parser};
use std::{
    collections::HashMap,
    io::{self, BufRead, Read},
};
#[derive(pest_derive::Parser)]
#[grammar = "asm.pest"]
pub struct AsmParser;

pub struct Assembler {
    // variables: HashMap<String, i64>,
    labels: HashMap<String, i64>,
    instructions: Vec<u16>,
    forward_references: Vec<(String, isize)>,
}

impl Assembler {
    pub fn new() -> Assembler {
        Self {
            // variables: HashMap::new(),
            labels: HashMap::new(),
            instructions: Vec::new(),
            forward_references: Vec::new(),
        }
    }
    pub fn run(&mut self, source: &str) -> Result<()> {
        let parsed = AsmParser::parse(Rule::program, source)?;
        for pair in parsed {
            match pair.as_rule() {
                Rule::a_inst => self.parse_a(pair)?,
                Rule::c_inst => self.parse_c(pair)?,
                Rule::l_inst => self.parse_l(pair)?,
                Rule::EOI => self.complete()?,
                _ => {
                    //unreachable!()
                    println!("{:?}", pair.as_rule());
                }
            }
        }

        Ok(())
    }
    fn parse_a(&mut self, pair: Pair<Rule>) -> Result<()> {
        let this_pair = pair.into_inner().next().unwrap();
        match this_pair.as_rule() {
            Rule::int => {
                // println!("{:?}", this_pair.as_str());
                let num = i64::from_str_radix(this_pair.as_str(), 10).context("bad num")?;
                println!("dec {:?}", num);
                self.instructions.push(num as u16);
            }
            Rule::hex_num => {
                let num = i64::from_str_radix(&this_pair.as_str()[2..], 16).context("bad num")?;
                println!("hex {:?}", num);
                self.instructions.push(num as u16);
            }
            Rule::label => {
                let label = this_pair.as_str();
                println!("label ref{:?}", label);
                if self.labels.contains_key(label) {
                    self.instructions
                        .push(*self.labels.get(label).unwrap() as u16);
                } else {
                    self.forward_references
                        .push((label.to_string(), self.instructions.len() as isize));
                    self.instructions.push(0);
                }
            }
            _ => unreachable!(),
        }
        Ok(())
    }

    fn complete(&mut self) -> Result<()> {
        println!("complete");
        for (label, index) in self.forward_references.iter() {
            if let Some(addr) = self.labels.get(label) {
                self.instructions[*index as usize] = *addr as u16;
            } else {
                //return Err(anyhow::anyhow!("undefined label"));
                println!("undefined label");
            }
        }
        for (i, inst) in self.instructions.iter().enumerate() {
            println!("{:04} {:016b} 0x{:04x}", i, inst, inst);
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
            // println!("dest {:?}", dest);
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
        println!("cinst dest: {} comp {} jump {}", dest, comp, jump);

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
        if self.labels.contains_key(label) {
            return Err(anyhow::anyhow!("label already defined"));
        }
        self.labels
            .insert(label.to_string(), self.instructions.len() as i64);
        println!("label def{:?}", label);
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
        let mut ret = 0;
        match comp {
            "0" => ret = 0b0101010,
            "1" => ret = 0b0111111,
            "-1" => ret = 0b0111010,
            "D" => ret = 0b0001100,
            "A" => ret = 0b0110000,
            "!D" => ret = 0b0001101,
            "!A" => ret = 0b0110001,
            "-D" => ret = 0b0001111,
            "-A" => ret = 0b0110011,
            "D+1" => ret = 0b0011111,
            "A+1" => ret = 0b0110111,
            "D-1" => ret = 0b0001110,
            "A-1" => ret = 0b0110010,
            "D+A" => ret = 0b0000010,
            "D-A" => ret = 0b0010011,
            "A-D" => ret = 0b0000111,
            "D&A" => ret = 0b0000000,
            "D|A" => ret = 0b0010101,
            "M" => ret = 0b1110000,
            "!M" => ret = 0b1110001,
            "-M" => ret = 0b1110011,
            "M+1" => ret = 0b1110111,
            "M-1" => ret = 0b1110010,
            "D+M" => ret = 0b1000010,
            "D-M" => ret = 0b1010011,
            "M-D" => ret = 0b1000111,
            "D&M" => ret = 0b1000000,
            "D|M" => ret = 0b1010101,
            _ => unreachable!(),
        }
        ret
    }
    fn generate_jump(jump: &str) -> u16 {
        let mut ret = 0;
        match jump {
            "JGT" => ret = 0b001,
            "JEQ" => ret = 0b010,
            "JGE" => ret = 0b011,
            "JLT" => ret = 0b100,
            "JNE" => ret = 0b101,
            "JLE" => ret = 0b110,
            "JMP" => ret = 0b111,
            "" => ret = 0b000,
            _ => unreachable!(),
        }
        ret
    }
}
