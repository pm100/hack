/*
    virtual Machine language compiler
    part of nand 2 tetris toolchain

*/

use anyhow::{anyhow, Result};
use vmcomp::VMComp;

mod constants;
mod vmcomp;

use clap::Parser;
use clap_derive::Parser;
use std::{fs, path::PathBuf};
#[derive(Parser, Debug)]
#[command(version, about, long_about = None)]
struct Args {
    #[arg(short, long)]
    input: PathBuf,
    #[arg(short, long)]
    outfile: Option<PathBuf>,
    #[arg(short, long)]
    add_bootstrap: bool,
    #[arg(short, long)]
    verbose: bool,
}

fn main() -> Result<()> {
    // either compiles one file or a directory of files

    let args = Args::parse();
    let input_path = &args.input;
    let name = args
        .input
        .file_stem()
        .ok_or(anyhow!("bad path"))?
        .to_str()
        .ok_or(anyhow!("bad path"))?;

    // output file defaults to input file name with .asm extension
    // for a single file or <dirname>.asm for a directory

    let output_name = if let Some(outfile) = args.outfile {
        outfile.to_str().unwrap().to_string()
    } else {
        format!("{}.asm", name)
    };

    let mut vmcompiler = VMComp::new();
    if input_path.is_dir() {
        // all files in directory

        // 'bootstrap' is the code that initializes the stack and calls Sys.init

        if args.add_bootstrap {
            vmcompiler.bootstrap()?;
        }

        for entry in fs::read_dir(input_path)? {
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
        vmcompiler.emit_firmware()?;
        vmcompiler.output_code(&output_name)?;
    } else {
        // single file
        let source = fs::read_to_string(input_path)?;
        if args.add_bootstrap {
            vmcompiler.bootstrap()?;
        }

        vmcompiler.run(&source, name)?;
        vmcompiler.emit_firmware()?;
    }
    vmcompiler.output_code(&output_name)?;
    Ok(())
}
