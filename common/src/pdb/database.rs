use std::path::PathBuf;

use anyhow::Result;

use serde::{Deserialize, Serialize};

#[derive(Serialize, Deserialize, Debug)]
pub struct Pdb {
    pub vars: Vec<VarSym>,
    pub funcs: Vec<FuncSym>,
    pub source_lines: Vec<String>,
    pub source_map: Vec<SourceMap>,
    pub file_info: Vec<FileInfo>,
}
#[derive(Serialize, Deserialize, Debug)]
pub struct FileInfo {
    pub name: PathBuf,
    pub file_type: FileType,
}
#[derive(Serialize, Deserialize, Debug)]
pub enum FileType {
    Jack,
    Vm,
    Asm,
    C,
    Unknown,
}
#[derive(Serialize, Deserialize, Debug)]
pub struct VarSym {
    pub name: String,
    // pub module_id: i64,
    pub var_type: i64,
    pub storage_class: i64,
    pub size: i64,
    pub address: i64,
    pub instance_type: String,
}
#[derive(Serialize, Deserialize, Debug)]
pub struct SourceMap {
    pub file: usize,
    pub line_no: usize,
    pub col_no: usize,
    pub addr: u16,
}
#[derive(Serialize, Deserialize, Debug)]
pub struct FuncSym {
    name: String,
}
pub struct CompilerData {
    pub module_name: String,
    pub source_file: String,
    pub vars: Vec<VarSym>,
    pub funcs: Vec<FuncSym>,
    pub source_lines: Vec<String>,
    // pub source_map: Vec<SourceMap>,
}
// impl CompilerData {
//     pub fn new() -> Self {
//         Self {
//             module_name: String::new(),
//             source_file: String::new(),
//             vars: Vec::new(),
//             funcs: Vec::new(),
//             source_lines: Vec::new(),
//         }
//     }
//     pub fn add_var(
//         &mut self,
//         name: &String,
//         var_type: i64,
//         storage_class: i64,
//         size: i64,
//         address: i64,
//     ) {
//         self.vars.push(VarSym {
//             name: name.clone(),
//             var_type,
//             storage_class,
//             size,
//             address,
//         });
//     }
// }

impl Pdb {
    pub fn new() -> Self {
        Self {
            vars: Vec::new(),
            funcs: Vec::new(),
            source_lines: Vec::new(),
            source_map: Vec::new(),
            file_info: Vec::new(),
        }
    }
    pub fn load_json(json: &str) -> Result<Self> {
        let pdb: Pdb = serde_json::from_str(json)?;
        Ok(pdb)
    }
    pub fn save_json(&self) -> Result<String> {
        let json = serde_json::to_string_pretty(&self)?;
        Ok(json)
    }
}
