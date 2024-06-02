use anyhow::Result;
use std::collections::HashMap;
//pub type SymbolTable = HashMap<String, Symbol>;
pub enum VarType {
    Int,
    Bool,
    Char,
    Instance,
}
#[derive(Debug, PartialEq)]
pub enum VarKind {
    Static,
    Field,
    Local,
}
pub struct Symbol {
    pub(crate) name: String,
    pub(crate) var_type: VarType,
    pub(crate) var_kind: VarKind,
    pub(crate) number: i32,
}
pub(crate) struct SymbolTable {
    table: HashMap<String, Symbol>,
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
            name: name.clone(),
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
}
