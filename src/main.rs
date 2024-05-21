use assembler::Assembler;

use anyhow::Result;
mod assembler;

use std::io::{self, BufRead, Read};

pub struct AsmParser;

fn main() -> Result<()> {
    let mut buf = String::new();

    io::stdin().read_to_string(&mut buf)?;
    let mut assembler = Assembler::new();
    assembler.run(&buf);
    Ok(())
}
