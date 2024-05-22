use assembler::Assembler;

use anyhow::Result;
use compiler::Compiler;
use vmcomp::VMComp;
//use vmcomp::VMComp;
mod assembler;
mod compiler;
mod vmcomp;

use std::io::{self, BufRead, Read};

pub struct AsmParser;

fn main() -> Result<()> {
    let mut buf = String::new();

    io::stdin().read_to_string(&mut buf)?;
    // let mut assembler = Assembler::new();
    // assembler.run(&buf);

    ///  let mut compiler = Compiler::new();
    //  compiler.run(&buf)?;
    let mut vmcompiler = VMComp::new();
    vmcompiler.run(&buf)?;
    Ok(())
}
