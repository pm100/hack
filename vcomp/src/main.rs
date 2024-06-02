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
}

fn main() -> Result<()> {
    let args = Args::parse();
    let input_path = &args.input;
    let name = args
        .input
        .file_stem()
        .ok_or(anyhow!("bad path"))?
        .to_str()
        .ok_or(anyhow!("bad path"))?;
    let output_name = if let Some(outfile) = args.outfile {
        outfile.to_str().unwrap().to_string()
    } else {
        format!("{}.asm", name)
    };

    let mut vmcompiler = VMComp::new();
    if input_path.is_dir() {
        vmcompiler.bootstrap()?;
        vmcompiler.emit_firmware()?;
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
        vmcompiler.output_code(&output_name)?;
    } else {
        let source = fs::read_to_string(input_path)?;
        if args.add_bootstrap {
            vmcompiler.bootstrap()?;
        }
        vmcompiler.emit_firmware()?;
        vmcompiler.run(&source, name)?;
    }
    vmcompiler.output_code(&output_name)?;
    Ok(())
}
