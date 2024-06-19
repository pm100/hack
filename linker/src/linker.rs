use std::{
    cell::RefCell,
    collections::{BTreeMap, HashMap, HashSet},
    fs::{self, File},
};

use anyhow::{bail, Result};
use pest::{iterators::Pair, Parser};
use std::io::Write;
#[derive(pest_derive::Parser)]
#[grammar = "../../vcomp/src/vm.pest"]
struct VMParser {}

pub struct Linker {
    chunks: BTreeMap<String, Chunk>,
    emitted: RefCell<HashSet<String>>,
}
struct Chunk {
    name: String,
    code: Vec<String>,
    calls: Vec<String>,
}
impl Linker {
    pub fn new() -> Self {
        Self {
            chunks: BTreeMap::new(),
            emitted: RefCell::new(HashSet::new()),
        }
    }
    pub fn load(&mut self, source: &String, name: &str) -> Result<()> {
        let lines = source.lines();

        let mut current_function_name = String::new();
        for line in lines {
            //println!("{}", line);
            let mut parts = line.split_whitespace();
            // allow for blank lines
            if let Some(command) = parts.next() {
                match command {
                    "function" => {
                        let func_name = parts.next().unwrap().to_string();
                        let _locals = parts.next().unwrap();
                        println!("{}", line);

                        current_function_name = func_name.clone();
                        let new_chunk = Chunk {
                            name: func_name.to_string(),
                            code: vec![],
                            calls: vec![],
                        };

                        if self.chunks.insert(func_name.clone(), new_chunk).is_some() {
                            bail!("duplicate function {}", func_name);
                        }
                    }
                    "call" => {
                        let name = parts.next().unwrap();
                        println!("   call {}", name);
                        let args = parts.next().unwrap();
                        if let Some(ref mut chunk) = self.chunks.get_mut(&current_function_name) {
                            chunk.calls.push(name.to_string());
                        } else {
                            bail!("call without function");
                        }
                    }
                    "return" => {

                        // continue;
                    }
                    _ => {}
                }
            }
            if let Some(ref mut chunk) = self.chunks.get_mut(&current_function_name) {
                chunk.code.push(line.to_string());
            } else {
                bail!("line outside of function");
            }
        }

        Ok(())
    }
    pub fn output_code(&mut self, name: &str) -> Result<()> {
        let mut output = File::create(name)?;
        for chunk in self.chunks.values() {
            println!("{}:", chunk.name);
            for call in &chunk.calls {
                println!(" =>{}", call);
            }
        }
        self.emit("Sys.init", &mut output)?;
        // self.emit("Main.main", &mut output)?;
        Ok(())
    }

    fn emit(&self, name: &str, output: &mut File) -> Result<()> {
        if self.emitted.borrow().contains(name) {
            return Ok(());
        }
        self.emitted.borrow_mut().insert(name.to_string());
        if let Some(chunk) = self.chunks.get(name) {
            for line in &chunk.code {
                writeln!(output, "{}", line)?;
            }
            for call in &chunk.calls {
                self.emit(call, output)?;
            }
        } else {
            println!("unrsolved external reference: {}", name);
        }
        Ok(())
    }
}
