use std::fs;

use anyhow::Result;
use pest::{iterators::Pair, Parser};

use super::symbols::{SymbolTable, VarKind, VarType};

#[derive(pest_derive::Parser)]
#[grammar = "jack.pest"]
pub struct JackParser;

pub struct Compiler {
    pub(crate) class_name: String,
    pub(crate) global_symbols: SymbolTable,
    pub(crate) subroutine_symbols: SymbolTable,
    pub(crate) code: Vec<String>,
    pub(crate) subroutine_kind: SubroutineKind,
}
pub(crate) enum SubroutineKind {
    Constructor,
    Function,
    Method,
    None,
}
impl Compiler {
    pub fn new() -> Self {
        Self {
            class_name: String::new(),
            global_symbols: SymbolTable::new(),
            subroutine_symbols: SymbolTable::new(),
            code: Vec::new(),
            subroutine_kind: SubroutineKind::None,
        }
    }
    pub fn output_code(&mut self, output_name: &str) -> Result<()> {
        self.code.push("\n".to_string());
        let code = self.code.join("\n");
        fs::write(output_name, code).expect("Unable to write file");
        Ok(())
    }

    pub fn run(&mut self, source: &str, _name: &str) -> Result<()> {
        let pairs = JackParser::parse(Rule::class_file, source)?;
        for pair in pairs {
            match pair.as_rule() {
                Rule::class_name => {
                    self.class_name = pair.as_str().to_string();
                }
                Rule::class_var => {
                    self.do_class_var(pair)?;
                }
                Rule::subroutine => {
                    self.do_subroutine(pair)?;
                }
                Rule::EOI => {
                    println!("Global symbols");
                    self.global_symbols.dump();
                }
                _ => {}
            }
        }

        Ok(())
    }
    fn do_class_var(&mut self, pair: Pair<Rule>) -> Result<()> {
        let mut pair_iter = pair.into_inner();
        let kind_str = pair_iter.next().unwrap().as_str();
        let type_str = pair_iter.next().unwrap().as_str();
        let name_str = pair_iter.next().unwrap().as_str();

        let kind = match kind_str {
            "field" => VarKind::Field,
            "static" => VarKind::Static,
            _ => unreachable!(),
        };
        let vtype = match type_str {
            "int" => VarType::Int,
            "char" => VarType::Char,
            "boolean" => VarType::Bool,
            _ => VarType::Instance(type_str.to_string()),
        };
        self.global_symbols
            .insert(name_str.to_string(), vtype, kind)?;
        Ok(())
    }
    pub(crate) fn write(&mut self, line: &str) {
        self.code.push(line.to_string());
    }
    fn do_subroutine(&mut self, pair: Pair<Rule>) -> Result<()> {
        // subroutine is constructor, method  or function (aka static)

        let mut pair_iter = pair.into_inner();
        self.subroutine_symbols = SymbolTable::new();
        let kind_str = pair_iter.next().unwrap().as_str();
        let name_str = pair_iter.next().unwrap().as_str();
        let param_pair = pair_iter.next().unwrap();

        // args into the local symbol table

        for pair in param_pair.into_inner() {
            self.do_sub_var(pair, VarKind::Argument)?;
        }

        // what kind is it?

        match kind_str {
            "constructor" => self.subroutine_kind = SubroutineKind::Constructor,
            "method" => self.subroutine_kind = SubroutineKind::Method,
            "function" => self.subroutine_kind = SubroutineKind::Function,
            _ => unreachable!(),
        }

        // body is
        // - one or more locals
        // - one or more statements
        // in that order, no mixing

        let var_pair = pair_iter.next().unwrap();
        self.do_variables(var_pair, name_str)?;
        let st_pair = pair_iter.next().unwrap();
        self.do_statments(st_pair);
        assert!(pair_iter.next().is_none());
        self.subroutine_symbols.dump();
        Ok(())
    }
    fn do_statments(&mut self, pair: Pair<Rule>) {
        let pair_iter = pair.into_inner();
        for pair in pair_iter {
            println!("{} => {:?}", pair.line_col().0, pair.as_str());
            match pair.as_rule() {
                Rule::do_st => {
                    self.do_subcall(pair.into_inner().next().unwrap());
                    self.write("pop temp 0");
                }

                Rule::let_st => self.do_let(pair),
                Rule::while_st => self.do_while(pair),
                Rule::return_st => self.do_return(pair),
                Rule::if_st => self.do_if(pair),
                _ => {
                    unreachable!("{:?}", pair.as_rule())
                }
            }
        }
    }
    fn do_variables(&mut self, pair: Pair<Rule>, name: &str) -> Result<()> {
        let pair_iter = pair.into_inner();
        let mut local_count = 0;
        for pair in pair_iter {
            local_count += self.do_sub_var(pair, VarKind::Local)?;
        }
        self.write(&format!(
            "function {}.{} {}",
            self.class_name, name, local_count
        ));
        match self.subroutine_kind {
            SubroutineKind::Constructor => {
                self.write(&format!("push constant {}", local_count));
                self.write("call Memory.alloc 1");
                self.write("pop pointer 0");
            }
            SubroutineKind::Method => {
                self.write("push argument 0");
                self.write("pop pointer 0");
            }
            _ => {}
        };
        Ok(())
    }
    fn do_sub_var(&mut self, pair: Pair<Rule>, kind: VarKind) -> Result<i32> {
        let mut pair_iter = pair.into_inner();

        let type_str = pair_iter.next().unwrap().as_str();
        let mut local_count = 0;
        loop {
            let maybe_name_str = pair_iter.next();
            if maybe_name_str.is_none() {
                break;
            }
            let name_str = maybe_name_str.unwrap().as_str();
            let vtype = match type_str {
                "int" => VarType::Int,
                "char" => VarType::Char,
                "boolean" => VarType::Bool,
                _ => VarType::Instance(type_str.to_string()),
            };
            self.subroutine_symbols
                .insert(name_str.to_string(), vtype, kind.clone())?;
            local_count += 1;
        }
        Ok(local_count)
    }

