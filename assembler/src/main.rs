use anyhow::{bail, Result};
use assembler::Assembler;
use clap::Parser;
use clap_derive::Parser;

mod assembler;
mod constants;

use std::{fs, path::PathBuf};

#[derive(Parser, Debug)]
#[command(version, about, long_about = None)]
struct Args {
    #[arg(short, long)]
    input: PathBuf,
    #[arg(short, long)]
    outfile: Option<PathBuf>,
    #[arg(short, long)]
    format: Option<String>,
}

pub(crate) enum Format {
    RawBinary,
    RawHex,
}

fn main() -> Result<()> {
    let args = Args::parse();
    let name = args.input.file_stem().unwrap().to_str().unwrap();

    let output_name = if let Some(outfile) = args.outfile {
        outfile.to_str().unwrap().to_string()
    } else {
        format!("{}.hack", name)
    };
    let mut assembler = Assembler::new();
    let source = fs::read_to_string(&args.input)?;
    assembler.run(&source, name)?;
    let fmt = if let Some(fstr) = args.format {
        match fstr.as_str() {
            "binary" | "b" => Format::RawBinary,
            "hex" | "h" => Format::RawHex,
            _ => bail!("Invalid format"),
        }
    } else {
        Format::RawBinary
    };

    assembler.output_code(&output_name, fmt)?;
    Ok(())
}
