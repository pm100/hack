mod linker;
use anyhow::{anyhow, bail, Result};

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
}

fn main() -> Result<()> {
    let args = Args::parse();
    let cur = std::env::current_dir()?;
    println!("{:?}", cur);
    let input_path = args.input;

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

    let output_name = if let Some(outfile) = args.outfile {
        outfile.to_str().unwrap().to_string()
    } else {
        format!("{}.vm", name)
    };

    fs::remove_file(&output_name).ok(); // ignore errors
                                        // input points at Main.vm

    let main_path = input_path.join("Main.vm");
    println!("{:?}", main_path);
    if !main_path.exists() {
        bail!("Main.vm not found");
    }

    let mut linker = Linker::new();
    //  linker.load(&fs::read_to_string(&main_path)?, "Main")?;
    load_dir(input_path.as_path(), &mut linker, &main_path)?;

    if let Some(oslib) = args.lib {
        load_dir(oslib.as_path(), &mut linker, &main_path)?;
    }
    linker.output_code(&output_name)?;

    Ok(())
}
fn load_dir(path: &Path, linker: &mut Linker, main_path: &PathBuf) -> Result<()> {
    for entry in fs::read_dir(path)? {
        let entry = entry?;
        let path = entry.path();

        if path.is_file() {
            // if path == main_path.as_path() {
            //     continue;
            // }
            if let Some(ftype) = path.extension() {
                if ftype.to_str().unwrap() == "vm" {
                    println!("loading {:?}", path);
                    let source = fs::read_to_string(path.clone())?;
                    let name = path.file_stem().unwrap().to_str().unwrap();
                    linker.load(&source, name)?;
                }
            }
        }
    }
    Ok(())
}
