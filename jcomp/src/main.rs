use crate::compiler::Compiler;
use anyhow::Result;

pub mod compiler;
mod constants;
mod expression;
mod symbols;

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
}

fn main() -> Result<()> {
    let args = Args::parse();

    let input_path = &args.input;

    let name = input_path.file_stem().unwrap().to_str().unwrap();
    let source = fs::read_to_string(&args.input)?;
    let output_name = if let Some(outfile) = args.outfile {
        outfile.to_str().unwrap().to_string()
    } else {
        format!("{}.vm", name)
    };
    let mut compiler = Compiler::new();
    compiler.run(&source, name)?;
    compiler.output_code(&output_name)?;
    Ok(())
}
