use assembler::Assembler;

use anyhow::Result;
use compiler::Compiler;
use vmcomp::VMComp;
//use vmcomp::VMComp;
mod assembler;
mod compiler;
mod constants;
mod vmcomp;

use clap::Parser;
use clap_derive::Parser;
use std::{fs, path};
#[derive(Parser, Debug)]
#[command(version, about, long_about = None)]
struct Args {
    /// Name of the person to greet
    #[arg(short, long)]
    input: String,
}

fn main() -> Result<()> {
    let args = Args::parse();

    let path = path::Path::new(&args.input);
    let ftype = path.extension().unwrap();
    let name = path.file_stem().unwrap().to_str().unwrap();
    let source = fs::read_to_string(&args.input)?;
    match ftype.to_str().unwrap() {
        "vm" => {
            let output_name = format!("{}.asm", name);
            let mut vmcompiler = VMComp::new();
            vmcompiler.run(&source, name, &output_name)?;
        }
        "asm" => {
            let output_name = format!("{}.hack", name);
            let mut assembler = Assembler::new();
            assembler.run(&source, name, &output_name)?;
        }
        "jack" => {
            let output_name = format!("{}.vm", name);
            let mut compiler = Compiler::new();
            compiler.run(&source, name, &output_name)?;
        }
        _ => {
            println!("Invalid file type");
        }
    }

    Ok(())
}
