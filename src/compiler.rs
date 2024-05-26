use anyhow::{Result};
use pest::{Parser};

#[derive(pest_derive::Parser)]
#[grammar = "jack.pest"]
pub struct JackParser;

pub struct Compiler {}
impl Compiler {
    pub fn new() -> Self {
        Self {}
    }
    pub fn run(&mut self, source: &str, _name: &str, _output: &str) -> Result<()> {
        let pairs = JackParser::parse(Rule::class, source)?;
        for pair in pairs {
            println!("{:?}", pair);
        }
        Ok(())
    }
}
