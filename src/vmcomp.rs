use crate::constants;
use anyhow::{Context, Result};
use pest::{iterators::Pair, Parser};
use std::{
    collections::HashMap,
    fs,
    io::{self, BufRead, Read},
};
#[derive(pest_derive::Parser)]
#[grammar = "vm.pest"]
pub struct VMParser;
enum PushSource {
    Constant(i16),
    A,
    D,
}
pub struct VMComp {
    code: Vec<String>,
    file_name: String,
}
impl VMComp {
    pub fn new() -> Self {
        Self {
            code: Vec::new(),
            file_name: String::new(),
        }
    }
    pub fn run(&mut self, source: &str, file_name: &str, output_name: &str) -> Result<()> {
        self.file_name = file_name.to_string();
        let pairs = VMParser::parse(Rule::program, source)?;
        for pair in pairs {
            match pair.as_rule() {
                // Rule::EOI => Ok(()),
                Rule::push_st => self.push(pair)?,
                Rule::pop_st => self.pop(pair)?,
                Rule::add_st => self.emit_op("+"),
                Rule::sub_st => self.emit_op("-"),
                Rule::and_st => self.emit_op("&"),
                Rule::or_st => self.emit_op("|"),
                Rule::eq_st => self.emit_op("-"),
                Rule::lt_st => self.emit_op("-"),
                Rule::gt_st => self.emit_op("-"),
                Rule::neg_st => self.emit_neg(),
                Rule::not_st => self.emit_not(),

                _ => {
                    let code = self.code.join("\n");
                    fs::write(output_name, code).expect("Unable to write file");
                    // for inst in &self.code {
                    //     println!("{}", inst);
                    // }
                }
            }
        }
        Ok(())
    }
    fn push(&mut self, pair: Pair<Rule>) -> Result<()> {
        // println!("push {:?}", pair);
        let mut pair_iter = pair.into_inner();
        let segment = pair_iter.next().unwrap();
        let index_str = pair_iter.next().unwrap().as_str();
        let index = u16::from_str_radix(index_str, 10)?;
        match segment.as_rule() {
            Rule::local => {
                self.emit_load_ind_d(constants::LCL, index);
                self.emit_push(PushSource::D);
            }
            Rule::constant => {
                self.emit_push(PushSource::Constant(index as i16));
            }
            Rule::argument => {
                self.emit_load_ind_d(constants::ARG, index);
                self.emit_push(PushSource::D);
            }
            Rule::this => self.emit_push_this_that(index, "THIS"),
            Rule::that => self.emit_push_this_that(index, "THAT"),
            Rule::temp => {
                self.write(&format!("@{}", constants::TEMP + index));
                self.write("D=M");
                self.emit_push(PushSource::D);
            }
            Rule::pointer => {
                self.write(&format!("@{}", constants::POINTER + index));
                self.write("D=M");
                self.emit_push(PushSource::D);
            }
            Rule::static_seg => {
                self.write(&format!("@{}.{}", self.file_name, index));
                self.write("D=M");
                self.emit_push(PushSource::D);
            }

            _ => {
                unreachable!("Unknown segment");
            }
        }

        // println!("push {} {}", segment, index);
        Ok(())
    }
    fn pop(&mut self, pair: Pair<Rule>) -> Result<()> {
        let mut pair_iter = pair.into_inner();
        let segment = pair_iter.next().unwrap();
        let index_str = pair_iter.next().unwrap().as_str();
        let index = u16::from_str_radix(index_str, 10)?;
        match segment.as_rule() {
            Rule::local => {
                self.pop_to_seg_off(constants::LCL, index);
            }
            Rule::constant => {
                // self.emit_push(PushSource::Constant(index as i16));
            }
            Rule::argument => {
                self.pop_to_seg_off(constants::ARG, index);
            }
            Rule::this => {
                self.pop_to_seg_off(constants::THIS, index);
            }
            Rule::that => {
                self.pop_to_seg_off(constants::THAT, index);
            }
            Rule::temp => {
                // self.pop_to_seg_off(constants::TEMP, index);
                self.emit_dec_load_sp();
                self.write("D=M");
                self.write(&format!("@{}", constants::TEMP + index));
                self.write("M=D");
            }
            Rule::pointer => {
                self.emit_dec_load_sp();
                self.write("D=M");
                self.write(&format!("@{}", constants::POINTER + index));
                self.write("M=D");
            }
            Rule::static_seg => {
                self.emit_dec_load_sp();
                self.write("D=M");
                self.write(&format!("@{}.{}", self.file_name, index));
                self.write("M=D");
            }

            _ => {
                unreachable!("Unknown segment");
            }
        }
        println!("pop {} {}", segment, index);
        Ok(())
    }
    fn emit_push_this_that(&mut self, index: u16, this_that: &str) {
        self.write(&format!("@{}", this_that));
        self.write("D=M");
        self.write(&format!("@{}", index));
        self.write("A=D+A");
        self.write("D=M");
        self.emit_push(PushSource::D);
    }
    fn emit_dec_load_sp(&mut self) {
        self.write("@SP");
        self.write("M=M-1");
        self.write("A=M");
    }
    fn emit_op(&mut self, op: &str) {
        self.emit_dec_load_sp();
        self.write("D=M");
        self.emit_dec_load_sp();

        self.write(&format!("M=D{}M", op));
        if op == "-" {
            self.write("M=-M");
        }
        self.write("@SP");
        self.write("M=M+1");
    }
    fn emit_push(&mut self, from: PushSource) {
        match from {
            PushSource::Constant(val) => {
                self.write(&format!("@{}", val));
                self.write("D=A");
            }
            PushSource::A => {
                self.write("D=A");
            }
            PushSource::D => {}
        }

        self.write("@SP");
        self.write("A=M");
        self.write("M=D");
        self.write("@SP");
        self.write("M=M+1");
    }
    fn emit_load_ind_d(&mut self, base: u16, offset: u16) {
        self.write(&format!("@{}", base));
        self.write("D=M");
        self.write(&format!("@{}", offset));
        self.write("A=D+A");

        self.write("D=M");
    }
    fn emit_neg(&mut self) {
        self.emit_dec_load_sp();
        self.write("M=-M");
        self.write("@SP");
        self.write("M=M+1");
    }
    fn emit_not(&mut self) {
        self.emit_dec_load_sp();
        self.write("M=!M");
        self.write("@SP");
        self.write("M=M+1");
    }

    fn pop_to_seg_off(&mut self, seg: u16, offset: u16) {
        // R13 = *seg + offset
        // D= *SP--
        // *R13 = D

        // calculate target address
        self.write(&format!("@{}", seg));
        //self.write("A=M");
        self.write("D=M");
        self.write(&format!("@{}", offset));
        self.write("D=D+A");
        // store in R13
        self.write("@R13");
        self.write("M=D");
        // pop to D
        self.write("@SP");
        self.write("M=M-1");
        self.write("A=M");
        self.write("D=M");
        //store at *R13
        self.write("@R13");
        self.write("A=M");
        self.write("M=D");
    }

    fn write(&mut self, inst: &str) {
        self.code.push(inst.to_string());
    }
}
