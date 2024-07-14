use anyhow::{anyhow, bail, Result};
use common::pdb::database::Pdb;
// pub mod compiler;
// //mod constants;
// mod expression;
// mod symbols;
use clap::Parser;
use clap_derive::{Parser, ValueEnum};
use compcore::{
    assembler::assemble::{Assembler, Format},
    jcomp::compiler::Compiler,
    linker::link::Linker,
    vcomp::vmcomp::VMComp,
};
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
    verbose: bool,
    #[arg(short, long)]
    format: Option<String>,
    #[arg(short, long)]
    listing: Option<PathBuf>,
    #[arg(long)]
    oslib: Option<PathBuf>,
    #[arg(short, long, value_enum)]
    mode: Option<Mode>,
    #[arg(short, long)]
    bootstrap: bool,
}
#[derive(Copy, Clone, PartialEq, Eq, PartialOrd, Ord, ValueEnum, Debug)]
enum Mode {
    Jack,
    Vm,
    Link,
    Asm,
}
fn main() -> Result<()> {
    let args = Args::parse();
    let verbose = args.verbose;
    let input_path = &args.input;
    let mut pdb = Pdb::new();
    let bootstrap = args.bootstrap;

    if let Some(mode) = args.mode {
        let name = input_path.file_stem().unwrap().to_str().unwrap();
        match mode {
            Mode::Jack => {
                let source = fs::read_to_string(input_path.clone())?;

                let mut compiler = Compiler::new(verbose, &mut pdb);
                if compiler.run(&source, input_path)? {
                    compiler.output_code(&format!("{}.vm", name))?;
                } else {
                    bail!("No code generated");
                }
            }
            Mode::Vm => {
                let source = fs::read_to_string(input_path)?;
                let output_name = format!("{}.asm", name);

                let mut vmcompiler = VMComp::new(&mut pdb);
                if bootstrap {
                    vmcompiler.bootstrap()?
                };
                vmcompiler.run(&source, name)?;
                if bootstrap {
                    vmcompiler.emit_firmware()?
                };
                vmcompiler.output_code(&output_name)?;
            }
            Mode::Link => {
                link_all_vm(verbose, input_path, &args.oslib, name)?;
            }
            Mode::Asm => assemble(verbose, input_path, args.format, args.listing, &mut pdb)?,
        }
    } else {
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
        build_all_jack(verbose, input_path, &mut pdb)?;
        let linked_vm = link_all_vm(verbose, input_path, &args.oslib, name)?;
        let compiled_vm = compile_linked_vm(verbose, &linked_vm, &mut pdb)?;
        assemble(verbose, &compiled_vm, args.format, args.listing, &mut pdb)?;
        let json = pdb.save_json()?;
        fs::write(format!("{}.pdb", name), json)?;
    };

    Ok(())
}
fn link_all_vm(
    verbose: bool,
    input_path: &PathBuf,
    oslib: &Option<PathBuf>,
    name: &str,
) -> Result<PathBuf> {
    // the input points at a directory
    if input_path.is_file() {
        bail!("Input must be a directory");
    }
    // let dir = if input_path == Path::new(".") {
    //     std::env::current_dir()?
    // } else {
    //     input_path.clone()
    // };

    // let name = dir
    //     .components()
    //     .last()
    //     .unwrap()
    //     .as_os_str()
    //     .to_str()
    //     .unwrap();
    // the generated file name is <dir>.vm by default

    let output_name = format!("{}.vm", name);

    // delete the previous output so we dont try to include in the new run
    fs::remove_file(&output_name).ok();

    // make sure Main.vm exists

    if !input_path.join("Main.vm").exists() {
        bail!("Main.vm not found");
    }

    let mut linker = Linker::new(verbose);
    load_dir(input_path.as_path(), &mut linker, verbose)?;
    if let Some(oslib) = oslib {
        load_dir(oslib.as_path(), &mut linker, verbose)?;
    }
    linker.output_code(&output_name)?;
    Ok(PathBuf::from(output_name))
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

fn build_all_jack(verbose: bool, input_path: &PathBuf, pdb: &mut Pdb) -> Result<()> {
    //let name = input_path.file_stem().unwrap().to_str().unwrap();
    //let pdb = Pdb::open(&format!("{}.pdb", name))?;

    for entry in fs::read_dir(input_path)? {
        let entry = entry?;
        let path = entry.path();
        if path.is_file() {
            if let Some(ftype) = path.extension() {
                if ftype.to_str().unwrap() == "jack" {
                    let source = fs::read_to_string(path.clone())?;
                    let name = path.file_stem().unwrap().to_str().unwrap();
                    let mut compiler = Compiler::new(verbose, pdb);
                    if compiler.run(&source, &path)? {
                        compiler.output_code(&format!("{}.vm", name))?;
                    } else {
                        bail!("No code generated");
                    }
                }
            }
        }
    }

    Ok(())
}
fn compile_linked_vm(_verbose: bool, input_path: &PathBuf, pdb: &mut Pdb) -> Result<PathBuf> {
    let name = input_path
        .file_stem()
        .ok_or(anyhow!("bad path"))?
        .to_str()
        .ok_or(anyhow!("bad path"))?;

    let output_name = format!("{}.asm", name);

    let mut vmcompiler = VMComp::new(pdb);

    let source = fs::read_to_string(input_path)?;
    vmcompiler.bootstrap()?;
    vmcompiler.run(&source, name)?;
    vmcompiler.emit_firmware()?;
    vmcompiler.output_code(&output_name)?;
    Ok(PathBuf::from(output_name))
}

fn assemble(
    verbose: bool,
    input_path: &PathBuf,
    format: Option<String>,
    listing: Option<PathBuf>,
    pdb: &mut Pdb,
) -> Result<()> {
    //   let args = Args::parse();
    let name = input_path.file_stem().unwrap().to_str().unwrap();
    //  let verbose = args.verbose;

    let mut assembler = Assembler::new(pdb);
    let source = fs::read_to_string(input_path)?;
    assembler.run(&source, name, verbose)?;
    let (fmt, suffix) = if let Some(fstr) = format {
        match fstr.as_str() {
            "binary" | "b" => (Format::RawBinary, "hack"),
            "hex" | "h" => (Format::RawHex, "hex"),
            "hx" => (Format::Hackem, "hx"),
            "test" => (Format::Test, "test"),
            _ => bail!("Invalid format"),
        }
    } else {
        (Format::RawBinary, "hack")
    };
    let output_name = format!("{}.{}", name, suffix);
    let listing_str = assembler.listing();
    assembler.output_code(&output_name, fmt)?;
    if let Some(listing_path) = listing {
        fs::write(listing_path, listing_str)?;
    }

    Ok(())
}
