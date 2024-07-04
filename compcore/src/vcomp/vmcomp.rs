use crate::constants;
use anyhow::Result;
use pest::{iterators::Pair, Parser};
use std::fs;
#[derive(pest_derive::Parser)]
#[grammar = "vcomp/vm.pest"]
pub struct VMParser;
#[allow(dead_code)]
enum PushSource {
    Constant(i16),
    A,
    D,
}
enum Comparison {
    Eq,
    Lt,
    Gt,
}
#[derive(Clone)]
struct Push {
    segment: Rule,
    index: i16,
    offset: usize,
}
pub struct VMComp {
    code: Vec<String>,
    file_name: String,
    label_count: i32,
    current_function: String,
    current_module: String,
    last_push: Option<Push>,
}

impl Default for VMComp {
    fn default() -> Self {
        Self::new()
    }
}

impl VMComp {
    pub fn new() -> Self {
        Self {
            code: Vec::new(),
            file_name: String::new(),
            label_count: 0,
            current_function: String::new(),
            current_module: String::new(),
            last_push: None,
        }
    }
    pub fn output_code(&self, output_name: &str) -> Result<()> {
        let code = self.code.join("\n");
        fs::write(output_name, code).expect("Unable to write file");
        Ok(())
    }
    pub fn bootstrap(&mut self) -> Result<()> {
        self.write("@256");
        self.write("D=A");
        self.write("@SP");
        self.write("M=D");
        self.file_name = "Sys".to_string();
        self.emit_call("Sys.init".to_string(), "0".to_string())?;

        Ok(())
    }

    // this code is emitted at the end of the file
    // it has the huge common code for call and return
    // call and return statments emit branches to this code

