use std::path::PathBuf;

use anyhow::Result;

use serde::{Deserialize, Serialize};

#[derive(Serialize, Deserialize, Debug)]
pub struct Pdb {
    pub symbols: Vec<Symbol>,
    pub source_lines: Vec<String>,
    pub source_map: Vec<SourceMap>,
    pub file_info: Vec<FileInfo>,
}
#[derive(Serialize, Deserialize, Debug)]
pub struct FileInfo {
    pub name: PathBuf,
    pub file_type: FileType,
}
#[derive(Serialize, Deserialize, Debug, Clone, PartialEq)]
pub enum FileType {
    Jack,
    Vm,
    Asm,
    C,
    Unknown,
}
#[derive(Serialize, Deserialize, Debug, PartialEq, Clone)]
pub enum SymbolType {
    Func,
    Var,
    Label,
    Unknown,
}
#[derive(Serialize, Deserialize, Debug, Clone, PartialEq)]
pub struct Symbol {
    pub symbol_type: SymbolType,

    pub name: String,
    pub func_type: i64,
    pub var_type: i64,
    pub storage_class: i64,
    pub size: i64,
    pub address: u16,
    pub instance_type: String,
    pub file_type: FileType,
}
#[derive(Serialize, Deserialize, Debug)]
pub struct SourceMap {
    pub file: usize,
    pub line_no: usize,
    pub col_no: usize,
    pub addr: u16,
}
//#[derive(Serialize, Deserialize, Debug)]
// pub struct FuncSym {
//     pub name: String,
//     pub func_type: i64,
//     pub address: u16,
//     pub file_type: FileType,
// }

impl Default for Pdb {
    fn default() -> Self {
        Self::new()
    }
}

impl Pdb {
    pub fn new() -> Self {
        Self {
            symbols: Vec::new(),
            //funcs: Vec::new(),
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
