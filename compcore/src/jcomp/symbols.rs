use anyhow::Result;
use std::collections::HashMap;
#[derive(Debug, PartialEq, Clone)]
pub enum VarType {
    Int,
    Bool,
    Char,
    Instance(String),
}
#[derive(Debug, PartialEq, Clone)]
pub enum VarKind {
    Static,
    Field,
    Local,
    Argument,
}
#[derive(Debug, Clone)]
pub struct Symbol {
    pub(crate) var_type: VarType,
    pub(crate) var_kind: VarKind,
    pub(crate) number: i32,
}
pub(crate) struct SymbolTable {
    pub(crate) table: HashMap<String, Symbol>,
}

impl SymbolTable {
    pub(crate) fn new() -> Self {
        Self {
            table: HashMap::new(),
        }
    }

    pub(crate) fn insert(
        &mut self,
        name: String,
        var_type: VarType,
        var_kind: VarKind,
    ) -> Result<i32> {
        if self.table.contains_key(&name) {
            return Err(anyhow::anyhow!("Symbol already exists"));
        }
        let number = self
            .table
            .iter()
            .filter(|(_, symbol)| symbol.var_kind == var_kind)
            .count() as i32;
        let symbol = Symbol {
            var_type,
            var_kind,
            number,
        };
        self.table.insert(name, symbol);
        Ok(number)
    }
    pub(crate) fn get(&self, name: &str) -> Option<&Symbol> {
        self.table.get(name)
    }
    pub(crate) fn dump(&self) {
        for (name, symbol) in &self.table {
            println!("{}: {:?}", name, symbol);
        }
    }
    pub(crate) fn get_count(&self, kind: VarKind) -> i32 {
        self.table
            .iter()
            .filter(|(_, symbol)| symbol.var_kind == kind)
            .count() as i32
    }
}
