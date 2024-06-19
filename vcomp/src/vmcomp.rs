use crate::constants;
use anyhow::Result;
use pest::{iterators::Pair, Parser};
use std::fs;
#[derive(pest_derive::Parser)]
#[grammar = "vm.pest"]
pub struct VMParser;
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

pub struct VMComp {
    code: Vec<String>,
    file_name: String,
    label_count: i32,
    current_function: String,
    current_module: String,
}
impl VMComp {
    pub fn new() -> Self {
        Self {
            code: Vec::new(),
            file_name: String::new(),
            label_count: 0,
            current_function: String::new(),
            current_module: String::new(),
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
            self.write(&format!("// {}", pair.as_str()));

            match pair.as_rule() {
                Rule::push_st => self.push(pair)?,
                Rule::pop_st => self.pop(pair)?,
                Rule::add_st => self.emit_op("+"),
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
                        self.current_function.split(".").next().unwrap().to_string();
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
    fn pop(&mut self, pair: Pair<Rule>) -> Result<()> {
        let mut pair_iter = pair.into_inner();
        let segment = pair_iter.next().unwrap();
        let index_str = pair_iter.next().unwrap().as_str().trim();
        let index = u16::from_str_radix(index_str, 10)?;
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
                self.write(&format!("@{}.{}", self.current_module, index));
                self.write("M=D");
            }

            _ => {
                unreachable!("Unknown segment");
            }
        }

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

        // self.emit_push(PushSource::A);
        // self.write("@LCL");
        // self.write("D=M");
        // self.emit_push(PushSource::D);
        // self.write("@ARG");
        // self.write("D=M");
        // self.emit_push(PushSource::D);
        // self.write("@THIS");
        // self.write("D=M");
        // self.emit_push(PushSource::D);
        // self.write("@THAT");
        // self.write("D=M");
        // self.emit_push(PushSource::D);
        // self.write("@SP");
        // self.write("D=M");
        // self.write("@5");
        // self.write("D=D-A");

        // self.write(&format!("@{}", args));
        // self.write("D=D-A");
        // self.write("@ARG");
        // self.write("M=D");
        // self.write("@SP");
        // self.write("D=M");
        // self.write("@LCL");
        // self.write("M=D");
        // self.write(&format!("@{}", name));
        // self.write("0;JMP");
        // self.write(&format!("({})", return_label));
        Ok(())
    }
    fn return_st(&mut self) -> Result<()> {
        self.write("@FW__RETURN");
        self.write("0;JMP");
        Ok(())
    }
    // fn return_stx(&mut self) -> Result<()> {
    //     self.write("@LCL");
    //     self.write("D=M");
    //     self.write("@R13"); // R13 = frame
    //     self.write("M=D");
    //     self.write("@5");
    //     self.write("A=D-A");
    //     self.write("D=M");
    //     self.write("@R14");
    //     self.write("M=D"); // retaddr

    //     self.emit_dec_load_sp();
    //     self.write("D=M");
    //     self.write("@ARG");
    //     self.write("A=M");
    //     self.write("M=D");

    //     self.write("@ARG");
    //     self.write("D=M+1");
    //     self.write("@SP");
    //     self.write("M=D");

    //     self.write("@R13");
    //     self.write("D=M");
    //     self.write("A=D-1");
    //     self.write("D=M");
    //     self.write("@THAT");
    //     self.write("M=D");

    //     self.write("@2");
    //     self.write("D=A");
    //     self.write("@R13");
    //     self.write("A=M-D");
    //     self.write("D=M");
    //     self.write("@THIS");
    //     self.write("M=D");

    //     self.write("@3");
    //     self.write("D=A");
    //     self.write("@R13");
    //     self.write("A=M-D");
    //     self.write("D=M");
    //     self.write("@ARG");
    //     self.write("M=D");

    //     self.write("@4");
    //     self.write("D=A");
    //     self.write("@R13");
    //     self.write("A=M-D");
    //     self.write("D=M");
    //     self.write("@LCL");
    //     self.write("M=D");

    //     self.write("@R14");
    //     self.write("A=M");
    //     self.write("0;JMP");

    //     Ok(())
    // }
    fn make_label(&mut self) -> String {
        self.label_count += 1;
        format!("L_{}_{}", self.file_name, self.label_count)
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
