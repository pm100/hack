use std::fs;

use anyhow::Result;
use pest::{iterators::Pair, Parser};

use crate::symbols::Symbol;

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
#[derive(PartialEq)]
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
        loop {
            if let Some(name_str) = pair_iter.next() {
                self.global_symbols.insert(
                    name_str.as_str().to_string(),
                    vtype.clone(),
                    kind.clone(),
                )?;
            } else {
                break;
            }
        }
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
        let return_str = pair_iter.next().unwrap().as_str();
        let name_str = pair_iter.next().unwrap().as_str();
        let param_pair = pair_iter.next().unwrap();
        println!("{} {} {}", kind_str, return_str, name_str);

        // what kind is it?

        match kind_str {
            "constructor" => self.subroutine_kind = SubroutineKind::Constructor,
            "method" => self.subroutine_kind = SubroutineKind::Method,
            "function" => self.subroutine_kind = SubroutineKind::Function,
            _ => unreachable!(),
        }

        // methods get 'this' as arg0

        if self.subroutine_kind == SubroutineKind::Method {
            self.subroutine_symbols.insert(
                "this".to_string(),
                VarType::Instance(name_str.to_string()),
                VarKind::Argument,
            )?;
        }

        // args into the local symbol table

        for pair in param_pair.into_inner() {
            self.do_sub_var(pair, VarKind::Argument)?;
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

        for pair in pair_iter {
            self.do_sub_var(pair, VarKind::Local)?;
        }
        let local_count = self.subroutine_symbols.get_count(VarKind::Local);
        self.write(&format!(
            "function {}.{} {}",
            self.class_name, name, local_count
        ));
        match self.subroutine_kind {
            SubroutineKind::Constructor => {
                let field_count = self.global_symbols.get_count(VarKind::Field);
                self.global_symbols.dump();
                self.write(&format!("push constant {}", field_count));
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
    fn do_sub_var(&mut self, pair: Pair<Rule>, kind: VarKind) -> Result<()> {
        println!("{} {:?}=> ", pair.as_str(), pair.as_rule());
        let mut pair_iter = pair.into_inner();

        let type_str = pair_iter.next().unwrap().as_str();

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
        }
        Ok(())
    }

    fn do_lhs_array(&mut self, pair: Pair<Rule>) {
        let mut pair_iter = pair.into_inner();
        let name = pair_iter.next().unwrap().as_str();
        self.do_expr(pair_iter.next().unwrap());
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
        let name_pair = pair_iter.next().unwrap(); //.as_str().to_string();
                                                   //println!("sub name {}", name);
        let name;
        let mut arg_count = 0;
        match name_pair.as_rule() {
            Rule::identifier => {
                // func => this.func => ThisClass.func
                name = format!("{}.{}", self.class_name, name_pair.as_str());
                self.write("push pointer 0");
                arg_count += 1;
            }
            Rule::dotted_id => {
                let id = name_pair.as_str().to_string();
                let mut bits = id.split('.');
                let left = bits.next().unwrap().to_string();
                let func = bits.next().unwrap();

                // left hand side is either
                // - a local variable
                // - a global variable or field
                // - a class name Foo.func
                // in the first 2 replace foo.bar with ClassName.bar
                // Its the last one if its not a known symbol

                let sym = {
                    if let Some(symbol) = self.subroutine_symbols.get(&left) {
                        Some(symbol.clone())
                    } else {
                        if let Some(symbol) = self.global_symbols.get(&left) {
                            Some(symbol.clone())
                        } else {
                            None
                        }
                    }
                };
                let cl = if let Some(ref symbol) = sym {
                    match &symbol.var_type {
                        VarType::Instance(cl) => {
                            self.push_symbol(&symbol);
                            arg_count += 1;
                            cl
                        }
                        _ => &left,
                    }
                } else {
                    &left
                };
                name = format!("{}.{}", cl, func);
            }
            _ => unreachable!(),
        }
        // now arguments

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
        let true_label = format!("IFTRUE{}", self.code.len());
        let false_label = format!("IFFALSE{}", self.code.len());
        let end_label = format!("IFEND{}", self.code.len());
        self.write(&format!("if-goto {}", true_label));
        self.write(&format!("goto {}", false_label));
        self.write(&format!("label {}", true_label));

        let st = pair_iter.next().unwrap();
        self.do_statments(st);

        self.write(&format!("goto {}", end_label));
        self.write(&format!("label {}", false_label));
        if let Some(else_st) = pair_iter.next() {
            self.do_statments(else_st);
        }
        self.write(&format!("label {}", end_label));
    }
}
