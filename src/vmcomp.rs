use anyhow::{Context, Result};
use pest::{iterators::Pair, Parser};
use std::{
    collections::HashMap,
    io::{self, BufRead, Read},
};
#[derive(pest_derive::Parser)]
#[grammar = "vm.pest"]
pub struct VMParser;
enum PushSource {
    Constant(i16),
    A,
    D,
}
pub struct VMComp {
    code: Vec<String>,
}
impl VMComp {
    pub fn new() -> Self {
        Self { code: Vec::new() }
    }
    pub fn run(&mut self, source: &str) -> Result<()> {
        let pairs = VMParser::parse(Rule::program, source)?;
        for pair in pairs {
            match pair.as_rule() {
                // Rule::EOI => Ok(()),
                Rule::push_st => self.push(pair)?,
                Rule::pop_st => self.pop(pair)?,
                Rule::add_st => self.add(pair)?,
                _ => {
                    for inst in &self.code {
                        println!("{}", inst);
                    }
                }
            }
        }
        Ok(())
    }
    fn push(&mut self, pair: Pair<Rule>) -> Result<()> {
        // println!("push {:?}", pair);
        let mut pair_iter = pair.into_inner();
        let segment = pair_iter.next().unwrap();
        let index_str = pair_iter.next().unwrap().as_str();
        let index = i64::from_str_radix(index_str, 10)?;
        match segment.as_rule() {
            Rule::local => {}
            Rule::constant => {
                self.emit_push(PushSource::Constant(index as i16));
            }
            _ => {
                println!("a")
            }
        }

        println!("push {} {}", segment, index);
        Ok(())
    }
    fn pop(&mut self, pair: Pair<Rule>) -> Result<()> {
        let mut pair_iter = pair.into_inner();
        let segment = pair_iter.next().unwrap().as_str();
        let index_str = pair_iter.next().unwrap().as_str();
        let index = i64::from_str_radix(index_str, 10)?;
        println!("pop {} {}", segment, index);
        Ok(())
    }

    fn add(&mut self, pair: Pair<Rule>) -> Result<()> {
        println!("add");
        Ok(())
    }
    fn lookup_segment(segment: &str) {}

    fn emit_push(&mut self, from: PushSource) {
        //@val
        //D=A
        //@sp
        //A=M
        //M=D
        //@sp
        //M=M+1
        match from {
            PushSource::Constant(val) => {
                self.write(&format!("@{}", val));
            }
            PushSource::A => {
                self.write("D=A");
            }
            PushSource::D => {}
        }

        self.write("@SP");
        self.write("A=M");
        self.write("M=D");
        self.write("@SP");
        self.write("M=M+1");
    }
    fn write(&mut self, inst: &str) {
        self.code.push(inst.to_string());
    }
}
