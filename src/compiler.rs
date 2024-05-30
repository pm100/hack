use std::collections::HashMap;

use anyhow::Result;
use pest::{iterators::Pair, Parser};

#[derive(pest_derive::Parser)]
#[grammar = "jack.pest"]
pub struct JackParser;

pub struct Compiler {
    class_name: String,
    global_symbols: HashMap<String, Symbol>,
    subroutine_symbols: HashMap<String, Symbol>,
    code: Vec<String>,
}
enum VarType {
    Int,
    Bool,
    Char,
    Instance,
}
enum VarKind {
    Static,
    Field,
    Local,
}
struct Symbol {
    name: String,
    var_type: VarType,
    var_kind: VarKind,
}
impl Compiler {
    pub fn new() -> Self {
        Self {
            class_name: String::new(),
            global_symbols: HashMap::new(),
            subroutine_symbols: HashMap::new(),
            code: Vec::new(),
        }
    }
    pub fn run(&mut self, source: &str, _name: &str, _output: &str) -> Result<()> {
        let mut pairs = JackParser::parse(Rule::class_file, source)?;
        for pair in pairs {
            match pair.as_rule() {
                Rule::class_name => {
                    self.class_name = pair.as_str().to_string();
                }
                Rule::class_var => {
                    self.do_class_var(pair);
                }
                Rule::subroutine => {
                    self.do_subroutine(pair);
                }
                Rule::EOI => {
                    for line in self.code.iter() {
                        println!("{}", line);
                    }
                }
                _ => {}
            }
        }

        Ok(())
    }
    fn do_class_var(&mut self, pair: Pair<Rule>) {
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
        let symbol = Symbol {
            name: String::new(),
            var_kind: kind,
            var_type: vtype,
        };
        self.global_symbols.insert(name_str.to_string(), symbol);
    }
    fn write(&mut self, line: &str) {
        self.code.push(line.to_string());
    }
    fn do_subroutine(&mut self, pair: Pair<Rule>) {
        let mut pair_iter = pair.into_inner();
        self.subroutine_symbols.clear();
        let kind_str = pair_iter.next().unwrap().as_str();
        let name_str = pair_iter.next().unwrap().as_str();
        let param_pair = pair_iter.next().unwrap();
        //   self.write(&format!("function {}.{} {}", self.class_name, name_str, local_count));

        for pair in pair_iter {
            match pair.as_rule() {
                Rule::variables => {
                    self.do_variables(pair, name_str);
                }
                Rule::statements => {
                    self.do_statments(pair);
                }

                _ => {
                    unreachable!("{:?}", pair.as_rule())
                }
            }
        }
    }
    fn do_statments(&mut self, pair: Pair<Rule>) {
        let mut pair_iter = pair.into_inner();
        for pair in pair_iter {
            match pair.as_rule() {
                Rule::do_st => {}
                Rule::let_st => self.do_let(pair),
                Rule::while_st => {}
                Rule::return_st => {}
                Rule::if_st => {}
                _ => {
                    unreachable!("{:?}", pair.as_rule())
                }
            }
        }
    }
    fn do_variables(&mut self, pair: Pair<Rule>, name: &str) {
        let mut pair_iter = pair.into_inner();
        let mut local_count = 0;
        for pair in pair_iter {
            self.do_sub_var(pair);
            local_count += 1;
        }
        self.write(&format!(
            "function {}.{} {}",
            self.class_name, name, local_count
        ));
    }
    fn do_sub_var(&mut self, pair: Pair<Rule>) {
        let mut pair_iter = pair.into_inner();

        let type_str = pair_iter.next().unwrap().as_str();
        let name_str = pair_iter.next().unwrap().as_str();

        let vtype = match type_str {
            "int" => VarType::Int,
            "char" => VarType::Char,
            "boolean" => VarType::Bool,
            _ => unreachable!(),
        };
        let symbol = Symbol {
            name: String::new(),
            var_kind: VarKind::Local,
            var_type: vtype,
        };
        self.subroutine_symbols.insert(name_str.to_string(), symbol);
    }
    fn do_let(&mut self, pair: Pair<Rule>) {
        let mut pair_iter = pair.into_inner();

        let name_str = pair_iter.next().unwrap().as_str();
        println!("let name {:?}", name_str);
        // let func_str = pair_iter.next().unwrap().as_str();
        // let expr_list = pair_iter.next().unwrap();
        for pair in pair_iter {
            println!("let {:?}", pair.as_rule());
            match pair.as_rule() {
                Rule::expression => {
                    self.do_expr(pair);
                }
                _ => {}
            }
        }
    }
    fn do_expr(&mut self, pair: Pair<Rule>) {
        let mut pair_iter = pair.into_inner();

        for pair in pair_iter {
            println!("let x{:?}", pair.as_rule());
            match pair.as_rule() {
                Rule::int => {
                    println!("int {:?}", pair.as_str());
                    self.write(&format!("push constant {}", pair.as_str()));
                }
                Rule::op => match pair.as_str() {
                    "+" => self.write("add"),
                    "-" => self.write("sub"),
                    "<" => self.write("lt"),
                    ">" => self.write("gt"),
                    "&" => self.write("and"),
                    "|" => self.write("or"),
                    "*" => self.mul(),
                    "/" => self.div(),
                    _ => unreachable!(),
                },
                Rule::identifier => {
                    println!("{}", pair.as_str())
                }
                Rule::expression => self.do_expr(pair),

                _ => {}
            }
        }
    }
    fn div(&mut self) {}
    fn mul(&mut self) {
        println!("mul")
    }
}