    pub fn emit_firmware(&mut self) -> Result<()> {
        // common return routine

        self.write("(FW__RETURN)");
        self.write("@LCL");
        self.write("D=M");
        self.write("@R13"); // R13 = frame
        self.write("M=D");
        self.write("@5");
        self.write("A=D-A");
        self.write("D=M");
        self.write("@R14");
        self.write("M=D"); // retaddr

        self.emit_dec_load_sp();
        self.write("D=M");
        self.write("@ARG");
        self.write("A=M");
        self.write("M=D");

        self.write("@ARG");
        self.write("D=M+1");
        self.write("@SP");
        self.write("M=D");

        self.write("@R13");
        self.write("D=M");
        self.write("A=D-1");
        self.write("D=M");
        self.write("@THAT");
        self.write("M=D");

        self.write("@2");
        self.write("D=A");
        self.write("@R13");
        self.write("A=M-D");
        self.write("D=M");
        self.write("@THIS");
        self.write("M=D");

        self.write("@3");
        self.write("D=A");
        self.write("@R13");
        self.write("A=M-D");
        self.write("D=M");
        self.write("@ARG");
        self.write("M=D");

        self.write("@4");
        self.write("D=A");
        self.write("@R13");
        self.write("A=M-D");
        self.write("D=M");
        self.write("@LCL");
        self.write("M=D");

        self.write("@R14");
        self.write("A=M");
        self.write("0;JMP");

        // common call routine
        // entered with
        // D= return label
        // R13 = arg count
        // R14 = sub to call

        self.write("(FW__CALL)");
        self.emit_push(PushSource::D);
        self.write("@LCL");
        self.write("D=M");
        self.emit_push(PushSource::D);
        self.write("@ARG");
        self.write("D=M");
        self.emit_push(PushSource::D);
        self.write("@THIS");
        self.write("D=M");
        self.emit_push(PushSource::D);
        self.write("@THAT");
        self.write("D=M");
        self.emit_push(PushSource::D);
        self.write("@SP");
        self.write("D=M");
        self.write("@5");
        self.write("D=D-A");

        self.write("@R13");
        self.write("D=D-M");
        self.write("@ARG");
        self.write("M=D");
        self.write("@SP");
        self.write("D=M");
        self.write("@LCL");
        self.write("M=D");
        self.write("@R14");
        self.write("A=M");
        self.write("0;JMP");

        Ok(())
    }
    pub fn run(&mut self, source: &str, file_name: &str) -> Result<()> {
        self.file_name = file_name.to_string();
        self.current_function = String::new();
        self.current_module = String::new();
        let pairs = VMParser::parse(Rule::program, source)?;
        for pair in pairs {
            // insert original source line as comment
            let source_line = pair.as_str();
            if pair.as_rule() != Rule::comment {
                self.write(&format!("// {}", source_line));
            }

            if pair.as_rule() != Rule::pop_st && pair.as_rule() != Rule::add_st {
                self.last_push = None;
            }

            match pair.as_rule() {
                Rule::comment => {
                    if source_line.starts_with("// ++pdb ") {
                        self.write(source_line);
                    }
                }
                Rule::push_st => self.push(pair)?,
                Rule::pop_st => self.pop(pair, source_line)?,
                Rule::add_st => {
                    if let Some(ref push) = self.last_push {
                        if push.segment == Rule::constant {
                            self.fast_add_const(push.index as u16, source_line)?;
                            //self.emit_op("+");
                            //  println!("pushc add @ {}", self.code.len());
                        } else {
                            self.emit_op("+");
                        }
                    } else {
                        self.emit_op("+");
                    }
                    self.last_push = None;
                }
                Rule::sub_st => self.emit_op("-"),
                Rule::and_st => self.emit_op("&"),
                Rule::or_st => self.emit_op("|"),
                Rule::eq_st => self.emit_cmp(Comparison::Eq),
                Rule::lt_st => self.emit_cmp(Comparison::Lt),
                Rule::gt_st => self.emit_cmp(Comparison::Gt),
                Rule::neg_st => self.emit_neg(),
                Rule::not_st => self.emit_not(),
                Rule::label => {
                    let label = pair.into_inner().next().unwrap().as_str();
                    self.write(&format!("({})", self.make_private_label(label)));
                }
                Rule::goto_st => {
                    let label = pair.into_inner().next().unwrap().as_str();
                    self.write(&format!("@{}", self.make_private_label(label)));
                    self.write("0;JMP");
                }
                Rule::if_goto_st => {
                    let label = pair.into_inner().next().unwrap().as_str();
                    self.emit_dec_load_sp();
                    self.write("D=M");
                    self.write(&format!("@{}", self.make_private_label(label)));
                    self.write("D;JNE");
                }
                Rule::function_st => {
                    let mut pair_iter = pair.into_inner();
                    let name = pair_iter.next().unwrap().as_str();
                    let locals = pair_iter.next().unwrap().as_str().trim();
                    self.write(&format!("({})", name));
                    self.current_function = name.to_string();
                    self.current_module =
                        self.current_function.split('.').next().unwrap().to_string();
                    for _ in 0..locals.parse::<u16>()? {
                        self.emit_push(PushSource::Constant(0));
                    }
                }
                Rule::call_st => {
                    self.call_st(pair)?;
                }
                Rule::return_st => {
                    self.return_st()?;
                }

                Rule::EOI => {}
                _ => unreachable!("Unknown rule"),
            }
        }
        Ok(())
    }
    fn push(&mut self, pair: Pair<Rule>) -> Result<()> {
        let mut pair_iter = pair.into_inner();
        let segment = pair_iter.next().unwrap();
        let index_str = pair_iter.next().unwrap().as_str().trim();
        let index = index_str.parse::<i16>()?;
        self.last_push = Some(Push {
            segment: segment.as_rule(),
            index,
            offset: self.code.len(),
        });
        match segment.as_rule() {
            Rule::local => {
                self.emit_load_ind_d(constants::LCL, index as u16);
                self.emit_push(PushSource::D);
            }
            Rule::constant => {
                self.emit_push(PushSource::Constant(index));
            }
            Rule::argument => {
                self.emit_load_ind_d(constants::ARG, index as u16);
                self.emit_push(PushSource::D);
            }
            Rule::this => self.emit_push_this_that(index as u16, "THIS"),
            Rule::that => self.emit_push_this_that(index as u16, "THAT"),
            Rule::temp => {
                self.write(&format!("@{}", constants::TEMP + index as u16));
                self.write("D=M");
                self.emit_push(PushSource::D);
            }
            Rule::pointer => {
                self.write(&format!("@{}", constants::POINTER + index as u16));
                self.write("D=M");
                self.emit_push(PushSource::D);
            }
            Rule::static_seg => {
                self.write(&format!("@{}.{}", self.current_module, index));
                self.write("D=M");
                self.emit_push(PushSource::D);
            }

            _ => {
                unreachable!("Unknown segment");
            }
        }

        Ok(())
    }
    fn pop(&mut self, pair: Pair<Rule>, line: &str) -> Result<()> {
        let mut pair_iter = pair.into_inner();
        let segment = pair_iter.next().unwrap();
        let index_str = pair_iter.next().unwrap().as_str().trim();
        let index = index_str.parse::<u16>()?;

        if self.last_push.is_some() {
            self.fast_push_pop(&segment.as_rule(), index, line)?;
            return Ok(());
        }

        match segment.as_rule() {
            Rule::local => {
                self.pop_to_seg_off(constants::LCL, index);
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
                self.write(&format!("@{}.{}", self.current_module, index));
                self.write("M=D");
            }

            _ => {
                unreachable!("Unknown segment");
            }
        }

        Ok(())
    }
    fn fast_add_const(&mut self, value: u16, source_line: &str) -> Result<()> {
        // optimization of
        // push constant x
        // add
        // this is the push we just generated
        let push = self.last_push.as_ref().unwrap().clone();
        // first remove the original push code
        self.code.truncate(push.offset);
        // now fast code
        self.write(&format!("@{}", value));
        self.write("D=A");
        self.write(&format!("// {}", source_line));
        self.write("@SP");
        self.write("A=M-1");
        self.write("M=D+M");
        self.last_push = None;
        Ok(())
    }
    fn fast_push_pop(&mut self, pop_segment: &Rule, pop_index: u16, line: &str) -> Result<()> {
        // this is an optimization step. If a push is followed by a pop then do not use the stack
        // do a transfer from the source to the destination
        // this is a common pattern in the generated code
        // it is not a general optimization

        // this is the push we just generated
        let push = self.last_push.as_ref().unwrap().clone();

        // first remove the original push code
        self.code.truncate(push.offset);

        // emit code to get value to push into D
        match push.segment {
            Rule::local => {
                self.emit_load_ind_d(constants::LCL, push.index as u16);
            }
            Rule::constant => {
                if push.index < 0 {
                    self.write(&format!("@{}", -push.index));
                    self.write("D=-A");
                } else {
                    self.write(&format!("@{}", push.index));
                    self.write("D=A");
                }
            }
            Rule::argument => {
                self.emit_load_ind_d(constants::ARG, push.index as u16);
            }
            Rule::this => self.emit_load_this_that(push.index as u16, "THIS"),
            Rule::that => self.emit_load_this_that(push.index as u16, "THAT"),
            Rule::temp => {
                self.write(&format!("@{}", constants::TEMP + push.index as u16));
                self.write("D=M");
            }
            Rule::pointer => {
                self.write(&format!("@{}", constants::POINTER + push.index as u16));
                self.write("D=M");
            }
            Rule::static_seg => {
                self.write(&format!("@{}.{}", self.current_module, push.index));
                self.write("D=M");
            }

            _ => {
                unreachable!("Unknown segment");
            }
        }
        // truncate just deleted this comment :-( so put it back
        self.write(&format!("// {}", line));
        // now load d into the destination
        match pop_segment {
            Rule::local => {
                self.d_to_seg_off(constants::LCL, pop_index);
            }

            Rule::argument => {
                self.d_to_seg_off(constants::ARG, pop_index);
            }
            Rule::this => {
                self.d_to_seg_off(constants::THIS, pop_index);
            }
            Rule::that => {
                self.d_to_seg_off(constants::THAT, pop_index);
            }
            Rule::temp => {
                self.write(&format!("@{}", constants::TEMP + pop_index));
                self.write("M=D");
            }
            Rule::pointer => {
                self.write(&format!("@{}", constants::POINTER + pop_index));
                self.write("M=D");
            }
            Rule::static_seg => {
                self.write(&format!("@{}.{}", self.current_module, pop_index));
                self.write("M=D");
            }

            _ => {
                unreachable!("Unknown segment");
            }
        }

        self.last_push = None;
        Ok(())
    }

