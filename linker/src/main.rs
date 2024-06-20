/*
   A 'linker' for the nand 2 tetris toolchain

   It reads in a Main.vm file and then resolves all 'os' calls
   by merging in the relevant functions from
   - the supplied directory
   - the supplied library (assumed to point to the sstandard OS functions)

   This produces a single large vm file that can then be compiled and assembled

   It produces a much smaller binary as only the needed code is merged in

*/

mod linker;
use anyhow::{bail, Result};

use clap::Parser;
use clap_derive::Parser;
use linker::Linker;
use std::{
    fs,
    path::{Path, PathBuf},
};
#[derive(Parser, Debug)]
#[command(version, about, long_about = None)]
struct Args {
    #[arg(short, long)]
    input: PathBuf,
    #[arg(short, long)]
    outfile: Option<PathBuf>,
    #[arg(short, long)]
    lib: Option<PathBuf>,
    #[arg(short, long)]
    verbose: bool,
}

fn main() -> Result<()> {
    let args = Args::parse();
    let verbose = args.verbose;

    let input_path = args.input;
    // the input points at a directory
    if input_path.is_file() {
        bail!("Input must be a directory");
    }
    let dir = if input_path == Path::new(".") {
        std::env::current_dir()?
    } else {
        input_path.clone()
    };

    let name = dir
        .components()
        .last()
        .unwrap()
        .as_os_str()
        .to_str()
        .unwrap();
    // the generated file name is <dir>.vm by default
    let output_name = if let Some(outfile) = args.outfile {
        outfile.to_str().unwrap().to_string()
    } else {
        format!("{}.vm", name)
    };

    // delete the previous output so we dont try to include in the new run
    fs::remove_file(&output_name).ok();

    // make sure Main.vm exists

    if !input_path.join("Main.vm").exists() {
        bail!("Main.vm not found");
    }

    let mut linker = Linker::new(verbose);
    load_dir(input_path.as_path(), &mut linker, verbose)?;
    if let Some(oslib) = args.lib {
        load_dir(oslib.as_path(), &mut linker, verbose)?;
    }
    linker.output_code(&output_name)?;
    Ok(())
}

fn load_dir(path: &Path, linker: &mut Linker, verbose: bool) -> Result<()> {
    for entry in fs::read_dir(path)? {
        let entry = entry?;
        let path = entry.path();

        if path.is_file() {
            if let Some(ftype) = path.extension() {
                if ftype.to_str().unwrap() == "vm" {
                    if verbose {
                        println!("loading {:#?}", path)
                    };
                    let source = fs::read_to_string(path.clone())?;
                    // let name = path.file_stem().unwrap().to_str().unwrap();
                    linker.load(&source)?;
                }
            }
        }
    }
    Ok(())
}
