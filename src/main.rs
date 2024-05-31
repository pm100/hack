use assembler::Assembler;

use crate::jack::compiler::Compiler;
use anyhow::Result;
use vmcomp::VMComp;
//use vmcomp::VMComp;
mod assembler;
mod jack {
    pub mod compiler;
    mod symbols;
}
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

    if path.is_dir() {
        let name = path.file_stem().unwrap().to_str().unwrap();
        let output_name = path.join(format!("{}.asm", name));
        let mut vmcompiler = VMComp::new();
        vmcompiler.bootstrap();
        for entry in fs::read_dir(path)? {
            let entry = entry?;
            let path = entry.path();

            if path.is_file() {
                let ftype = path.extension().unwrap();
                if ftype.to_str().unwrap() == "vm" {
                    let source = fs::read_to_string(path.clone())?;
                    let name = path.file_stem().unwrap().to_str().unwrap();
                    vmcompiler.run(&source, name)?;
                }
            }
        }
        vmcompiler.output_code(&output_name)?;
    } else {
        let ftype = path.extension().unwrap();
        let name = path.file_stem().unwrap().to_str().unwrap();
        let source = fs::read_to_string(&args.input)?;
        match ftype.to_str().unwrap() {
            "vm" => {
                let output_name = format!("{}.asm", name);
                let mut vmcompiler = VMComp::new();
                vmcompiler.run(&source, name)?;
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
    }
    Ok(())
}