    fn make_private_label(&self, label: &str) -> String {
        format!("{}.{}${}", self.file_name, self.current_function, label)
    }
    fn call_st(&mut self, pair: Pair<Rule>) -> Result<()> {
        let mut pair_iter = pair.into_inner();
        let name = pair_iter.next().unwrap().as_str();
        let args = pair_iter.next().unwrap().as_str();
        self.emit_call(name.to_string(), args.to_string())?;
        Ok(())
    }
    fn emit_call(&mut self, name: String, args: String) -> Result<()> {
        let return_label = self.make_label();

        // arg count => R13
        self.write(&format!("@{}", args));
        self.write("D=A");
        self.write("@R13");
        self.write("M=D");
        // sub to call => R14
        self.write(&format!("@{}", name));
        self.write("D=A");
        self.write("@R14");
        self.write("M=D");
        // return addr => D
        self.write(&format!("@{}", return_label));
        self.write("D=A");

        self.write("@FW__CALL");
        self.write("0;JMP");
        self.write(&format!("({})", return_label));

        Ok(())
    }
    fn return_st(&mut self) -> Result<()> {
        self.write("@FW__RETURN");
        self.write("0;JMP");
        Ok(())
    }

    fn make_label(&mut self) -> String {
        self.label_count += 1;
        format!("L_{}_{}", self.file_name, self.label_count)
    }
    fn emit_push_this_that(&mut self, index: u16, this_that: &str) {
        self.emit_load_this_that(index, this_that);
        self.emit_push(PushSource::D);
    }