    fn do_lhs_array(&mut self, pair: Pair<Rule>) {
        let mut pair_iter = pair.into_inner();
        let name = pair_iter.next().unwrap().as_str();
        let symbol = self.subroutine_symbols.get(name);
        match symbol {
            Some(symbol) => match symbol.var_kind {
                VarKind::Local => {
                    self.write(&format!("push local {}", symbol.number));
                }
                VarKind::Field => {
                    self.write(&format!("push field {}", symbol.number));
                }
                VarKind::Static => {
                    self.write(&format!("push static {}", symbol.number));
                }
                VarKind::Argument => {
                    self.write(&format!("push argument {}", symbol.number));
                }
            },
            None => {
                if let Some(symbol) = self.global_symbols.get(name) {
                    match symbol.var_kind {
                        VarKind::Field => {
                            self.write(&format!("push this {}", symbol.number));
                        }
                        VarKind::Static => {
                            self.write(&format!("push static {}", symbol.number));
                        }
                        _ => unreachable!(),
                    }
                } else {
                    println!("Symbol {} not found", name);
                }
            }
        }
        self.do_expr(pair_iter.next().unwrap());
        self.write("add");
    }
    fn do_let(&mut self, pair: Pair<Rule>) {
        // let name<[expr]> = expr;

        // LHS first
        let mut pair_iter = pair.into_inner();

        let lhs = pair_iter.next().unwrap();

        let name_str = lhs.as_str();
        println!("lhs {:?} {}", lhs.as_rule(), lhs.as_str());
        let mut array = false;

        match lhs.as_rule() {
            Rule::array_var => {
                self.do_lhs_array(lhs);
                array = true;
            }
            Rule::identifier => {}
            _ => unreachable!(),
        }

        // array index?
        // let maybe_idx = pair_iter.next().unwrap();
        // let expr = if maybe_idx.as_rule() == Rule::array_index {
        //     // array on lhs
        //     array = true;
        //     self.do_lhs_array(name_str, maybe_idx);
        //     pair_iter.next().unwrap()
        // } else {
        //     maybe_idx
        // };

        // now the expression

        let expr = pair_iter.next().unwrap();
        println!("rhs {:?} {}", expr.as_rule(), expr.as_str());
        self.do_expr(expr);

        // finally pop the value to the correct variable
        if array {
            self.write("pop temp 0");
            self.write("pop pointer 1");
            self.write("push temp 0");
            self.write("pop that 0");
        } else {
            let symbol = self.subroutine_symbols.get(name_str);
            match symbol {
                Some(symbol) => match symbol.var_kind {
                    VarKind::Local => {
                        self.write(&format!("pop local {}", symbol.number));
                    }
                    VarKind::Field => {
                        self.write(&format!("pop field {}", symbol.number));
                    }
                    VarKind::Static => {
                        self.write(&format!("pop static {}", symbol.number));
                    }
                    VarKind::Argument => {
                        self.write(&format!("pop argument {}", symbol.number));
                    }
                },
                None => {
                    if let Some(symbol) = self.global_symbols.get(name_str) {
                        match symbol.var_kind {
                            VarKind::Field => {
                                self.write(&format!("pop this {}", symbol.number));
                            }
                            VarKind::Static => {
                                self.write(&format!("pop static {}", symbol.number));
                            }
                            _ => unreachable!(),
                        }
                    } else {
                        println!("Symbol {} not found", name_str);
                    }
                }
            }
        }
    }

    fn do_return(&mut self, pair: Pair<Rule>) {
        let mut pair_iter = pair.into_inner();
        if let Some(expr) = pair_iter.next() {
            self.do_expr(expr);
        } else {
            self.write("push constant 0");
        }
        self.write("return");
    }
    pub(crate) fn do_subcall(&mut self, pair: Pair<Rule>) {
        let mut pair_iter = pair.into_inner();
        // first is name
        let name = pair_iter.next().unwrap().as_str().to_string();
        println!("sub name {}", name);
        // now arguments
        let mut arg_count = 0;
        for arg in pair_iter.next().unwrap().into_inner() {
            arg_count += 1;
            self.do_expr(arg);
        }
        self.write(&format!("call {} {}", name, arg_count));
    }

    fn do_while(&mut self, pair: Pair<Rule>) {
        let mut pair_iter = pair.into_inner();
        let label = format!("WHILE{}", self.code.len());
        self.write(&format!("label {}", label));
        let expr = pair_iter.next().unwrap();
        self.do_expr(expr);
        self.write("not");
        let end_label = format!("ENDWHILE{}", self.code.len());
        self.write(&format!("if-goto {}", end_label));
        let st = pair_iter.next().unwrap();
        self.do_statments(st);
        self.write(&format!("goto {}", label));
        self.write(&format!("label {}", end_label));
    }

    fn do_if(&mut self, pair: Pair<Rule>) {
        let mut pair_iter = pair.into_inner();
        let expr = pair_iter.next().unwrap();
        self.do_expr(expr);
        let label = format!("IF{}", self.code.len());
        self.write(&format!("if-goto {}", label));
        let st = pair_iter.next().unwrap();
        self.do_statments(st);
        let end_label = format!("ENDIF{}", self.code.len());
        self.write(&format!("goto {}", end_label));
        self.write(&format!("label {}", label));
        if let Some(else_st) = pair_iter.next() {
            self.do_statments(else_st);
        }
        self.write(&format!("label {}", end_label));
    }
}
