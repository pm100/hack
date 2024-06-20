/*
   Assembler for nand to tertis tool chain

   compiles a single file
   optinally produces a listing file
*/

use anyhow::{bail, Result};
use clap::Parser;
use clap_derive::Parser;
use std::{fs, path::PathBuf};

mod assembler;
mod constants;

use assembler::Assembler;

#[derive(Parser, Debug)]
#[command(version, about, long_about = None)]
struct Args {
    #[arg(short, long)]
    input: PathBuf,
    #[arg(short, long)]
    outfile: Option<PathBuf>,
    #[arg(short, long)]
    format: Option<String>,
    #[arg(short, long)]
    listing: Option<PathBuf>,
    #[arg(short, long)]
    verbose: bool,
}
// output formats
// - Raw biniary is the original toolkits output
// - Raw hex is the original toolkits output in hex
// - Hackem is the format used by my hack emulator
// - Test is for the use in unit tests
pub(crate) enum Format {
    RawBinary,
    RawHex,
    Hackem,
    Test,
}

fn main() -> Result<()> {
    let args = Args::parse();
    let name = args.input.file_stem().unwrap().to_str().unwrap();
    let verbose = args.verbose;
    let output_name = if let Some(outfile) = args.outfile {
        outfile.to_str().unwrap().to_string()
    } else {
        format!("{}.hack", name)
    };
    let mut assembler = Assembler::new();
    let source = fs::read_to_string(&args.input)?;
    assembler.run(&source, name, verbose)?;
    let fmt = if let Some(fstr) = args.format {
        match fstr.as_str() {
            "binary" | "b" => Format::RawBinary,
            "hex" | "h" => Format::RawHex,
            "hx" => Format::Hackem,
            "test" => Format::Test,
            _ => bail!("Invalid format"),
        }
    } else {
        Format::RawBinary
    };
    let listing = assembler.listing();
    assembler.output_code(&output_name, fmt)?;
    if let Some(listing_path) = args.listing {
        fs::write(listing_path, listing)?;
    }

    Ok(())
}
