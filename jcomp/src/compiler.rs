use std::{fs, path::PathBuf};

use anyhow::Result;
use pest::{iterators::Pair, Parser};

use super::symbols::{SymbolTable, VarKind, VarType};

#[derive(pest_derive::Parser)]
#[grammar = "jack.pest"]
pub struct JackParser;

pub struct Compiler {
    class_name: String,
    global_symbols: SymbolTable,
    subroutine_symbols: SymbolTable,
    code: Vec<String>,
    subroutine_kind: SubroutineKind,
}
enum SubroutineKind {
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
                    // for line in self.code.iter() {
                    //     println!("{}", line);
                    // }
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
            _ => unreachable!(),
        };
        self.global_symbols
            .insert(name_str.to_string(), vtype, kind)?;
        Ok(())
    }
    fn write(&mut self, line: &str) {
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
        Ok(())
    }
    fn do_statments(&mut self, pair: Pair<Rule>) {
        let pair_iter = pair.into_inner();
        for pair in pair_iter {
            match pair.as_rule() {
                Rule::do_st => self.do_subcall(pair),
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
            self.do_sub_var(pair, VarKind::Local)?;
            local_count += 1;
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
    fn do_sub_var(&mut self, pair: Pair<Rule>, kind: VarKind) -> Result<()> {
        let mut pair_iter = pair.into_inner();

        let type_str = pair_iter.next().unwrap().as_str();
        let name_str = pair_iter.next().unwrap().as_str();

        let vtype = match type_str {
            "int" => VarType::Int,
            "char" => VarType::Char,
            "boolean" => VarType::Bool,

            _ => unreachable!(),
        };
        self.subroutine_symbols
            .insert(name_str.to_string(), vtype, kind)?;
        Ok(())
    }
    fn do_let(&mut self, pair: Pair<Rule>) {
        let mut pair_iter = pair.into_inner();

        let name_str = pair_iter.next().unwrap().as_str();
        println!("let name {:?}", name_str);
        let maybe_idx = pair_iter.next().unwrap();
        let expr = if maybe_idx.as_rule() == Rule::array_index {
            self.do_expr(maybe_idx);
            pair_iter.next().unwrap()
        } else {
            maybe_idx
        };
        println!("{:?}", expr.as_rule());
        self.do_expr(expr);

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
    fn do_term(&mut self, term: Pair<Rule>) {
        println!("term {:?}", term.as_str());
        match term.as_rule() {
            Rule::int => {
                self.write(&format!("push constant {}", term.as_str()));
            }
            Rule::identifier => {
                let name = term.as_str();
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
                        let symbol = self.global_symbols.get(name).unwrap();
                        match symbol.var_kind {
                            VarKind::Field => {
                                self.write(&format!("push this {}", symbol.number));
                            }
                            VarKind::Static => {
                                self.write(&format!("push static {}", symbol.number));
                            }
                            _ => unreachable!(),
                        }
                    }
                }
            }
            Rule::string => {
                let s = term.as_str();
                self.write(&format!("push constant {}", s.len()));
                self.write("call String.new 1");
                for c in s.chars() {
                    self.write(&format!("push constant {}", c as u32));
                    self.write("call String.appendChar 2");
                }
            }
            Rule::expression => {
                self.do_expr(term);
            }
            _ => {
                unreachable!()
            }
        }
    }
    fn do_expr(&mut self, pair: Pair<Rule>) {
        let mut pair_iter = pair.into_inner();
        let first_term = pair_iter.next().unwrap();
        self.do_term(first_term);
        // println!("ft {:?}", first_term.as_str());
        loop {
            if let Some(op) = pair_iter.next() {
                let term = pair_iter.next().unwrap();
                println!("op {:?}", op.as_str());
                self.do_term(term);
                match op.as_str() {
                    "+" => self.write("add"),
                    "-" => self.write("sub"),
                    "<" => self.write("lt"),
                    ">" => self.write("gt"),
                    "&" => self.write("and"),
                    "|" => self.write("or"),
                    "*" => self.mul(),
                    "/" => self.div(),
                    _ => unreachable!(),
                }
            } else {
                break;
            }
        }
    }
    fn div(&mut self) {}
    fn mul(&mut self) {
        println!("mul");
        self.write("call Math.multiply 2");
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
    fn do_subcall(&mut self, pair: Pair<Rule>) {
        let mut pair_iter = pair.into_inner();
        let mut name = pair_iter.next().unwrap().as_str().to_string();
        // next is either .name or arg list
        let mut maybe_name_or_args = pair_iter.next().unwrap();
        if maybe_name_or_args.as_rule() == Rule::identifier {
            name = format!("{}.{}", name, maybe_name_or_args.as_str());
            maybe_name_or_args = pair_iter.next().unwrap();
        } else {
            name = format!("{}.{}", self.class_name, name);
        }
        let mut arg_count = 0;
        for arg in maybe_name_or_args.into_inner() {
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
