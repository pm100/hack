use std::{
    collections::HashMap,
    fs::{self, File},
};

use anyhow::{bail, Result};
use pest::{iterators::Pair, Parser};
use std::io::Write;
#[derive(pest_derive::Parser)]
#[grammar = "../../vcomp/src/vm.pest"]
struct VMParser {}

pub struct Linker {
    chunks: HashMap<String, Chunk>,
}
struct Chunk {
    name: String,
    code: Vec<String>,
    calls: Vec<String>,
}
impl Linker {
    pub fn new() -> Self {
        Self {
            chunks: HashMap::new(),
        }
    }
    pub fn load(&mut self, source: &String, name: &str) -> Result<()> {
        let lines = source.lines();
        // let mut chunks = vec![];
        let mut current_chunk = None;

        for line in lines {
            println!("{}", line);
            let mut parts = line.split_whitespace();
            // allow for blank lines
            if let Some(command) = parts.next() {
                match command {
                    "function" => {
                        let name = parts.next().unwrap();
                        let locals = parts.next().unwrap();
                        current_chunk = Some(Chunk {
                            name: name.to_string(),
                            code: vec![],
                            calls: vec![],
                        });
                    }
                    "call" => {
                        let name = parts.next().unwrap();
                        let args = parts.next().unwrap();
                        if let Some(ref mut chunk) = current_chunk {
                            chunk.calls.push(name.to_string());
                        } else {
                            bail!("call without function");
                        }
                    }
                    "return" => {
                        if let Some(mut chunk) = current_chunk {
                            chunk.code.push(line.to_string());
                            self.chunks.insert(chunk.name.clone(), chunk);
                        } else {
                            bail!("return without function");
                        }
                        current_chunk = Some(Chunk {
                            name: name.to_string(),
                            code: vec![],
                            calls: vec![],
                        });
                        continue;
                    }
                    _ => {}
                }
            }
            current_chunk.as_mut().unwrap().code.push(line.to_string());
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
        self.emit("Main.main", &mut output)?;
        Ok(())
    }

    fn emit(&self, name: &str, output: &mut File) -> Result<()> {
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
