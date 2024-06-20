use std::{
    cell::RefCell,
    collections::{BTreeMap, HashSet},
    fs::File,
};

use anyhow::{bail, Result};
use std::io::Write;

pub struct Linker {
    chunks: BTreeMap<String, Chunk>,
    emitted: RefCell<HashSet<String>>,
    verbose: bool,
}
struct Chunk {
    name: String,
    code: Vec<String>,
    calls: Vec<String>,
}
impl Linker {
    pub fn new(verbose: bool) -> Self {
        Self {
            chunks: BTreeMap::new(),
            emitted: RefCell::new(HashSet::new()),
            verbose,
        }
    }
    pub fn load(&mut self, source: &str) -> Result<()> {
        // incoming file is chopped up into chunks , each chunk is a function
        // for each chunk we record what functions it calls
        let lines = source.lines();
        let mut current_function_name = String::new();
        for line in lines {
            let mut parts = line.split_whitespace();
            if let Some(command) = parts.next() {
                match command {
                    "function" => {
                        let func_name = parts.next().unwrap().to_string();
                        if self.verbose {
                            println!("Function {}", func_name)
                        };
                        // start new chunk
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
                        // record the call
                        let name = parts.next().unwrap();
                        if self.verbose {
                            println!("   call {}", name)
                        };
                        if let Some(ref mut chunk) = self.chunks.get_mut(&current_function_name) {
                            chunk.calls.push(name.to_string());
                        } else {
                            bail!("call without function");
                        }
                    }

                    _ => {}
                }
            }
            // store each line in the current chunk
            if let Some(ref mut chunk) = self.chunks.get_mut(&current_function_name) {
                chunk.code.push(line.to_string());
            } else {
                bail!("line outside of function");
            }
        }

        Ok(())
    }
    pub fn output_code(&mut self, name: &str) -> Result<()> {
        // we now have a complete tree of function calls and definitions
        let mut output = File::create(name)?;
        if self.verbose {
            println!("Generated call tree---------------");
            for chunk in self.chunks.values() {
                println!("{}:", chunk.name);
                for call in &chunk.calls {
                    println!(" =>{}", call);
                }
            }

            println!("Emitting code---------------");
        }
        // Sys.init is the root of the call tree

        self.emit("Sys.init", &mut output, 0)?;
        Ok(())
    }

    fn emit(&self, name: &str, output: &mut File, depth: i8) -> Result<()> {
        // recurse down the call tree satisfying each function call we hit

        // did we already emit this function?

        if self.emitted.borrow().contains(name) {
            return Ok(());
        }
        self.emitted.borrow_mut().insert(name.to_string());

        if self.verbose {
            for _i in 0..depth {
                print!("  ");
            }
            println!("emitting {}", name);
        }
        if let Some(chunk) = self.chunks.get(name) {
            // include the fiunctions code

            for line in &chunk.code {
                writeln!(output, "{}", line)?;
            }
            // include the code for each function it calls
            for call in &chunk.calls {
                self.emit(call, output, depth + 1)?;
            }
        } else {
            bail!("Unresolved external reference: {}", name);
        }
        Ok(())
    }
}
