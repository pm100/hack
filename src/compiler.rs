use anyhow::{Context, Result};
use pest::{iterators::Pair, Parser};
use std::{
    collections::HashMap,
    io::{self, BufRead, Read},
};
#[derive(pest_derive::Parser)]
#[grammar = "jack.pest"]
pub struct JackParser;

pub struct Compiler {}
impl Compiler {
    pub fn new() -> Self {
        Self {}
    }
    pub fn run(&mut self, source: &str, name: &str, output: &str) -> Result<()> {
        let pairs = JackParser::parse(Rule::class, source)?;
        for pair in pairs {
            println!("{:?}", pair);
        }
        Ok(())
    }
}
