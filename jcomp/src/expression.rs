use pest::iterators::Pair;

use crate::{
    compiler::{Compiler, Rule},
    symbols::{Symbol, VarKind},
};

impl Compiler {
    pub(crate) fn push_symbol(&mut self, symbol: &Symbol) {
        match symbol.var_kind {
            VarKind::Local => {
                self.write(&format!("push local {}", symbol.number));
            }
            VarKind::Field => {
                self.write(&format!("push this {}", symbol.number));
            }
            VarKind::Static => {
                self.write(&format!("push static {}", symbol.number));
            }
            VarKind::Argument => {
                self.write(&format!("push argument {}", symbol.number));
            }
        }
    }
    pub(crate) fn lookup_push_symbol(&mut self, name: &str) {
        let symbol = self.subroutine_symbols.get(name);
        match symbol {
            Some(symbol) => self.push_symbol(&symbol.clone()),

            None => {
                if let Some(symbol) = self.global_symbols.get(name) {
                    self.push_symbol(&symbol.clone())
                } else {
                    println!("Symbol {} not found", name);
                }
            }
        }
    }
    pub(crate) fn do_term(&mut self, term: Pair<Rule>) {
        // a term of an expression
        // places the value of the term on the stack
        // term is an integer constant, string constant, keyword constant, var name, array entry, or subroutine call
        // or an expression in parentheses

        println!("term {:?} {:?}", term.as_str(), term.as_rule());
        match term.as_rule() {
            Rule::int => {
                self.write(&format!("push constant {}", term.as_str()));
            }
            Rule::subroutine_call => {
                self.do_subcall(term);
            }
            Rule::identifier => {
                let name = term.as_str();
                self.lookup_push_symbol(name);
            }
            Rule::array_var => {
                let mut array_var_iter = term.into_inner();
                let name = array_var_iter.next().unwrap().as_str();
                println!("array_var {}", name);
                self.lookup_push_symbol(name);
                let index = array_var_iter.next().unwrap();
                self.do_expr(index);
                self.write("add");
                self.write("pop pointer 1");
                self.write("push that 0");
            }
            Rule::string => {
                let s = term.as_str().trim_matches('"');
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
                println!("unknown term {:?},{}", term.as_rule(), term.as_str());
            }
        }
    }
    pub(crate) fn do_expr(&mut self, pair: Pair<Rule>) {
        // compiles an expression, places the resulting vaue at top of stack
        // expression is term ~ (op ~ term)*

        let mut pair_iter = pair.into_inner();
        let first_term = pair_iter.next().unwrap();

        // match first_term.as_rule() {
        //     Rule::term => self.do_term(first_term),
        //     Rule::subroutine_call => self.do_subcall(first_term),
        //     _ => unreachable!("{:?} {:?}", first_term.as_rule(), first_term.as_str()),
        // }
        println!("ft {:?} {:?}", first_term.as_str(), first_term.as_rule());
        self.do_term(first_term);
        loop {
            if let Some(op) = pair_iter.next() {
                println!("op {:?}", op.as_str());
                let term = pair_iter.next().unwrap();

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
    fn div(&mut self) {
        self.write("call Math.divide 2");
    }
    fn mul(&mut self) {
        println!("mul");
        self.write("call Math.multiply 2");
    }
}