    fn emit_load_this_that(&mut self, index: u16, this_that: &str) {
        self.write(&format!("@{}", this_that));
        self.write("D=M");
        self.write(&format!("@{}", index));
        self.write("A=D+A");
        self.write("D=M");
    }
    fn emit_dec_load_sp(&mut self) {
        // heavily used common code
        // pops stack and places address of tos in A
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
    fn emit_cmp(&mut self, cmp: Comparison) {
        self.emit_dec_load_sp();
        self.write("D=M");
        self.emit_dec_load_sp();

        self.write("D=D-M");

        let if_label = self.make_label();
        let exit_label = self.make_label();
        self.write(&format!("@{}", if_label));
        match cmp {
            Comparison::Eq => {
                self.write("D;JNE");
            }
            Comparison::Lt => {
                self.write("D;JLE");
            }
            Comparison::Gt => {
                self.write("D;JGE");
            }
        }

        self.write("D=-1");
        self.write(&format!("@{}", exit_label));
        self.write("D;JMP");

        self.write(&format!("({})", if_label));
        self.write("D=0");
        self.write(&format!("({})", exit_label));

        self.emit_push(PushSource::D);
    }
    fn emit_push(&mut self, from: PushSource) {
        match from {
            PushSource::Constant(val) => {
                if val < 0 {
                    self.write(&format!("@{}", -val));
                    self.write("D=-A");
                } else {
                    self.write(&format!("@{}", val));
                    self.write("D=A");
                }
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
        if offset != 0 {
            self.write(&format!("@{}", offset));
            self.write("D=D+A");
        }
        // store in R13
        self.write("@R13");
        self.write("M=D");
        // pop to D
        self.write("@SP");
        self.write("AM=M-1");
        //self.write("A=M");
        self.write("D=M");
        //store at *R13
        self.write("@R13");
        self.write("A=M");
        self.write("M=D");
    }
    fn d_to_seg_off(&mut self, seg: u16, offset: u16) {
        self.write("@R14");
        self.write("M=D");
        // R13 = *seg + offset
        // D= *SP--
        // *R13 = D

        // calculate target address
        self.write(&format!("@{}", seg));
        //self.write("A=M");
        self.write("D=M");
        if offset != 0 {
            self.write(&format!("@{}", offset));
            self.write("D=D+A");
        }
        // store in R13
        self.write("@R13");
        self.write("M=D");
        // pop to D
        self.write("@R14");
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
