@256
D=A
@SP
M=D
@0
D=A
@R13
M=D
@Sys.init
D=A
@R14
M=D
@L_Sys_1
D=A
@FW__CALL
0;JMP
(L_Sys_1)
(FW__RETURN)
@LCL
D=M
@R13
M=D
@5
A=D-A
D=M
@R14
M=D
@SP
M=M-1
A=M
D=M
@ARG
A=M
M=D
@ARG
D=M+1
@SP
M=D
@R13
D=M
A=D-1
D=M
@THAT
M=D
@2
D=A
@R13
A=M-D
D=M
@THIS
M=D
@3
D=A
@R13
A=M-D
D=M
@ARG
M=D
@4
D=A
@R13
A=M-D
D=M
@LCL
M=D
@R14
A=M
0;JMP
(FW__CALL)
@SP
A=M
M=D
@SP
M=M+1
@LCL
D=M
@SP
A=M
M=D
@SP
M=M+1
@ARG
D=M
@SP
A=M
M=D
@SP
M=M+1
@THIS
D=M
@SP
A=M
M=D
@SP
M=M+1
@THAT
D=M
@SP
A=M
M=D
@SP
M=M+1
@SP
D=M
@5
D=D-A
@R13
D=D-M
@ARG
M=D
@SP
D=M
@LCL
M=D
@R14
A=M
0;JMP
// function Array.new 0
(Array.new)
// push argument 0
@2
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// gt
@SP
M=M-1
A=M
D=M
@SP
M=M-1
A=M
D=D-M
@L_Array_2
D;JGE
D=-1
@L_Array_3
D;JMP
(L_Array_2)
D=0
(L_Array_3)
@SP
A=M
M=D
@SP
M=M+1
// not
@SP
M=M-1
A=M
M=!M
@SP
M=M+1
// if-goto IF_TRUE0
@SP
M=M-1
A=M
D=M
@Array.Array.new$IF_TRUE0
D;JNE
// goto IF_FALSE0
@Array.Array.new$IF_FALSE0
0;JMP
// label IF_TRUE0
(Array.Array.new$IF_TRUE0)
// push constant 2
@2
D=A
@SP
A=M
M=D
@SP
M=M+1
// call Sys.error 1
@1
D=A
@R13
M=D
@Sys.error
D=A
@R14
M=D
@L_Array_4
D=A
@FW__CALL
0;JMP
(L_Array_4)
// pop temp 0
@SP
M=M-1
A=M
D=M
@5
M=D
// label IF_FALSE0
(Array.Array.new$IF_FALSE0)
// push argument 0
@2
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// call Memory.alloc 1
@1
D=A
@R13
M=D
@Memory.alloc
D=A
@R14
M=D
@L_Array_5
D=A
@FW__CALL
0;JMP
(L_Array_5)
// return
@FW__RETURN
0;JMP
// function Array.dispose 0
(Array.dispose)
// push argument 0
@2
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// pop pointer 0
@SP
M=M-1
A=M
D=M
@3
M=D
// push pointer 0
@3
D=M
@SP
A=M
M=D
@SP
M=M+1
// call Memory.deAlloc 1
@1
D=A
@R13
M=D
@Memory.deAlloc
D=A
@R14
M=D
@L_Array_6
D=A
@FW__CALL
0;JMP
(L_Array_6)
// pop temp 0
@SP
M=M-1
A=M
D=M
@5
M=D
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// return
@FW__RETURN
0;JMP
// 
// function Keyboard.init 0
(Keyboard.init)
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// return
@FW__RETURN
0;JMP
// function Keyboard.keyPressed 0
(Keyboard.keyPressed)
// push constant 24576
@24576
D=A
@SP
A=M
M=D
@SP
M=M+1
// call Memory.peek 1
@1
D=A
@R13
M=D
@Memory.peek
D=A
@R14
M=D
@L_Keyboard_7
D=A
@FW__CALL
0;JMP
(L_Keyboard_7)
// return
@FW__RETURN
0;JMP
// function Keyboard.readChar 2
(Keyboard.readChar)
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// call Output.printChar 1
@1
D=A
@R13
M=D
@Output.printChar
D=A
@R14
M=D
@L_Keyboard_8
D=A
@FW__CALL
0;JMP
(L_Keyboard_8)
// pop temp 0
@SP
M=M-1
A=M
D=M
@5
M=D
// label WHILE_EXP0
(Keyboard.Keyboard.readChar$WHILE_EXP0)
// push local 1
@1
D=M
@1
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// eq
@SP
M=M-1
A=M
D=M
@SP
M=M-1
A=M
D=D-M
@L_Keyboard_9
D;JNE
D=-1
@L_Keyboard_10
D;JMP
(L_Keyboard_9)
D=0
(L_Keyboard_10)
@SP
A=M
M=D
@SP
M=M+1
// push local 0
@1
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// gt
@SP
M=M-1
A=M
D=M
@SP
M=M-1
A=M
D=D-M
@L_Keyboard_11
D;JGE
D=-1
@L_Keyboard_12
D;JMP
(L_Keyboard_11)
D=0
(L_Keyboard_12)
@SP
A=M
M=D
@SP
M=M+1
// or
@SP
M=M-1
A=M
D=M
@SP
M=M-1
A=M
M=D|M
@SP
M=M+1
// not
@SP
M=M-1
A=M
M=!M
@SP
M=M+1
// if-goto WHILE_END0
@SP
M=M-1
A=M
D=M
@Keyboard.Keyboard.readChar$WHILE_END0
D;JNE
// call Keyboard.keyPressed 0
@0
D=A
@R13
M=D
@Keyboard.keyPressed
D=A
@R14
M=D
@L_Keyboard_13
D=A
@FW__CALL
0;JMP
(L_Keyboard_13)
// pop local 0
@1
D=M
@0
D=D+A
@R13
M=D
@SP
M=M-1
A=M
D=M
@R13
A=M
M=D
// push local 0
@1
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// gt
@SP
M=M-1
A=M
D=M
@SP
M=M-1
A=M
D=D-M
@L_Keyboard_14
D;JGE
D=-1
@L_Keyboard_15
D;JMP
(L_Keyboard_14)
D=0
(L_Keyboard_15)
@SP
A=M
M=D
@SP
M=M+1
// if-goto IF_TRUE0
@SP
M=M-1
A=M
D=M
@Keyboard.Keyboard.readChar$IF_TRUE0
D;JNE
// goto IF_FALSE0
@Keyboard.Keyboard.readChar$IF_FALSE0
0;JMP
// label IF_TRUE0
(Keyboard.Keyboard.readChar$IF_TRUE0)
// push local 0
@1
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// pop local 1
@1
D=M
@1
D=D+A
@R13
M=D
@SP
M=M-1
A=M
D=M
@R13
A=M
M=D
// label IF_FALSE0
(Keyboard.Keyboard.readChar$IF_FALSE0)
// goto WHILE_EXP0
@Keyboard.Keyboard.readChar$WHILE_EXP0
0;JMP
// label WHILE_END0
(Keyboard.Keyboard.readChar$WHILE_END0)
// call String.backSpace 0
@0
D=A
@R13
M=D
@String.backSpace
D=A
@R14
M=D
@L_Keyboard_16
D=A
@FW__CALL
0;JMP
(L_Keyboard_16)
// call Output.printChar 1
@1
D=A
@R13
M=D
@Output.printChar
D=A
@R14
M=D
@L_Keyboard_17
D=A
@FW__CALL
0;JMP
(L_Keyboard_17)
// pop temp 0
@SP
M=M-1
A=M
D=M
@5
M=D
// push local 1
@1
D=M
@1
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// call Output.printChar 1
@1
D=A
@R13
M=D
@Output.printChar
D=A
@R14
M=D
@L_Keyboard_18
D=A
@FW__CALL
0;JMP
(L_Keyboard_18)
// pop temp 0
@SP
M=M-1
A=M
D=M
@5
M=D
// push local 1
@1
D=M
@1
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// return
@FW__RETURN
0;JMP
// function Keyboard.readLine 5
(Keyboard.readLine)
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 80
@80
D=A
@SP
A=M
M=D
@SP
M=M+1
// call String.new 1
@1
D=A
@R13
M=D
@String.new
D=A
@R14
M=D
@L_Keyboard_19
D=A
@FW__CALL
0;JMP
(L_Keyboard_19)
// pop local 3
@1
D=M
@3
D=D+A
@R13
M=D
@SP
M=M-1
A=M
D=M
@R13
A=M
M=D
// push argument 0
@2
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// call Output.printString 1
@1
D=A
@R13
M=D
@Output.printString
D=A
@R14
M=D
@L_Keyboard_20
D=A
@FW__CALL
0;JMP
(L_Keyboard_20)
// pop temp 0
@SP
M=M-1
A=M
D=M
@5
M=D
// call String.newLine 0
@0
D=A
@R13
M=D
@String.newLine
D=A
@R14
M=D
@L_Keyboard_21
D=A
@FW__CALL
0;JMP
(L_Keyboard_21)
// pop local 1
@1
D=M
@1
D=D+A
@R13
M=D
@SP
M=M-1
A=M
D=M
@R13
A=M
M=D
// call String.backSpace 0
@0
D=A
@R13
M=D
@String.backSpace
D=A
@R14
M=D
@L_Keyboard_22
D=A
@FW__CALL
0;JMP
(L_Keyboard_22)
// pop local 2
@1
D=M
@2
D=D+A
@R13
M=D
@SP
M=M-1
A=M
D=M
@R13
A=M
M=D
// label WHILE_EXP0
(Keyboard.Keyboard.readLine$WHILE_EXP0)
// push local 4
@1
D=M
@4
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// not
@SP
M=M-1
A=M
M=!M
@SP
M=M+1
// not
@SP
M=M-1
A=M
M=!M
@SP
M=M+1
// if-goto WHILE_END0
@SP
M=M-1
A=M
D=M
@Keyboard.Keyboard.readLine$WHILE_END0
D;JNE
// call Keyboard.readChar 0
@0
D=A
@R13
M=D
@Keyboard.readChar
D=A
@R14
M=D
@L_Keyboard_23
D=A
@FW__CALL
0;JMP
(L_Keyboard_23)
// pop local 0
@1
D=M
@0
D=D+A
@R13
M=D
@SP
M=M-1
A=M
D=M
@R13
A=M
M=D
// push local 0
@1
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// push local 1
@1
D=M
@1
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// eq
@SP
M=M-1
A=M
D=M
@SP
M=M-1
A=M
D=D-M
@L_Keyboard_24
D;JNE
D=-1
@L_Keyboard_25
D;JMP
(L_Keyboard_24)
D=0
(L_Keyboard_25)
@SP
A=M
M=D
@SP
M=M+1
// pop local 4
@1
D=M
@4
D=D+A
@R13
M=D
@SP
M=M-1
A=M
D=M
@R13
A=M
M=D
// push local 4
@1
D=M
@4
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// not
@SP
M=M-1
A=M
M=!M
@SP
M=M+1
// if-goto IF_TRUE0
@SP
M=M-1
A=M
D=M
@Keyboard.Keyboard.readLine$IF_TRUE0
D;JNE
// goto IF_FALSE0
@Keyboard.Keyboard.readLine$IF_FALSE0
0;JMP
// label IF_TRUE0
(Keyboard.Keyboard.readLine$IF_TRUE0)
// push local 0
@1
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// push local 2
@1
D=M
@2
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// eq
@SP
M=M-1
A=M
D=M
@SP
M=M-1
A=M
D=D-M
@L_Keyboard_26
D;JNE
D=-1
@L_Keyboard_27
D;JMP
(L_Keyboard_26)
D=0
(L_Keyboard_27)
@SP
A=M
M=D
@SP
M=M+1
// if-goto IF_TRUE1
@SP
M=M-1
A=M
D=M
@Keyboard.Keyboard.readLine$IF_TRUE1
D;JNE
// goto IF_FALSE1
@Keyboard.Keyboard.readLine$IF_FALSE1
0;JMP
// label IF_TRUE1
(Keyboard.Keyboard.readLine$IF_TRUE1)
// push local 3
@1
D=M
@3
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// call String.eraseLastChar 1
@1
D=A
@R13
M=D
@String.eraseLastChar
D=A
@R14
M=D
@L_Keyboard_28
D=A
@FW__CALL
0;JMP
(L_Keyboard_28)
// pop temp 0
@SP
M=M-1
A=M
D=M
@5
M=D
// goto IF_END1
@Keyboard.Keyboard.readLine$IF_END1
0;JMP
// label IF_FALSE1
(Keyboard.Keyboard.readLine$IF_FALSE1)
// push local 3
@1
D=M
@3
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// push local 0
@1
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// call String.appendChar 2
@2
D=A
@R13
M=D
@String.appendChar
D=A
@R14
M=D
@L_Keyboard_29
D=A
@FW__CALL
0;JMP
(L_Keyboard_29)
// pop local 3
@1
D=M
@3
D=D+A
@R13
M=D
@SP
M=M-1
A=M
D=M
@R13
A=M
M=D
// label IF_END1
(Keyboard.Keyboard.readLine$IF_END1)
// label IF_FALSE0
(Keyboard.Keyboard.readLine$IF_FALSE0)
// goto WHILE_EXP0
@Keyboard.Keyboard.readLine$WHILE_EXP0
0;JMP
// label WHILE_END0
(Keyboard.Keyboard.readLine$WHILE_END0)
// push local 3
@1
D=M
@3
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// return
@FW__RETURN
0;JMP
// function Keyboard.readInt 2
(Keyboard.readInt)
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// push argument 0
@2
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// call Keyboard.readLine 1
@1
D=A
@R13
M=D
@Keyboard.readLine
D=A
@R14
M=D
@L_Keyboard_30
D=A
@FW__CALL
0;JMP
(L_Keyboard_30)
// pop local 0
@1
D=M
@0
D=D+A
@R13
M=D
@SP
M=M-1
A=M
D=M
@R13
A=M
M=D
// push local 0
@1
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// call String.intValue 1
@1
D=A
@R13
M=D
@String.intValue
D=A
@R14
M=D
@L_Keyboard_31
D=A
@FW__CALL
0;JMP
(L_Keyboard_31)
// pop local 1
@1
D=M
@1
D=D+A
@R13
M=D
@SP
M=M-1
A=M
D=M
@R13
A=M
M=D
// push local 0
@1
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// call String.dispose 1
@1
D=A
@R13
M=D
@String.dispose
D=A
@R14
M=D
@L_Keyboard_32
D=A
@FW__CALL
0;JMP
(L_Keyboard_32)
// pop temp 0
@SP
M=M-1
A=M
D=M
@5
M=D
// push local 1
@1
D=M
@1
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// return
@FW__RETURN
0;JMP
// 
// function Math.init 1
(Math.init)
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 16
@16
D=A
@SP
A=M
M=D
@SP
M=M+1
// call Array.new 1
@1
D=A
@R13
M=D
@Array.new
D=A
@R14
M=D
@L_Math_33
D=A
@FW__CALL
0;JMP
(L_Math_33)
// pop static 1
@SP
M=M-1
A=M
D=M
@Math.1
M=D
// push constant 16
@16
D=A
@SP
A=M
M=D
@SP
M=M+1
// call Array.new 1
@1
D=A
@R13
M=D
@Array.new
D=A
@R14
M=D
@L_Math_34
D=A
@FW__CALL
0;JMP
(L_Math_34)
// pop static 0
@SP
M=M-1
A=M
D=M
@Math.0
M=D
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// push static 0
@Math.0
D=M
@SP
A=M
M=D
@SP
M=M+1
// add
@SP
M=M-1
A=M
D=M
@SP
M=M-1
A=M
M=D+M
@SP
M=M+1
// push constant 1
@1
D=A
@SP
A=M
M=D
@SP
M=M+1
// pop temp 0
@SP
M=M-1
A=M
D=M
@5
M=D
// pop pointer 1
@SP
M=M-1
A=M
D=M
@4
M=D
// push temp 0
@5
D=M
@SP
A=M
M=D
@SP
M=M+1
// pop that 0
@4
D=M
@0
D=D+A
@R13
M=D
@SP
M=M-1
A=M
D=M
@R13
A=M
M=D
// label WHILE_EXP0
(Math.Math.init$WHILE_EXP0)
// push local 0
@1
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// push constant 15
@15
D=A
@SP
A=M
M=D
@SP
M=M+1
// lt
@SP
M=M-1
A=M
D=M
@SP
M=M-1
A=M
D=D-M
@L_Math_35
D;JLE
D=-1
@L_Math_36
D;JMP
(L_Math_35)
D=0
(L_Math_36)
@SP
A=M
M=D
@SP
M=M+1
// not
@SP
M=M-1
A=M
M=!M
@SP
M=M+1
// if-goto WHILE_END0
@SP
M=M-1
A=M
D=M
@Math.Math.init$WHILE_END0
D;JNE
// push local 0
@1
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// push constant 1
@1
D=A
@SP
A=M
M=D
@SP
M=M+1
// add
@SP
M=M-1
A=M
D=M
@SP
M=M-1
A=M
M=D+M
@SP
M=M+1
// pop local 0
@1
D=M
@0
D=D+A
@R13
M=D
@SP
M=M-1
A=M
D=M
@R13
A=M
M=D
// push local 0
@1
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// push static 0
@Math.0
D=M
@SP
A=M
M=D
@SP
M=M+1
// add
@SP
M=M-1
A=M
D=M
@SP
M=M-1
A=M
M=D+M
@SP
M=M+1
// push local 0
@1
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// push constant 1
@1
D=A
@SP
A=M
M=D
@SP
M=M+1
// sub
@SP
M=M-1
A=M
D=M
@SP
M=M-1
A=M
M=D-M
M=-M
@SP
M=M+1
// push static 0
@Math.0
D=M
@SP
A=M
M=D
@SP
M=M+1
// add
@SP
M=M-1
A=M
D=M
@SP
M=M-1
A=M
M=D+M
@SP
M=M+1
// pop pointer 1
@SP
M=M-1
A=M
D=M
@4
M=D
// push that 0
@THAT
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// push local 0
@1
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// push constant 1
@1
D=A
@SP
A=M
M=D
@SP
M=M+1
// sub
@SP
M=M-1
A=M
D=M
@SP
M=M-1
A=M
M=D-M
M=-M
@SP
M=M+1
// push static 0
@Math.0
D=M
@SP
A=M
M=D
@SP
M=M+1
// add
@SP
M=M-1
A=M
D=M
@SP
M=M-1
A=M
M=D+M
@SP
M=M+1
// pop pointer 1
@SP
M=M-1
A=M
D=M
@4
M=D
// push that 0
@THAT
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// add
@SP
M=M-1
A=M
D=M
@SP
M=M-1
A=M
M=D+M
@SP
M=M+1
// pop temp 0
@SP
M=M-1
A=M
D=M
@5
M=D
// pop pointer 1
@SP
M=M-1
A=M
D=M
@4
M=D
// push temp 0
@5
D=M
@SP
A=M
M=D
@SP
M=M+1
// pop that 0
@4
D=M
@0
D=D+A
@R13
M=D
@SP
M=M-1
A=M
D=M
@R13
A=M
M=D
// goto WHILE_EXP0
@Math.Math.init$WHILE_EXP0
0;JMP
// label WHILE_END0
(Math.Math.init$WHILE_END0)
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// return
@FW__RETURN
0;JMP
// function Math.abs 0
(Math.abs)
// push argument 0
@2
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// lt
@SP
M=M-1
A=M
D=M
@SP
M=M-1
A=M
D=D-M
@L_Math_37
D;JLE
D=-1
@L_Math_38
D;JMP
(L_Math_37)
D=0
(L_Math_38)
@SP
A=M
M=D
@SP
M=M+1
// if-goto IF_TRUE0
@SP
M=M-1
A=M
D=M
@Math.Math.abs$IF_TRUE0
D;JNE
// goto IF_FALSE0
@Math.Math.abs$IF_FALSE0
0;JMP
// label IF_TRUE0
(Math.Math.abs$IF_TRUE0)
// push argument 0
@2
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// neg
@SP
M=M-1
A=M
M=-M
@SP
M=M+1
// pop argument 0
@2
D=M
@0
D=D+A
@R13
M=D
@SP
M=M-1
A=M
D=M
@R13
A=M
M=D
// label IF_FALSE0
(Math.Math.abs$IF_FALSE0)
// push argument 0
@2
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// return
@FW__RETURN
0;JMP
// function Math.multiply 5
(Math.multiply)
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// push argument 0
@2
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// lt
@SP
M=M-1
A=M
D=M
@SP
M=M-1
A=M
D=D-M
@L_Math_39
D;JLE
D=-1
@L_Math_40
D;JMP
(L_Math_39)
D=0
(L_Math_40)
@SP
A=M
M=D
@SP
M=M+1
// push argument 1
@2
D=M
@1
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// gt
@SP
M=M-1
A=M
D=M
@SP
M=M-1
A=M
D=D-M
@L_Math_41
D;JGE
D=-1
@L_Math_42
D;JMP
(L_Math_41)
D=0
(L_Math_42)
@SP
A=M
M=D
@SP
M=M+1
// and
@SP
M=M-1
A=M
D=M
@SP
M=M-1
A=M
M=D&M
@SP
M=M+1
// push argument 0
@2
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// gt
@SP
M=M-1
A=M
D=M
@SP
M=M-1
A=M
D=D-M
@L_Math_43
D;JGE
D=-1
@L_Math_44
D;JMP
(L_Math_43)
D=0
(L_Math_44)
@SP
A=M
M=D
@SP
M=M+1
// push argument 1
@2
D=M
@1
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// lt
@SP
M=M-1
A=M
D=M
@SP
M=M-1
A=M
D=D-M
@L_Math_45
D;JLE
D=-1
@L_Math_46
D;JMP
(L_Math_45)
D=0
(L_Math_46)
@SP
A=M
M=D
@SP
M=M+1
// and
@SP
M=M-1
A=M
D=M
@SP
M=M-1
A=M
M=D&M
@SP
M=M+1
// or
@SP
M=M-1
A=M
D=M
@SP
M=M-1
A=M
M=D|M
@SP
M=M+1
// pop local 4
@1
D=M
@4
D=D+A
@R13
M=D
@SP
M=M-1
A=M
D=M
@R13
A=M
M=D
// push argument 0
@2
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// call Math.abs 1
@1
D=A
@R13
M=D
@Math.abs
D=A
@R14
M=D
@L_Math_47
D=A
@FW__CALL
0;JMP
(L_Math_47)
// pop argument 0
@2
D=M
@0
D=D+A
@R13
M=D
@SP
M=M-1
A=M
D=M
@R13
A=M
M=D
// push argument 1
@2
D=M
@1
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// call Math.abs 1
@1
D=A
@R13
M=D
@Math.abs
D=A
@R14
M=D
@L_Math_48
D=A
@FW__CALL
0;JMP
(L_Math_48)
// pop argument 1
@2
D=M
@1
D=D+A
@R13
M=D
@SP
M=M-1
A=M
D=M
@R13
A=M
M=D
// push argument 0
@2
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// push argument 1
@2
D=M
@1
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// lt
@SP
M=M-1
A=M
D=M
@SP
M=M-1
A=M
D=D-M
@L_Math_49
D;JLE
D=-1
@L_Math_50
D;JMP
(L_Math_49)
D=0
(L_Math_50)
@SP
A=M
M=D
@SP
M=M+1
// if-goto IF_TRUE0
@SP
M=M-1
A=M
D=M
@Math.Math.multiply$IF_TRUE0
D;JNE
// goto IF_FALSE0
@Math.Math.multiply$IF_FALSE0
0;JMP
// label IF_TRUE0
(Math.Math.multiply$IF_TRUE0)
// push argument 0
@2
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// pop local 1
@1
D=M
@1
D=D+A
@R13
M=D
@SP
M=M-1
A=M
D=M
@R13
A=M
M=D
// push argument 1
@2
D=M
@1
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// pop argument 0
@2
D=M
@0
D=D+A
@R13
M=D
@SP
M=M-1
A=M
D=M
@R13
A=M
M=D
// push local 1
@1
D=M
@1
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// pop argument 1
@2
D=M
@1
D=D+A
@R13
M=D
@SP
M=M-1
A=M
D=M
@R13
A=M
M=D
// label IF_FALSE0
(Math.Math.multiply$IF_FALSE0)
// label WHILE_EXP0
(Math.Math.multiply$WHILE_EXP0)
// push local 2
@1
D=M
@2
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// push constant 1
@1
D=A
@SP
A=M
M=D
@SP
M=M+1
// sub
@SP
M=M-1
A=M
D=M
@SP
M=M-1
A=M
M=D-M
M=-M
@SP
M=M+1
// push argument 1
@2
D=M
@1
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// push constant 1
@1
D=A
@SP
A=M
M=D
@SP
M=M+1
// sub
@SP
M=M-1
A=M
D=M
@SP
M=M-1
A=M
M=D-M
M=-M
@SP
M=M+1
// lt
@SP
M=M-1
A=M
D=M
@SP
M=M-1
A=M
D=D-M
@L_Math_51
D;JLE
D=-1
@L_Math_52
D;JMP
(L_Math_51)
D=0
(L_Math_52)
@SP
A=M
M=D
@SP
M=M+1
// not
@SP
M=M-1
A=M
M=!M
@SP
M=M+1
// if-goto WHILE_END0
@SP
M=M-1
A=M
D=M
@Math.Math.multiply$WHILE_END0
D;JNE
// push local 3
@1
D=M
@3
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// push static 0
@Math.0
D=M
@SP
A=M
M=D
@SP
M=M+1
// add
@SP
M=M-1
A=M
D=M
@SP
M=M-1
A=M
M=D+M
@SP
M=M+1
// pop pointer 1
@SP
M=M-1
A=M
D=M
@4
M=D
// push that 0
@THAT
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// push argument 1
@2
D=M
@1
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// and
@SP
M=M-1
A=M
D=M
@SP
M=M-1
A=M
M=D&M
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// eq
@SP
M=M-1
A=M
D=M
@SP
M=M-1
A=M
D=D-M
@L_Math_53
D;JNE
D=-1
@L_Math_54
D;JMP
(L_Math_53)
D=0
(L_Math_54)
@SP
A=M
M=D
@SP
M=M+1
// not
@SP
M=M-1
A=M
M=!M
@SP
M=M+1
// if-goto IF_TRUE1
@SP
M=M-1
A=M
D=M
@Math.Math.multiply$IF_TRUE1
D;JNE
// goto IF_FALSE1
@Math.Math.multiply$IF_FALSE1
0;JMP
// label IF_TRUE1
(Math.Math.multiply$IF_TRUE1)
// push local 0
@1
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// push argument 0
@2
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// add
@SP
M=M-1
A=M
D=M
@SP
M=M-1
A=M
M=D+M
@SP
M=M+1
// pop local 0
@1
D=M
@0
D=D+A
@R13
M=D
@SP
M=M-1
A=M
D=M
@R13
A=M
M=D
// push local 2
@1
D=M
@2
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// push local 3
@1
D=M
@3
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// push static 0
@Math.0
D=M
@SP
A=M
M=D
@SP
M=M+1
// add
@SP
M=M-1
A=M
D=M
@SP
M=M-1
A=M
M=D+M
@SP
M=M+1
// pop pointer 1
@SP
M=M-1
A=M
D=M
@4
M=D
// push that 0
@THAT
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// add
@SP
M=M-1
A=M
D=M
@SP
M=M-1
A=M
M=D+M
@SP
M=M+1
// pop local 2
@1
D=M
@2
D=D+A
@R13
M=D
@SP
M=M-1
A=M
D=M
@R13
A=M
M=D
// label IF_FALSE1
(Math.Math.multiply$IF_FALSE1)
// push argument 0
@2
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// push argument 0
@2
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// add
@SP
M=M-1
A=M
D=M
@SP
M=M-1
A=M
M=D+M
@SP
M=M+1
// pop argument 0
@2
D=M
@0
D=D+A
@R13
M=D
@SP
M=M-1
A=M
D=M
@R13
A=M
M=D
// push local 3
@1
D=M
@3
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// push constant 1
@1
D=A
@SP
A=M
M=D
@SP
M=M+1
// add
@SP
M=M-1
A=M
D=M
@SP
M=M-1
A=M
M=D+M
@SP
M=M+1
// pop local 3
@1
D=M
@3
D=D+A
@R13
M=D
@SP
M=M-1
A=M
D=M
@R13
A=M
M=D
// goto WHILE_EXP0
@Math.Math.multiply$WHILE_EXP0
0;JMP
// label WHILE_END0
(Math.Math.multiply$WHILE_END0)
// push local 4
@1
D=M
@4
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// if-goto IF_TRUE2
@SP
M=M-1
A=M
D=M
@Math.Math.multiply$IF_TRUE2
D;JNE
// goto IF_FALSE2
@Math.Math.multiply$IF_FALSE2
0;JMP
// label IF_TRUE2
(Math.Math.multiply$IF_TRUE2)
// push local 0
@1
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// neg
@SP
M=M-1
A=M
M=-M
@SP
M=M+1
// pop local 0
@1
D=M
@0
D=D+A
@R13
M=D
@SP
M=M-1
A=M
D=M
@R13
A=M
M=D
// label IF_FALSE2
(Math.Math.multiply$IF_FALSE2)
// push local 0
@1
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// return
@FW__RETURN
0;JMP
// function Math.divide 4
(Math.divide)
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// push argument 1
@2
D=M
@1
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// eq
@SP
M=M-1
A=M
D=M
@SP
M=M-1
A=M
D=D-M
@L_Math_55
D;JNE
D=-1
@L_Math_56
D;JMP
(L_Math_55)
D=0
(L_Math_56)
@SP
A=M
M=D
@SP
M=M+1
// if-goto IF_TRUE0
@SP
M=M-1
A=M
D=M
@Math.Math.divide$IF_TRUE0
D;JNE
// goto IF_FALSE0
@Math.Math.divide$IF_FALSE0
0;JMP
// label IF_TRUE0
(Math.Math.divide$IF_TRUE0)
// push constant 3
@3
D=A
@SP
A=M
M=D
@SP
M=M+1
// call Sys.error 1
@1
D=A
@R13
M=D
@Sys.error
D=A
@R14
M=D
@L_Math_57
D=A
@FW__CALL
0;JMP
(L_Math_57)
// pop temp 0
@SP
M=M-1
A=M
D=M
@5
M=D
// label IF_FALSE0
(Math.Math.divide$IF_FALSE0)
// push argument 0
@2
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// lt
@SP
M=M-1
A=M
D=M
@SP
M=M-1
A=M
D=D-M
@L_Math_58
D;JLE
D=-1
@L_Math_59
D;JMP
(L_Math_58)
D=0
(L_Math_59)
@SP
A=M
M=D
@SP
M=M+1
// push argument 1
@2
D=M
@1
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// gt
@SP
M=M-1
A=M
D=M
@SP
M=M-1
A=M
D=D-M
@L_Math_60
D;JGE
D=-1
@L_Math_61
D;JMP
(L_Math_60)
D=0
(L_Math_61)
@SP
A=M
M=D
@SP
M=M+1
// and
@SP
M=M-1
A=M
D=M
@SP
M=M-1
A=M
M=D&M
@SP
M=M+1
// push argument 0
@2
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// gt
@SP
M=M-1
A=M
D=M
@SP
M=M-1
A=M
D=D-M
@L_Math_62
D;JGE
D=-1
@L_Math_63
D;JMP
(L_Math_62)
D=0
(L_Math_63)
@SP
A=M
M=D
@SP
M=M+1
// push argument 1
@2
D=M
@1
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// lt
@SP
M=M-1
A=M
D=M
@SP
M=M-1
A=M
D=D-M
@L_Math_64
D;JLE
D=-1
@L_Math_65
D;JMP
(L_Math_64)
D=0
(L_Math_65)
@SP
A=M
M=D
@SP
M=M+1
// and
@SP
M=M-1
A=M
D=M
@SP
M=M-1
A=M
M=D&M
@SP
M=M+1
// or
@SP
M=M-1
A=M
D=M
@SP
M=M-1
A=M
M=D|M
@SP
M=M+1
// pop local 2
@1
D=M
@2
D=D+A
@R13
M=D
@SP
M=M-1
A=M
D=M
@R13
A=M
M=D
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// push static 1
@Math.1
D=M
@SP
A=M
M=D
@SP
M=M+1
// add
@SP
M=M-1
A=M
D=M
@SP
M=M-1
A=M
M=D+M
@SP
M=M+1
// push argument 1
@2
D=M
@1
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// call Math.abs 1
@1
D=A
@R13
M=D
@Math.abs
D=A
@R14
M=D
@L_Math_66
D=A
@FW__CALL
0;JMP
(L_Math_66)
// pop temp 0
@SP
M=M-1
A=M
D=M
@5
M=D
// pop pointer 1
@SP
M=M-1
A=M
D=M
@4
M=D
// push temp 0
@5
D=M
@SP
A=M
M=D
@SP
M=M+1
// pop that 0
@4
D=M
@0
D=D+A
@R13
M=D
@SP
M=M-1
A=M
D=M
@R13
A=M
M=D
// push argument 0
@2
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// call Math.abs 1
@1
D=A
@R13
M=D
@Math.abs
D=A
@R14
M=D
@L_Math_67
D=A
@FW__CALL
0;JMP
(L_Math_67)
// pop argument 0
@2
D=M
@0
D=D+A
@R13
M=D
@SP
M=M-1
A=M
D=M
@R13
A=M
M=D
// label WHILE_EXP0
(Math.Math.divide$WHILE_EXP0)
// push local 0
@1
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// push constant 15
@15
D=A
@SP
A=M
M=D
@SP
M=M+1
// lt
@SP
M=M-1
A=M
D=M
@SP
M=M-1
A=M
D=D-M
@L_Math_68
D;JLE
D=-1
@L_Math_69
D;JMP
(L_Math_68)
D=0
(L_Math_69)
@SP
A=M
M=D
@SP
M=M+1
// push local 3
@1
D=M
@3
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// not
@SP
M=M-1
A=M
M=!M
@SP
M=M+1
// and
@SP
M=M-1
A=M
D=M
@SP
M=M-1
A=M
M=D&M
@SP
M=M+1
// not
@SP
M=M-1
A=M
M=!M
@SP
M=M+1
// if-goto WHILE_END0
@SP
M=M-1
A=M
D=M
@Math.Math.divide$WHILE_END0
D;JNE
// push constant 32767
@32767
D=A
@SP
A=M
M=D
@SP
M=M+1
// push local 0
@1
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// push static 1
@Math.1
D=M
@SP
A=M
M=D
@SP
M=M+1
// add
@SP
M=M-1
A=M
D=M
@SP
M=M-1
A=M
M=D+M
@SP
M=M+1
// pop pointer 1
@SP
M=M-1
A=M
D=M
@4
M=D
// push that 0
@THAT
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// push constant 1
@1
D=A
@SP
A=M
M=D
@SP
M=M+1
// sub
@SP
M=M-1
A=M
D=M
@SP
M=M-1
A=M
M=D-M
M=-M
@SP
M=M+1
// sub
@SP
M=M-1
A=M
D=M
@SP
M=M-1
A=M
M=D-M
M=-M
@SP
M=M+1
// push local 0
@1
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// push static 1
@Math.1
D=M
@SP
A=M
M=D
@SP
M=M+1
// add
@SP
M=M-1
A=M
D=M
@SP
M=M-1
A=M
M=D+M
@SP
M=M+1
// pop pointer 1
@SP
M=M-1
A=M
D=M
@4
M=D
// push that 0
@THAT
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// push constant 1
@1
D=A
@SP
A=M
M=D
@SP
M=M+1
// sub
@SP
M=M-1
A=M
D=M
@SP
M=M-1
A=M
M=D-M
M=-M
@SP
M=M+1
// lt
@SP
M=M-1
A=M
D=M
@SP
M=M-1
A=M
D=D-M
@L_Math_70
D;JLE
D=-1
@L_Math_71
D;JMP
(L_Math_70)
D=0
(L_Math_71)
@SP
A=M
M=D
@SP
M=M+1
// pop local 3
@1
D=M
@3
D=D+A
@R13
M=D
@SP
M=M-1
A=M
D=M
@R13
A=M
M=D
// push local 3
@1
D=M
@3
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// not
@SP
M=M-1
A=M
M=!M
@SP
M=M+1
// if-goto IF_TRUE1
@SP
M=M-1
A=M
D=M
@Math.Math.divide$IF_TRUE1
D;JNE
// goto IF_FALSE1
@Math.Math.divide$IF_FALSE1
0;JMP
// label IF_TRUE1
(Math.Math.divide$IF_TRUE1)
// push local 0
@1
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// push constant 1
@1
D=A
@SP
A=M
M=D
@SP
M=M+1
// add
@SP
M=M-1
A=M
D=M
@SP
M=M-1
A=M
M=D+M
@SP
M=M+1
// push static 1
@Math.1
D=M
@SP
A=M
M=D
@SP
M=M+1
// add
@SP
M=M-1
A=M
D=M
@SP
M=M-1
A=M
M=D+M
@SP
M=M+1
// push local 0
@1
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// push static 1
@Math.1
D=M
@SP
A=M
M=D
@SP
M=M+1
// add
@SP
M=M-1
A=M
D=M
@SP
M=M-1
A=M
M=D+M
@SP
M=M+1
// pop pointer 1
@SP
M=M-1
A=M
D=M
@4
M=D
// push that 0
@THAT
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// push local 0
@1
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// push static 1
@Math.1
D=M
@SP
A=M
M=D
@SP
M=M+1
// add
@SP
M=M-1
A=M
D=M
@SP
M=M-1
A=M
M=D+M
@SP
M=M+1
// pop pointer 1
@SP
M=M-1
A=M
D=M
@4
M=D
// push that 0
@THAT
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// add
@SP
M=M-1
A=M
D=M
@SP
M=M-1
A=M
M=D+M
@SP
M=M+1
// pop temp 0
@SP
M=M-1
A=M
D=M
@5
M=D
// pop pointer 1
@SP
M=M-1
A=M
D=M
@4
M=D
// push temp 0
@5
D=M
@SP
A=M
M=D
@SP
M=M+1
// pop that 0
@4
D=M
@0
D=D+A
@R13
M=D
@SP
M=M-1
A=M
D=M
@R13
A=M
M=D
// push local 0
@1
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// push constant 1
@1
D=A
@SP
A=M
M=D
@SP
M=M+1
// add
@SP
M=M-1
A=M
D=M
@SP
M=M-1
A=M
M=D+M
@SP
M=M+1
// push static 1
@Math.1
D=M
@SP
A=M
M=D
@SP
M=M+1
// add
@SP
M=M-1
A=M
D=M
@SP
M=M-1
A=M
M=D+M
@SP
M=M+1
// pop pointer 1
@SP
M=M-1
A=M
D=M
@4
M=D
// push that 0
@THAT
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// push constant 1
@1
D=A
@SP
A=M
M=D
@SP
M=M+1
// sub
@SP
M=M-1
A=M
D=M
@SP
M=M-1
A=M
M=D-M
M=-M
@SP
M=M+1
// push argument 0
@2
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// push constant 1
@1
D=A
@SP
A=M
M=D
@SP
M=M+1
// sub
@SP
M=M-1
A=M
D=M
@SP
M=M-1
A=M
M=D-M
M=-M
@SP
M=M+1
// gt
@SP
M=M-1
A=M
D=M
@SP
M=M-1
A=M
D=D-M
@L_Math_72
D;JGE
D=-1
@L_Math_73
D;JMP
(L_Math_72)
D=0
(L_Math_73)
@SP
A=M
M=D
@SP
M=M+1
// pop local 3
@1
D=M
@3
D=D+A
@R13
M=D
@SP
M=M-1
A=M
D=M
@R13
A=M
M=D
// push local 3
@1
D=M
@3
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// not
@SP
M=M-1
A=M
M=!M
@SP
M=M+1
// if-goto IF_TRUE2
@SP
M=M-1
A=M
D=M
@Math.Math.divide$IF_TRUE2
D;JNE
// goto IF_FALSE2
@Math.Math.divide$IF_FALSE2
0;JMP
// label IF_TRUE2
(Math.Math.divide$IF_TRUE2)
// push local 0
@1
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// push constant 1
@1
D=A
@SP
A=M
M=D
@SP
M=M+1
// add
@SP
M=M-1
A=M
D=M
@SP
M=M-1
A=M
M=D+M
@SP
M=M+1
// pop local 0
@1
D=M
@0
D=D+A
@R13
M=D
@SP
M=M-1
A=M
D=M
@R13
A=M
M=D
// label IF_FALSE2
(Math.Math.divide$IF_FALSE2)
// label IF_FALSE1
(Math.Math.divide$IF_FALSE1)
// goto WHILE_EXP0
@Math.Math.divide$WHILE_EXP0
0;JMP
// label WHILE_END0
(Math.Math.divide$WHILE_END0)
// label WHILE_EXP1
(Math.Math.divide$WHILE_EXP1)
// push local 0
@1
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// push constant 1
@1
D=A
@SP
A=M
M=D
@SP
M=M+1
// neg
@SP
M=M-1
A=M
M=-M
@SP
M=M+1
// gt
@SP
M=M-1
A=M
D=M
@SP
M=M-1
A=M
D=D-M
@L_Math_74
D;JGE
D=-1
@L_Math_75
D;JMP
(L_Math_74)
D=0
(L_Math_75)
@SP
A=M
M=D
@SP
M=M+1
// not
@SP
M=M-1
A=M
M=!M
@SP
M=M+1
// if-goto WHILE_END1
@SP
M=M-1
A=M
D=M
@Math.Math.divide$WHILE_END1
D;JNE
// push local 0
@1
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// push static 1
@Math.1
D=M
@SP
A=M
M=D
@SP
M=M+1
// add
@SP
M=M-1
A=M
D=M
@SP
M=M-1
A=M
M=D+M
@SP
M=M+1
// pop pointer 1
@SP
M=M-1
A=M
D=M
@4
M=D
// push that 0
@THAT
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// push constant 1
@1
D=A
@SP
A=M
M=D
@SP
M=M+1
// sub
@SP
M=M-1
A=M
D=M
@SP
M=M-1
A=M
M=D-M
M=-M
@SP
M=M+1
// push argument 0
@2
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// push constant 1
@1
D=A
@SP
A=M
M=D
@SP
M=M+1
// sub
@SP
M=M-1
A=M
D=M
@SP
M=M-1
A=M
M=D-M
M=-M
@SP
M=M+1
// gt
@SP
M=M-1
A=M
D=M
@SP
M=M-1
A=M
D=D-M
@L_Math_76
D;JGE
D=-1
@L_Math_77
D;JMP
(L_Math_76)
D=0
(L_Math_77)
@SP
A=M
M=D
@SP
M=M+1
// not
@SP
M=M-1
A=M
M=!M
@SP
M=M+1
// if-goto IF_TRUE3
@SP
M=M-1
A=M
D=M
@Math.Math.divide$IF_TRUE3
D;JNE
// goto IF_FALSE3
@Math.Math.divide$IF_FALSE3
0;JMP
// label IF_TRUE3
(Math.Math.divide$IF_TRUE3)
// push local 1
@1
D=M
@1
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// push local 0
@1
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// push static 0
@Math.0
D=M
@SP
A=M
M=D
@SP
M=M+1
// add
@SP
M=M-1
A=M
D=M
@SP
M=M-1
A=M
M=D+M
@SP
M=M+1
// pop pointer 1
@SP
M=M-1
A=M
D=M
@4
M=D
// push that 0
@THAT
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// add
@SP
M=M-1
A=M
D=M
@SP
M=M-1
A=M
M=D+M
@SP
M=M+1
// pop local 1
@1
D=M
@1
D=D+A
@R13
M=D
@SP
M=M-1
A=M
D=M
@R13
A=M
M=D
// push argument 0
@2
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// push local 0
@1
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// push static 1
@Math.1
D=M
@SP
A=M
M=D
@SP
M=M+1
// add
@SP
M=M-1
A=M
D=M
@SP
M=M-1
A=M
M=D+M
@SP
M=M+1
// pop pointer 1
@SP
M=M-1
A=M
D=M
@4
M=D
// push that 0
@THAT
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// sub
@SP
M=M-1
A=M
D=M
@SP
M=M-1
A=M
M=D-M
M=-M
@SP
M=M+1
// pop argument 0
@2
D=M
@0
D=D+A
@R13
M=D
@SP
M=M-1
A=M
D=M
@R13
A=M
M=D
// label IF_FALSE3
(Math.Math.divide$IF_FALSE3)
// push local 0
@1
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// push constant 1
@1
D=A
@SP
A=M
M=D
@SP
M=M+1
// sub
@SP
M=M-1
A=M
D=M
@SP
M=M-1
A=M
M=D-M
M=-M
@SP
M=M+1
// pop local 0
@1
D=M
@0
D=D+A
@R13
M=D
@SP
M=M-1
A=M
D=M
@R13
A=M
M=D
// goto WHILE_EXP1
@Math.Math.divide$WHILE_EXP1
0;JMP
// label WHILE_END1
(Math.Math.divide$WHILE_END1)
// push local 2
@1
D=M
@2
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// if-goto IF_TRUE4
@SP
M=M-1
A=M
D=M
@Math.Math.divide$IF_TRUE4
D;JNE
// goto IF_FALSE4
@Math.Math.divide$IF_FALSE4
0;JMP
// label IF_TRUE4
(Math.Math.divide$IF_TRUE4)
// push local 1
@1
D=M
@1
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// neg
@SP
M=M-1
A=M
M=-M
@SP
M=M+1
// pop local 1
@1
D=M
@1
D=D+A
@R13
M=D
@SP
M=M-1
A=M
D=M
@R13
A=M
M=D
// label IF_FALSE4
(Math.Math.divide$IF_FALSE4)
// push local 1
@1
D=M
@1
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// return
@FW__RETURN
0;JMP
// function Math.sqrt 4
(Math.sqrt)
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// push argument 0
@2
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// lt
@SP
M=M-1
A=M
D=M
@SP
M=M-1
A=M
D=D-M
@L_Math_78
D;JLE
D=-1
@L_Math_79
D;JMP
(L_Math_78)
D=0
(L_Math_79)
@SP
A=M
M=D
@SP
M=M+1
// if-goto IF_TRUE0
@SP
M=M-1
A=M
D=M
@Math.Math.sqrt$IF_TRUE0
D;JNE
// goto IF_FALSE0
@Math.Math.sqrt$IF_FALSE0
0;JMP
// label IF_TRUE0
(Math.Math.sqrt$IF_TRUE0)
// push constant 4
@4
D=A
@SP
A=M
M=D
@SP
M=M+1
// call Sys.error 1
@1
D=A
@R13
M=D
@Sys.error
D=A
@R14
M=D
@L_Math_80
D=A
@FW__CALL
0;JMP
(L_Math_80)
// pop temp 0
@SP
M=M-1
A=M
D=M
@5
M=D
// label IF_FALSE0
(Math.Math.sqrt$IF_FALSE0)
// push constant 7
@7
D=A
@SP
A=M
M=D
@SP
M=M+1
// pop local 0
@1
D=M
@0
D=D+A
@R13
M=D
@SP
M=M-1
A=M
D=M
@R13
A=M
M=D
// label WHILE_EXP0
(Math.Math.sqrt$WHILE_EXP0)
// push local 0
@1
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// push constant 1
@1
D=A
@SP
A=M
M=D
@SP
M=M+1
// neg
@SP
M=M-1
A=M
M=-M
@SP
M=M+1
// gt
@SP
M=M-1
A=M
D=M
@SP
M=M-1
A=M
D=D-M
@L_Math_81
D;JGE
D=-1
@L_Math_82
D;JMP
(L_Math_81)
D=0
(L_Math_82)
@SP
A=M
M=D
@SP
M=M+1
// not
@SP
M=M-1
A=M
M=!M
@SP
M=M+1
// if-goto WHILE_END0
@SP
M=M-1
A=M
D=M
@Math.Math.sqrt$WHILE_END0
D;JNE
// push local 3
@1
D=M
@3
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// push local 0
@1
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// push static 0
@Math.0
D=M
@SP
A=M
M=D
@SP
M=M+1
// add
@SP
M=M-1
A=M
D=M
@SP
M=M-1
A=M
M=D+M
@SP
M=M+1
// pop pointer 1
@SP
M=M-1
A=M
D=M
@4
M=D
// push that 0
@THAT
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// add
@SP
M=M-1
A=M
D=M
@SP
M=M-1
A=M
M=D+M
@SP
M=M+1
// pop local 1
@1
D=M
@1
D=D+A
@R13
M=D
@SP
M=M-1
A=M
D=M
@R13
A=M
M=D
// push local 1
@1
D=M
@1
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// push local 1
@1
D=M
@1
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// call Math.multiply 2
@2
D=A
@R13
M=D
@Math.multiply
D=A
@R14
M=D
@L_Math_83
D=A
@FW__CALL
0;JMP
(L_Math_83)
// pop local 2
@1
D=M
@2
D=D+A
@R13
M=D
@SP
M=M-1
A=M
D=M
@R13
A=M
M=D
// push local 2
@1
D=M
@2
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// push argument 0
@2
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// gt
@SP
M=M-1
A=M
D=M
@SP
M=M-1
A=M
D=D-M
@L_Math_84
D;JGE
D=-1
@L_Math_85
D;JMP
(L_Math_84)
D=0
(L_Math_85)
@SP
A=M
M=D
@SP
M=M+1
// not
@SP
M=M-1
A=M
M=!M
@SP
M=M+1
// push local 2
@1
D=M
@2
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// lt
@SP
M=M-1
A=M
D=M
@SP
M=M-1
A=M
D=D-M
@L_Math_86
D;JLE
D=-1
@L_Math_87
D;JMP
(L_Math_86)
D=0
(L_Math_87)
@SP
A=M
M=D
@SP
M=M+1
// not
@SP
M=M-1
A=M
M=!M
@SP
M=M+1
// and
@SP
M=M-1
A=M
D=M
@SP
M=M-1
A=M
M=D&M
@SP
M=M+1
// if-goto IF_TRUE1
@SP
M=M-1
A=M
D=M
@Math.Math.sqrt$IF_TRUE1
D;JNE
// goto IF_FALSE1
@Math.Math.sqrt$IF_FALSE1
0;JMP
// label IF_TRUE1
(Math.Math.sqrt$IF_TRUE1)
// push local 1
@1
D=M
@1
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// pop local 3
@1
D=M
@3
D=D+A
@R13
M=D
@SP
M=M-1
A=M
D=M
@R13
A=M
M=D
// label IF_FALSE1
(Math.Math.sqrt$IF_FALSE1)
// push local 0
@1
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// push constant 1
@1
D=A
@SP
A=M
M=D
@SP
M=M+1
// sub
@SP
M=M-1
A=M
D=M
@SP
M=M-1
A=M
M=D-M
M=-M
@SP
M=M+1
// pop local 0
@1
D=M
@0
D=D+A
@R13
M=D
@SP
M=M-1
A=M
D=M
@R13
A=M
M=D
// goto WHILE_EXP0
@Math.Math.sqrt$WHILE_EXP0
0;JMP
// label WHILE_END0
(Math.Math.sqrt$WHILE_END0)
// push local 3
@1
D=M
@3
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// return
@FW__RETURN
0;JMP
// function Math.max 0
(Math.max)
// push argument 0
@2
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// push argument 1
@2
D=M
@1
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// gt
@SP
M=M-1
A=M
D=M
@SP
M=M-1
A=M
D=D-M
@L_Math_88
D;JGE
D=-1
@L_Math_89
D;JMP
(L_Math_88)
D=0
(L_Math_89)
@SP
A=M
M=D
@SP
M=M+1
// if-goto IF_TRUE0
@SP
M=M-1
A=M
D=M
@Math.Math.max$IF_TRUE0
D;JNE
// goto IF_FALSE0
@Math.Math.max$IF_FALSE0
0;JMP
// label IF_TRUE0
(Math.Math.max$IF_TRUE0)
// push argument 0
@2
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// pop argument 1
@2
D=M
@1
D=D+A
@R13
M=D
@SP
M=M-1
A=M
D=M
@R13
A=M
M=D
// label IF_FALSE0
(Math.Math.max$IF_FALSE0)
// push argument 1
@2
D=M
@1
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// return
@FW__RETURN
0;JMP
// function Math.min 0
(Math.min)
// push argument 0
@2
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// push argument 1
@2
D=M
@1
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// lt
@SP
M=M-1
A=M
D=M
@SP
M=M-1
A=M
D=D-M
@L_Math_90
D;JLE
D=-1
@L_Math_91
D;JMP
(L_Math_90)
D=0
(L_Math_91)
@SP
A=M
M=D
@SP
M=M+1
// if-goto IF_TRUE0
@SP
M=M-1
A=M
D=M
@Math.Math.min$IF_TRUE0
D;JNE
// goto IF_FALSE0
@Math.Math.min$IF_FALSE0
0;JMP
// label IF_TRUE0
(Math.Math.min$IF_TRUE0)
// push argument 0
@2
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// pop argument 1
@2
D=M
@1
D=D+A
@R13
M=D
@SP
M=M-1
A=M
D=M
@R13
A=M
M=D
// label IF_FALSE0
(Math.Math.min$IF_FALSE0)
// push argument 1
@2
D=M
@1
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// return
@FW__RETURN
0;JMP
// 
// function Memory.init 0
(Memory.init)
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// pop static 0
@SP
M=M-1
A=M
D=M
@Memory.0
M=D
// push constant 2048
@2048
D=A
@SP
A=M
M=D
@SP
M=M+1
// push static 0
@Memory.0
D=M
@SP
A=M
M=D
@SP
M=M+1
// add
@SP
M=M-1
A=M
D=M
@SP
M=M-1
A=M
M=D+M
@SP
M=M+1
// push constant 14334
@14334
D=A
@SP
A=M
M=D
@SP
M=M+1
// pop temp 0
@SP
M=M-1
A=M
D=M
@5
M=D
// pop pointer 1
@SP
M=M-1
A=M
D=M
@4
M=D
// push temp 0
@5
D=M
@SP
A=M
M=D
@SP
M=M+1
// pop that 0
@4
D=M
@0
D=D+A
@R13
M=D
@SP
M=M-1
A=M
D=M
@R13
A=M
M=D
// push constant 2049
@2049
D=A
@SP
A=M
M=D
@SP
M=M+1
// push static 0
@Memory.0
D=M
@SP
A=M
M=D
@SP
M=M+1
// add
@SP
M=M-1
A=M
D=M
@SP
M=M-1
A=M
M=D+M
@SP
M=M+1
// push constant 2050
@2050
D=A
@SP
A=M
M=D
@SP
M=M+1
// pop temp 0
@SP
M=M-1
A=M
D=M
@5
M=D
// pop pointer 1
@SP
M=M-1
A=M
D=M
@4
M=D
// push temp 0
@5
D=M
@SP
A=M
M=D
@SP
M=M+1
// pop that 0
@4
D=M
@0
D=D+A
@R13
M=D
@SP
M=M-1
A=M
D=M
@R13
A=M
M=D
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// return
@FW__RETURN
0;JMP
// function Memory.peek 0
(Memory.peek)
// push argument 0
@2
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// push static 0
@Memory.0
D=M
@SP
A=M
M=D
@SP
M=M+1
// add
@SP
M=M-1
A=M
D=M
@SP
M=M-1
A=M
M=D+M
@SP
M=M+1
// pop pointer 1
@SP
M=M-1
A=M
D=M
@4
M=D
// push that 0
@THAT
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// return
@FW__RETURN
0;JMP
// function Memory.poke 0
(Memory.poke)
// push argument 0
@2
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// push static 0
@Memory.0
D=M
@SP
A=M
M=D
@SP
M=M+1
// add
@SP
M=M-1
A=M
D=M
@SP
M=M-1
A=M
M=D+M
@SP
M=M+1
// push argument 1
@2
D=M
@1
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// pop temp 0
@SP
M=M-1
A=M
D=M
@5
M=D
// pop pointer 1
@SP
M=M-1
A=M
D=M
@4
M=D
// push temp 0
@5
D=M
@SP
A=M
M=D
@SP
M=M+1
// pop that 0
@4
D=M
@0
D=D+A
@R13
M=D
@SP
M=M-1
A=M
D=M
@R13
A=M
M=D
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// return
@FW__RETURN
0;JMP
// function Memory.alloc 2
(Memory.alloc)
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// push argument 0
@2
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// lt
@SP
M=M-1
A=M
D=M
@SP
M=M-1
A=M
D=D-M
@L_Memory_92
D;JLE
D=-1
@L_Memory_93
D;JMP
(L_Memory_92)
D=0
(L_Memory_93)
@SP
A=M
M=D
@SP
M=M+1
// if-goto IF_TRUE0
@SP
M=M-1
A=M
D=M
@Memory.Memory.alloc$IF_TRUE0
D;JNE
// goto IF_FALSE0
@Memory.Memory.alloc$IF_FALSE0
0;JMP
// label IF_TRUE0
(Memory.Memory.alloc$IF_TRUE0)
// push constant 5
@5
D=A
@SP
A=M
M=D
@SP
M=M+1
// call Sys.error 1
@1
D=A
@R13
M=D
@Sys.error
D=A
@R14
M=D
@L_Memory_94
D=A
@FW__CALL
0;JMP
(L_Memory_94)
// pop temp 0
@SP
M=M-1
A=M
D=M
@5
M=D
// label IF_FALSE0
(Memory.Memory.alloc$IF_FALSE0)
// push argument 0
@2
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// eq
@SP
M=M-1
A=M
D=M
@SP
M=M-1
A=M
D=D-M
@L_Memory_95
D;JNE
D=-1
@L_Memory_96
D;JMP
(L_Memory_95)
D=0
(L_Memory_96)
@SP
A=M
M=D
@SP
M=M+1
// if-goto IF_TRUE1
@SP
M=M-1
A=M
D=M
@Memory.Memory.alloc$IF_TRUE1
D;JNE
// goto IF_FALSE1
@Memory.Memory.alloc$IF_FALSE1
0;JMP
// label IF_TRUE1
(Memory.Memory.alloc$IF_TRUE1)
// push constant 1
@1
D=A
@SP
A=M
M=D
@SP
M=M+1
// pop argument 0
@2
D=M
@0
D=D+A
@R13
M=D
@SP
M=M-1
A=M
D=M
@R13
A=M
M=D
// label IF_FALSE1
(Memory.Memory.alloc$IF_FALSE1)
// push constant 2048
@2048
D=A
@SP
A=M
M=D
@SP
M=M+1
// pop local 0
@1
D=M
@0
D=D+A
@R13
M=D
@SP
M=M-1
A=M
D=M
@R13
A=M
M=D
// label WHILE_EXP0
(Memory.Memory.alloc$WHILE_EXP0)
// push local 0
@1
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// push constant 16383
@16383
D=A
@SP
A=M
M=D
@SP
M=M+1
// lt
@SP
M=M-1
A=M
D=M
@SP
M=M-1
A=M
D=D-M
@L_Memory_97
D;JLE
D=-1
@L_Memory_98
D;JMP
(L_Memory_97)
D=0
(L_Memory_98)
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// push local 0
@1
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// add
@SP
M=M-1
A=M
D=M
@SP
M=M-1
A=M
M=D+M
@SP
M=M+1
// pop pointer 1
@SP
M=M-1
A=M
D=M
@4
M=D
// push that 0
@THAT
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// push argument 0
@2
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// lt
@SP
M=M-1
A=M
D=M
@SP
M=M-1
A=M
D=D-M
@L_Memory_99
D;JLE
D=-1
@L_Memory_100
D;JMP
(L_Memory_99)
D=0
(L_Memory_100)
@SP
A=M
M=D
@SP
M=M+1
// and
@SP
M=M-1
A=M
D=M
@SP
M=M-1
A=M
M=D&M
@SP
M=M+1
// not
@SP
M=M-1
A=M
M=!M
@SP
M=M+1
// if-goto WHILE_END0
@SP
M=M-1
A=M
D=M
@Memory.Memory.alloc$WHILE_END0
D;JNE
// push constant 1
@1
D=A
@SP
A=M
M=D
@SP
M=M+1
// push local 0
@1
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// add
@SP
M=M-1
A=M
D=M
@SP
M=M-1
A=M
M=D+M
@SP
M=M+1
// pop pointer 1
@SP
M=M-1
A=M
D=M
@4
M=D
// push that 0
@THAT
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// pop local 1
@1
D=M
@1
D=D+A
@R13
M=D
@SP
M=M-1
A=M
D=M
@R13
A=M
M=D
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// push local 0
@1
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// add
@SP
M=M-1
A=M
D=M
@SP
M=M-1
A=M
M=D+M
@SP
M=M+1
// pop pointer 1
@SP
M=M-1
A=M
D=M
@4
M=D
// push that 0
@THAT
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// eq
@SP
M=M-1
A=M
D=M
@SP
M=M-1
A=M
D=D-M
@L_Memory_101
D;JNE
D=-1
@L_Memory_102
D;JMP
(L_Memory_101)
D=0
(L_Memory_102)
@SP
A=M
M=D
@SP
M=M+1
// push local 1
@1
D=M
@1
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// push constant 16382
@16382
D=A
@SP
A=M
M=D
@SP
M=M+1
// gt
@SP
M=M-1
A=M
D=M
@SP
M=M-1
A=M
D=D-M
@L_Memory_103
D;JGE
D=-1
@L_Memory_104
D;JMP
(L_Memory_103)
D=0
(L_Memory_104)
@SP
A=M
M=D
@SP
M=M+1
// or
@SP
M=M-1
A=M
D=M
@SP
M=M-1
A=M
M=D|M
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// push local 1
@1
D=M
@1
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// add
@SP
M=M-1
A=M
D=M
@SP
M=M-1
A=M
M=D+M
@SP
M=M+1
// pop pointer 1
@SP
M=M-1
A=M
D=M
@4
M=D
// push that 0
@THAT
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// eq
@SP
M=M-1
A=M
D=M
@SP
M=M-1
A=M
D=D-M
@L_Memory_105
D;JNE
D=-1
@L_Memory_106
D;JMP
(L_Memory_105)
D=0
(L_Memory_106)
@SP
A=M
M=D
@SP
M=M+1
// or
@SP
M=M-1
A=M
D=M
@SP
M=M-1
A=M
M=D|M
@SP
M=M+1
// if-goto IF_TRUE2
@SP
M=M-1
A=M
D=M
@Memory.Memory.alloc$IF_TRUE2
D;JNE
// goto IF_FALSE2
@Memory.Memory.alloc$IF_FALSE2
0;JMP
// label IF_TRUE2
(Memory.Memory.alloc$IF_TRUE2)
// push local 1
@1
D=M
@1
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// pop local 0
@1
D=M
@0
D=D+A
@R13
M=D
@SP
M=M-1
A=M
D=M
@R13
A=M
M=D
// goto IF_END2
@Memory.Memory.alloc$IF_END2
0;JMP
// label IF_FALSE2
(Memory.Memory.alloc$IF_FALSE2)
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// push local 0
@1
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// add
@SP
M=M-1
A=M
D=M
@SP
M=M-1
A=M
M=D+M
@SP
M=M+1
// push constant 1
@1
D=A
@SP
A=M
M=D
@SP
M=M+1
// push local 0
@1
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// add
@SP
M=M-1
A=M
D=M
@SP
M=M-1
A=M
M=D+M
@SP
M=M+1
// pop pointer 1
@SP
M=M-1
A=M
D=M
@4
M=D
// push that 0
@THAT
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// push local 0
@1
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// sub
@SP
M=M-1
A=M
D=M
@SP
M=M-1
A=M
M=D-M
M=-M
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// push local 1
@1
D=M
@1
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// add
@SP
M=M-1
A=M
D=M
@SP
M=M-1
A=M
M=D+M
@SP
M=M+1
// pop pointer 1
@SP
M=M-1
A=M
D=M
@4
M=D
// push that 0
@THAT
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// add
@SP
M=M-1
A=M
D=M
@SP
M=M-1
A=M
M=D+M
@SP
M=M+1
// pop temp 0
@SP
M=M-1
A=M
D=M
@5
M=D
// pop pointer 1
@SP
M=M-1
A=M
D=M
@4
M=D
// push temp 0
@5
D=M
@SP
A=M
M=D
@SP
M=M+1
// pop that 0
@4
D=M
@0
D=D+A
@R13
M=D
@SP
M=M-1
A=M
D=M
@R13
A=M
M=D
// push constant 1
@1
D=A
@SP
A=M
M=D
@SP
M=M+1
// push local 1
@1
D=M
@1
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// add
@SP
M=M-1
A=M
D=M
@SP
M=M-1
A=M
M=D+M
@SP
M=M+1
// pop pointer 1
@SP
M=M-1
A=M
D=M
@4
M=D
// push that 0
@THAT
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// push local 1
@1
D=M
@1
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// push constant 2
@2
D=A
@SP
A=M
M=D
@SP
M=M+1
// add
@SP
M=M-1
A=M
D=M
@SP
M=M-1
A=M
M=D+M
@SP
M=M+1
// eq
@SP
M=M-1
A=M
D=M
@SP
M=M-1
A=M
D=D-M
@L_Memory_107
D;JNE
D=-1
@L_Memory_108
D;JMP
(L_Memory_107)
D=0
(L_Memory_108)
@SP
A=M
M=D
@SP
M=M+1
// if-goto IF_TRUE3
@SP
M=M-1
A=M
D=M
@Memory.Memory.alloc$IF_TRUE3
D;JNE
// goto IF_FALSE3
@Memory.Memory.alloc$IF_FALSE3
0;JMP
// label IF_TRUE3
(Memory.Memory.alloc$IF_TRUE3)
// push constant 1
@1
D=A
@SP
A=M
M=D
@SP
M=M+1
// push local 0
@1
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// add
@SP
M=M-1
A=M
D=M
@SP
M=M-1
A=M
M=D+M
@SP
M=M+1
// push local 0
@1
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// push constant 2
@2
D=A
@SP
A=M
M=D
@SP
M=M+1
// add
@SP
M=M-1
A=M
D=M
@SP
M=M-1
A=M
M=D+M
@SP
M=M+1
// pop temp 0
@SP
M=M-1
A=M
D=M
@5
M=D
// pop pointer 1
@SP
M=M-1
A=M
D=M
@4
M=D
// push temp 0
@5
D=M
@SP
A=M
M=D
@SP
M=M+1
// pop that 0
@4
D=M
@0
D=D+A
@R13
M=D
@SP
M=M-1
A=M
D=M
@R13
A=M
M=D
// goto IF_END3
@Memory.Memory.alloc$IF_END3
0;JMP
// label IF_FALSE3
(Memory.Memory.alloc$IF_FALSE3)
// push constant 1
@1
D=A
@SP
A=M
M=D
@SP
M=M+1
// push local 0
@1
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// add
@SP
M=M-1
A=M
D=M
@SP
M=M-1
A=M
M=D+M
@SP
M=M+1
// push constant 1
@1
D=A
@SP
A=M
M=D
@SP
M=M+1
// push local 1
@1
D=M
@1
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// add
@SP
M=M-1
A=M
D=M
@SP
M=M-1
A=M
M=D+M
@SP
M=M+1
// pop pointer 1
@SP
M=M-1
A=M
D=M
@4
M=D
// push that 0
@THAT
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// pop temp 0
@SP
M=M-1
A=M
D=M
@5
M=D
// pop pointer 1
@SP
M=M-1
A=M
D=M
@4
M=D
// push temp 0
@5
D=M
@SP
A=M
M=D
@SP
M=M+1
// pop that 0
@4
D=M
@0
D=D+A
@R13
M=D
@SP
M=M-1
A=M
D=M
@R13
A=M
M=D
// label IF_END3
(Memory.Memory.alloc$IF_END3)
// label IF_END2
(Memory.Memory.alloc$IF_END2)
// goto WHILE_EXP0
@Memory.Memory.alloc$WHILE_EXP0
0;JMP
// label WHILE_END0
(Memory.Memory.alloc$WHILE_END0)
// push local 0
@1
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// push argument 0
@2
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// add
@SP
M=M-1
A=M
D=M
@SP
M=M-1
A=M
M=D+M
@SP
M=M+1
// push constant 16379
@16379
D=A
@SP
A=M
M=D
@SP
M=M+1
// gt
@SP
M=M-1
A=M
D=M
@SP
M=M-1
A=M
D=D-M
@L_Memory_109
D;JGE
D=-1
@L_Memory_110
D;JMP
(L_Memory_109)
D=0
(L_Memory_110)
@SP
A=M
M=D
@SP
M=M+1
// if-goto IF_TRUE4
@SP
M=M-1
A=M
D=M
@Memory.Memory.alloc$IF_TRUE4
D;JNE
// goto IF_FALSE4
@Memory.Memory.alloc$IF_FALSE4
0;JMP
// label IF_TRUE4
(Memory.Memory.alloc$IF_TRUE4)
// push constant 6
@6
D=A
@SP
A=M
M=D
@SP
M=M+1
// call Sys.error 1
@1
D=A
@R13
M=D
@Sys.error
D=A
@R14
M=D
@L_Memory_111
D=A
@FW__CALL
0;JMP
(L_Memory_111)
// pop temp 0
@SP
M=M-1
A=M
D=M
@5
M=D
// label IF_FALSE4
(Memory.Memory.alloc$IF_FALSE4)
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// push local 0
@1
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// add
@SP
M=M-1
A=M
D=M
@SP
M=M-1
A=M
M=D+M
@SP
M=M+1
// pop pointer 1
@SP
M=M-1
A=M
D=M
@4
M=D
// push that 0
@THAT
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// push argument 0
@2
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// push constant 2
@2
D=A
@SP
A=M
M=D
@SP
M=M+1
// add
@SP
M=M-1
A=M
D=M
@SP
M=M-1
A=M
M=D+M
@SP
M=M+1
// gt
@SP
M=M-1
A=M
D=M
@SP
M=M-1
A=M
D=D-M
@L_Memory_112
D;JGE
D=-1
@L_Memory_113
D;JMP
(L_Memory_112)
D=0
(L_Memory_113)
@SP
A=M
M=D
@SP
M=M+1
// if-goto IF_TRUE5
@SP
M=M-1
A=M
D=M
@Memory.Memory.alloc$IF_TRUE5
D;JNE
// goto IF_FALSE5
@Memory.Memory.alloc$IF_FALSE5
0;JMP
// label IF_TRUE5
(Memory.Memory.alloc$IF_TRUE5)
// push argument 0
@2
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// push constant 2
@2
D=A
@SP
A=M
M=D
@SP
M=M+1
// add
@SP
M=M-1
A=M
D=M
@SP
M=M-1
A=M
M=D+M
@SP
M=M+1
// push local 0
@1
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// add
@SP
M=M-1
A=M
D=M
@SP
M=M-1
A=M
M=D+M
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// push local 0
@1
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// add
@SP
M=M-1
A=M
D=M
@SP
M=M-1
A=M
M=D+M
@SP
M=M+1
// pop pointer 1
@SP
M=M-1
A=M
D=M
@4
M=D
// push that 0
@THAT
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// push argument 0
@2
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// sub
@SP
M=M-1
A=M
D=M
@SP
M=M-1
A=M
M=D-M
M=-M
@SP
M=M+1
// push constant 2
@2
D=A
@SP
A=M
M=D
@SP
M=M+1
// sub
@SP
M=M-1
A=M
D=M
@SP
M=M-1
A=M
M=D-M
M=-M
@SP
M=M+1
// pop temp 0
@SP
M=M-1
A=M
D=M
@5
M=D
// pop pointer 1
@SP
M=M-1
A=M
D=M
@4
M=D
// push temp 0
@5
D=M
@SP
A=M
M=D
@SP
M=M+1
// pop that 0
@4
D=M
@0
D=D+A
@R13
M=D
@SP
M=M-1
A=M
D=M
@R13
A=M
M=D
// push constant 1
@1
D=A
@SP
A=M
M=D
@SP
M=M+1
// push local 0
@1
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// add
@SP
M=M-1
A=M
D=M
@SP
M=M-1
A=M
M=D+M
@SP
M=M+1
// pop pointer 1
@SP
M=M-1
A=M
D=M
@4
M=D
// push that 0
@THAT
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// push local 0
@1
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// push constant 2
@2
D=A
@SP
A=M
M=D
@SP
M=M+1
// add
@SP
M=M-1
A=M
D=M
@SP
M=M-1
A=M
M=D+M
@SP
M=M+1
// eq
@SP
M=M-1
A=M
D=M
@SP
M=M-1
A=M
D=D-M
@L_Memory_114
D;JNE
D=-1
@L_Memory_115
D;JMP
(L_Memory_114)
D=0
(L_Memory_115)
@SP
A=M
M=D
@SP
M=M+1
// if-goto IF_TRUE6
@SP
M=M-1
A=M
D=M
@Memory.Memory.alloc$IF_TRUE6
D;JNE
// goto IF_FALSE6
@Memory.Memory.alloc$IF_FALSE6
0;JMP
// label IF_TRUE6
(Memory.Memory.alloc$IF_TRUE6)
// push argument 0
@2
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// push constant 3
@3
D=A
@SP
A=M
M=D
@SP
M=M+1
// add
@SP
M=M-1
A=M
D=M
@SP
M=M-1
A=M
M=D+M
@SP
M=M+1
// push local 0
@1
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// add
@SP
M=M-1
A=M
D=M
@SP
M=M-1
A=M
M=D+M
@SP
M=M+1
// push local 0
@1
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// push argument 0
@2
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// add
@SP
M=M-1
A=M
D=M
@SP
M=M-1
A=M
M=D+M
@SP
M=M+1
// push constant 4
@4
D=A
@SP
A=M
M=D
@SP
M=M+1
// add
@SP
M=M-1
A=M
D=M
@SP
M=M-1
A=M
M=D+M
@SP
M=M+1
// pop temp 0
@SP
M=M-1
A=M
D=M
@5
M=D
// pop pointer 1
@SP
M=M-1
A=M
D=M
@4
M=D
// push temp 0
@5
D=M
@SP
A=M
M=D
@SP
M=M+1
// pop that 0
@4
D=M
@0
D=D+A
@R13
M=D
@SP
M=M-1
A=M
D=M
@R13
A=M
M=D
// goto IF_END6
@Memory.Memory.alloc$IF_END6
0;JMP
// label IF_FALSE6
(Memory.Memory.alloc$IF_FALSE6)
// push argument 0
@2
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// push constant 3
@3
D=A
@SP
A=M
M=D
@SP
M=M+1
// add
@SP
M=M-1
A=M
D=M
@SP
M=M-1
A=M
M=D+M
@SP
M=M+1
// push local 0
@1
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// add
@SP
M=M-1
A=M
D=M
@SP
M=M-1
A=M
M=D+M
@SP
M=M+1
// push constant 1
@1
D=A
@SP
A=M
M=D
@SP
M=M+1
// push local 0
@1
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// add
@SP
M=M-1
A=M
D=M
@SP
M=M-1
A=M
M=D+M
@SP
M=M+1
// pop pointer 1
@SP
M=M-1
A=M
D=M
@4
M=D
// push that 0
@THAT
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// pop temp 0
@SP
M=M-1
A=M
D=M
@5
M=D
// pop pointer 1
@SP
M=M-1
A=M
D=M
@4
M=D
// push temp 0
@5
D=M
@SP
A=M
M=D
@SP
M=M+1
// pop that 0
@4
D=M
@0
D=D+A
@R13
M=D
@SP
M=M-1
A=M
D=M
@R13
A=M
M=D
// label IF_END6
(Memory.Memory.alloc$IF_END6)
// push constant 1
@1
D=A
@SP
A=M
M=D
@SP
M=M+1
// push local 0
@1
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// add
@SP
M=M-1
A=M
D=M
@SP
M=M-1
A=M
M=D+M
@SP
M=M+1
// push local 0
@1
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// push argument 0
@2
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// add
@SP
M=M-1
A=M
D=M
@SP
M=M-1
A=M
M=D+M
@SP
M=M+1
// push constant 2
@2
D=A
@SP
A=M
M=D
@SP
M=M+1
// add
@SP
M=M-1
A=M
D=M
@SP
M=M-1
A=M
M=D+M
@SP
M=M+1
// pop temp 0
@SP
M=M-1
A=M
D=M
@5
M=D
// pop pointer 1
@SP
M=M-1
A=M
D=M
@4
M=D
// push temp 0
@5
D=M
@SP
A=M
M=D
@SP
M=M+1
// pop that 0
@4
D=M
@0
D=D+A
@R13
M=D
@SP
M=M-1
A=M
D=M
@R13
A=M
M=D
// label IF_FALSE5
(Memory.Memory.alloc$IF_FALSE5)
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// push local 0
@1
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// add
@SP
M=M-1
A=M
D=M
@SP
M=M-1
A=M
M=D+M
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// pop temp 0
@SP
M=M-1
A=M
D=M
@5
M=D
// pop pointer 1
@SP
M=M-1
A=M
D=M
@4
M=D
// push temp 0
@5
D=M
@SP
A=M
M=D
@SP
M=M+1
// pop that 0
@4
D=M
@0
D=D+A
@R13
M=D
@SP
M=M-1
A=M
D=M
@R13
A=M
M=D
// push local 0
@1
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// push constant 2
@2
D=A
@SP
A=M
M=D
@SP
M=M+1
// add
@SP
M=M-1
A=M
D=M
@SP
M=M-1
A=M
M=D+M
@SP
M=M+1
// return
@FW__RETURN
0;JMP
// function Memory.deAlloc 2
(Memory.deAlloc)
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// push argument 0
@2
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// push constant 2
@2
D=A
@SP
A=M
M=D
@SP
M=M+1
// sub
@SP
M=M-1
A=M
D=M
@SP
M=M-1
A=M
M=D-M
M=-M
@SP
M=M+1
// pop local 0
@1
D=M
@0
D=D+A
@R13
M=D
@SP
M=M-1
A=M
D=M
@R13
A=M
M=D
// push constant 1
@1
D=A
@SP
A=M
M=D
@SP
M=M+1
// push local 0
@1
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// add
@SP
M=M-1
A=M
D=M
@SP
M=M-1
A=M
M=D+M
@SP
M=M+1
// pop pointer 1
@SP
M=M-1
A=M
D=M
@4
M=D
// push that 0
@THAT
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// pop local 1
@1
D=M
@1
D=D+A
@R13
M=D
@SP
M=M-1
A=M
D=M
@R13
A=M
M=D
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// push local 1
@1
D=M
@1
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// add
@SP
M=M-1
A=M
D=M
@SP
M=M-1
A=M
M=D+M
@SP
M=M+1
// pop pointer 1
@SP
M=M-1
A=M
D=M
@4
M=D
// push that 0
@THAT
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// eq
@SP
M=M-1
A=M
D=M
@SP
M=M-1
A=M
D=D-M
@L_Memory_116
D;JNE
D=-1
@L_Memory_117
D;JMP
(L_Memory_116)
D=0
(L_Memory_117)
@SP
A=M
M=D
@SP
M=M+1
// if-goto IF_TRUE0
@SP
M=M-1
A=M
D=M
@Memory.Memory.deAlloc$IF_TRUE0
D;JNE
// goto IF_FALSE0
@Memory.Memory.deAlloc$IF_FALSE0
0;JMP
// label IF_TRUE0
(Memory.Memory.deAlloc$IF_TRUE0)
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// push local 0
@1
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// add
@SP
M=M-1
A=M
D=M
@SP
M=M-1
A=M
M=D+M
@SP
M=M+1
// push constant 1
@1
D=A
@SP
A=M
M=D
@SP
M=M+1
// push local 0
@1
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// add
@SP
M=M-1
A=M
D=M
@SP
M=M-1
A=M
M=D+M
@SP
M=M+1
// pop pointer 1
@SP
M=M-1
A=M
D=M
@4
M=D
// push that 0
@THAT
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// push local 0
@1
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// sub
@SP
M=M-1
A=M
D=M
@SP
M=M-1
A=M
M=D-M
M=-M
@SP
M=M+1
// push constant 2
@2
D=A
@SP
A=M
M=D
@SP
M=M+1
// sub
@SP
M=M-1
A=M
D=M
@SP
M=M-1
A=M
M=D-M
M=-M
@SP
M=M+1
// pop temp 0
@SP
M=M-1
A=M
D=M
@5
M=D
// pop pointer 1
@SP
M=M-1
A=M
D=M
@4
M=D
// push temp 0
@5
D=M
@SP
A=M
M=D
@SP
M=M+1
// pop that 0
@4
D=M
@0
D=D+A
@R13
M=D
@SP
M=M-1
A=M
D=M
@R13
A=M
M=D
// goto IF_END0
@Memory.Memory.deAlloc$IF_END0
0;JMP
// label IF_FALSE0
(Memory.Memory.deAlloc$IF_FALSE0)
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// push local 0
@1
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// add
@SP
M=M-1
A=M
D=M
@SP
M=M-1
A=M
M=D+M
@SP
M=M+1
// push constant 1
@1
D=A
@SP
A=M
M=D
@SP
M=M+1
// push local 0
@1
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// add
@SP
M=M-1
A=M
D=M
@SP
M=M-1
A=M
M=D+M
@SP
M=M+1
// pop pointer 1
@SP
M=M-1
A=M
D=M
@4
M=D
// push that 0
@THAT
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// push local 0
@1
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// sub
@SP
M=M-1
A=M
D=M
@SP
M=M-1
A=M
M=D-M
M=-M
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// push local 1
@1
D=M
@1
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// add
@SP
M=M-1
A=M
D=M
@SP
M=M-1
A=M
M=D+M
@SP
M=M+1
// pop pointer 1
@SP
M=M-1
A=M
D=M
@4
M=D
// push that 0
@THAT
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// add
@SP
M=M-1
A=M
D=M
@SP
M=M-1
A=M
M=D+M
@SP
M=M+1
// pop temp 0
@SP
M=M-1
A=M
D=M
@5
M=D
// pop pointer 1
@SP
M=M-1
A=M
D=M
@4
M=D
// push temp 0
@5
D=M
@SP
A=M
M=D
@SP
M=M+1
// pop that 0
@4
D=M
@0
D=D+A
@R13
M=D
@SP
M=M-1
A=M
D=M
@R13
A=M
M=D
// push constant 1
@1
D=A
@SP
A=M
M=D
@SP
M=M+1
// push local 1
@1
D=M
@1
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// add
@SP
M=M-1
A=M
D=M
@SP
M=M-1
A=M
M=D+M
@SP
M=M+1
// pop pointer 1
@SP
M=M-1
A=M
D=M
@4
M=D
// push that 0
@THAT
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// push local 1
@1
D=M
@1
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// push constant 2
@2
D=A
@SP
A=M
M=D
@SP
M=M+1
// add
@SP
M=M-1
A=M
D=M
@SP
M=M-1
A=M
M=D+M
@SP
M=M+1
// eq
@SP
M=M-1
A=M
D=M
@SP
M=M-1
A=M
D=D-M
@L_Memory_118
D;JNE
D=-1
@L_Memory_119
D;JMP
(L_Memory_118)
D=0
(L_Memory_119)
@SP
A=M
M=D
@SP
M=M+1
// if-goto IF_TRUE1
@SP
M=M-1
A=M
D=M
@Memory.Memory.deAlloc$IF_TRUE1
D;JNE
// goto IF_FALSE1
@Memory.Memory.deAlloc$IF_FALSE1
0;JMP
// label IF_TRUE1
(Memory.Memory.deAlloc$IF_TRUE1)
// push constant 1
@1
D=A
@SP
A=M
M=D
@SP
M=M+1
// push local 0
@1
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// add
@SP
M=M-1
A=M
D=M
@SP
M=M-1
A=M
M=D+M
@SP
M=M+1
// push local 0
@1
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// push constant 2
@2
D=A
@SP
A=M
M=D
@SP
M=M+1
// add
@SP
M=M-1
A=M
D=M
@SP
M=M-1
A=M
M=D+M
@SP
M=M+1
// pop temp 0
@SP
M=M-1
A=M
D=M
@5
M=D
// pop pointer 1
@SP
M=M-1
A=M
D=M
@4
M=D
// push temp 0
@5
D=M
@SP
A=M
M=D
@SP
M=M+1
// pop that 0
@4
D=M
@0
D=D+A
@R13
M=D
@SP
M=M-1
A=M
D=M
@R13
A=M
M=D
// goto IF_END1
@Memory.Memory.deAlloc$IF_END1
0;JMP
// label IF_FALSE1
(Memory.Memory.deAlloc$IF_FALSE1)
// push constant 1
@1
D=A
@SP
A=M
M=D
@SP
M=M+1
// push local 0
@1
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// add
@SP
M=M-1
A=M
D=M
@SP
M=M-1
A=M
M=D+M
@SP
M=M+1
// push constant 1
@1
D=A
@SP
A=M
M=D
@SP
M=M+1
// push local 1
@1
D=M
@1
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// add
@SP
M=M-1
A=M
D=M
@SP
M=M-1
A=M
M=D+M
@SP
M=M+1
// pop pointer 1
@SP
M=M-1
A=M
D=M
@4
M=D
// push that 0
@THAT
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// pop temp 0
@SP
M=M-1
A=M
D=M
@5
M=D
// pop pointer 1
@SP
M=M-1
A=M
D=M
@4
M=D
// push temp 0
@5
D=M
@SP
A=M
M=D
@SP
M=M+1
// pop that 0
@4
D=M
@0
D=D+A
@R13
M=D
@SP
M=M-1
A=M
D=M
@R13
A=M
M=D
// label IF_END1
(Memory.Memory.deAlloc$IF_END1)
// label IF_END0
(Memory.Memory.deAlloc$IF_END0)
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// return
@FW__RETURN
0;JMP
// 
// function Output.init 0
(Output.init)
// push constant 16384
@16384
D=A
@SP
A=M
M=D
@SP
M=M+1
// pop static 4
@SP
M=M-1
A=M
D=M
@Output.4
M=D
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// not
@SP
M=M-1
A=M
M=!M
@SP
M=M+1
// pop static 2
@SP
M=M-1
A=M
D=M
@Output.2
M=D
// push constant 32
@32
D=A
@SP
A=M
M=D
@SP
M=M+1
// pop static 1
@SP
M=M-1
A=M
D=M
@Output.1
M=D
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// pop static 0
@SP
M=M-1
A=M
D=M
@Output.0
M=D
// push constant 6
@6
D=A
@SP
A=M
M=D
@SP
M=M+1
// call String.new 1
@1
D=A
@R13
M=D
@String.new
D=A
@R14
M=D
@L_Output_120
D=A
@FW__CALL
0;JMP
(L_Output_120)
// pop static 3
@SP
M=M-1
A=M
D=M
@Output.3
M=D
// call Output.initMap 0
@0
D=A
@R13
M=D
@Output.initMap
D=A
@R14
M=D
@L_Output_121
D=A
@FW__CALL
0;JMP
(L_Output_121)
// pop temp 0
@SP
M=M-1
A=M
D=M
@5
M=D
// call Output.createShiftedMap 0
@0
D=A
@R13
M=D
@Output.createShiftedMap
D=A
@R14
M=D
@L_Output_122
D=A
@FW__CALL
0;JMP
(L_Output_122)
// pop temp 0
@SP
M=M-1
A=M
D=M
@5
M=D
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// return
@FW__RETURN
0;JMP
// function Output.initMap 0
(Output.initMap)
// push constant 127
@127
D=A
@SP
A=M
M=D
@SP
M=M+1
// call Array.new 1
@1
D=A
@R13
M=D
@Array.new
D=A
@R14
M=D
@L_Output_123
D=A
@FW__CALL
0;JMP
(L_Output_123)
// pop static 5
@SP
M=M-1
A=M
D=M
@Output.5
M=D
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 63
@63
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 63
@63
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 63
@63
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 63
@63
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 63
@63
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 63
@63
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 63
@63
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 63
@63
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 63
@63
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// call Output.create 12
@12
D=A
@R13
M=D
@Output.create
D=A
@R14
M=D
@L_Output_124
D=A
@FW__CALL
0;JMP
(L_Output_124)
// pop temp 0
@SP
M=M-1
A=M
D=M
@5
M=D
// push constant 32
@32
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// call Output.create 12
@12
D=A
@R13
M=D
@Output.create
D=A
@R14
M=D
@L_Output_125
D=A
@FW__CALL
0;JMP
(L_Output_125)
// pop temp 0
@SP
M=M-1
A=M
D=M
@5
M=D
// push constant 33
@33
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 12
@12
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 30
@30
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 30
@30
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 30
@30
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 12
@12
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 12
@12
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 12
@12
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 12
@12
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// call Output.create 12
@12
D=A
@R13
M=D
@Output.create
D=A
@R14
M=D
@L_Output_126
D=A
@FW__CALL
0;JMP
(L_Output_126)
// pop temp 0
@SP
M=M-1
A=M
D=M
@5
M=D
// push constant 34
@34
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 54
@54
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 54
@54
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 20
@20
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// call Output.create 12
@12
D=A
@R13
M=D
@Output.create
D=A
@R14
M=D
@L_Output_127
D=A
@FW__CALL
0;JMP
(L_Output_127)
// pop temp 0
@SP
M=M-1
A=M
D=M
@5
M=D
// push constant 35
@35
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 18
@18
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 18
@18
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 63
@63
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 18
@18
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 18
@18
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 63
@63
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 18
@18
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 18
@18
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// call Output.create 12
@12
D=A
@R13
M=D
@Output.create
D=A
@R14
M=D
@L_Output_128
D=A
@FW__CALL
0;JMP
(L_Output_128)
// pop temp 0
@SP
M=M-1
A=M
D=M
@5
M=D
// push constant 36
@36
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 12
@12
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 30
@30
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 51
@51
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 3
@3
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 30
@30
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 48
@48
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 51
@51
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 30
@30
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 12
@12
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 12
@12
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// call Output.create 12
@12
D=A
@R13
M=D
@Output.create
D=A
@R14
M=D
@L_Output_129
D=A
@FW__CALL
0;JMP
(L_Output_129)
// pop temp 0
@SP
M=M-1
A=M
D=M
@5
M=D
// push constant 37
@37
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 35
@35
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 51
@51
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 24
@24
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 12
@12
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 6
@6
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 51
@51
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 49
@49
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// call Output.create 12
@12
D=A
@R13
M=D
@Output.create
D=A
@R14
M=D
@L_Output_130
D=A
@FW__CALL
0;JMP
(L_Output_130)
// pop temp 0
@SP
M=M-1
A=M
D=M
@5
M=D
// push constant 38
@38
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 12
@12
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 30
@30
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 30
@30
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 12
@12
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 54
@54
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 27
@27
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 27
@27
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 27
@27
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 54
@54
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// call Output.create 12
@12
D=A
@R13
M=D
@Output.create
D=A
@R14
M=D
@L_Output_131
D=A
@FW__CALL
0;JMP
(L_Output_131)
// pop temp 0
@SP
M=M-1
A=M
D=M
@5
M=D
// push constant 39
@39
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 12
@12
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 12
@12
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 6
@6
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// call Output.create 12
@12
D=A
@R13
M=D
@Output.create
D=A
@R14
M=D
@L_Output_132
D=A
@FW__CALL
0;JMP
(L_Output_132)
// pop temp 0
@SP
M=M-1
A=M
D=M
@5
M=D
// push constant 40
@40
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 24
@24
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 12
@12
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 6
@6
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 6
@6
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 6
@6
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 6
@6
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 6
@6
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 12
@12
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 24
@24
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// call Output.create 12
@12
D=A
@R13
M=D
@Output.create
D=A
@R14
M=D
@L_Output_133
D=A
@FW__CALL
0;JMP
(L_Output_133)
// pop temp 0
@SP
M=M-1
A=M
D=M
@5
M=D
// push constant 41
@41
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 6
@6
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 12
@12
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 24
@24
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 24
@24
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 24
@24
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 24
@24
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 24
@24
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 12
@12
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 6
@6
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// call Output.create 12
@12
D=A
@R13
M=D
@Output.create
D=A
@R14
M=D
@L_Output_134
D=A
@FW__CALL
0;JMP
(L_Output_134)
// pop temp 0
@SP
M=M-1
A=M
D=M
@5
M=D
// push constant 42
@42
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 51
@51
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 30
@30
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 63
@63
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 30
@30
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 51
@51
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// call Output.create 12
@12
D=A
@R13
M=D
@Output.create
D=A
@R14
M=D
@L_Output_135
D=A
@FW__CALL
0;JMP
(L_Output_135)
// pop temp 0
@SP
M=M-1
A=M
D=M
@5
M=D
// push constant 43
@43
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 12
@12
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 12
@12
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 63
@63
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 12
@12
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 12
@12
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// call Output.create 12
@12
D=A
@R13
M=D
@Output.create
D=A
@R14
M=D
@L_Output_136
D=A
@FW__CALL
0;JMP
(L_Output_136)
// pop temp 0
@SP
M=M-1
A=M
D=M
@5
M=D
// push constant 44
@44
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 12
@12
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 12
@12
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 6
@6
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// call Output.create 12
@12
D=A
@R13
M=D
@Output.create
D=A
@R14
M=D
@L_Output_137
D=A
@FW__CALL
0;JMP
(L_Output_137)
// pop temp 0
@SP
M=M-1
A=M
D=M
@5
M=D
// push constant 45
@45
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 63
@63
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// call Output.create 12
@12
D=A
@R13
M=D
@Output.create
D=A
@R14
M=D
@L_Output_138
D=A
@FW__CALL
0;JMP
(L_Output_138)
// pop temp 0
@SP
M=M-1
A=M
D=M
@5
M=D
// push constant 46
@46
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 12
@12
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 12
@12
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// call Output.create 12
@12
D=A
@R13
M=D
@Output.create
D=A
@R14
M=D
@L_Output_139
D=A
@FW__CALL
0;JMP
(L_Output_139)
// pop temp 0
@SP
M=M-1
A=M
D=M
@5
M=D
// push constant 47
@47
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 32
@32
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 48
@48
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 24
@24
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 12
@12
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 6
@6
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 3
@3
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 1
@1
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// call Output.create 12
@12
D=A
@R13
M=D
@Output.create
D=A
@R14
M=D
@L_Output_140
D=A
@FW__CALL
0;JMP
(L_Output_140)
// pop temp 0
@SP
M=M-1
A=M
D=M
@5
M=D
// push constant 48
@48
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 12
@12
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 30
@30
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 51
@51
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 51
@51
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 51
@51
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 51
@51
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 51
@51
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 30
@30
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 12
@12
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// call Output.create 12
@12
D=A
@R13
M=D
@Output.create
D=A
@R14
M=D
@L_Output_141
D=A
@FW__CALL
0;JMP
(L_Output_141)
// pop temp 0
@SP
M=M-1
A=M
D=M
@5
M=D
// push constant 49
@49
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 12
@12
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 14
@14
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 15
@15
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 12
@12
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 12
@12
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 12
@12
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 12
@12
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 12
@12
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 63
@63
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// call Output.create 12
@12
D=A
@R13
M=D
@Output.create
D=A
@R14
M=D
@L_Output_142
D=A
@FW__CALL
0;JMP
(L_Output_142)
// pop temp 0
@SP
M=M-1
A=M
D=M
@5
M=D
// push constant 50
@50
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 30
@30
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 51
@51
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 48
@48
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 24
@24
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 12
@12
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 6
@6
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 3
@3
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 51
@51
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 63
@63
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// call Output.create 12
@12
D=A
@R13
M=D
@Output.create
D=A
@R14
M=D
@L_Output_143
D=A
@FW__CALL
0;JMP
(L_Output_143)
// pop temp 0
@SP
M=M-1
A=M
D=M
@5
M=D
// push constant 51
@51
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 30
@30
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 51
@51
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 48
@48
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 48
@48
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 28
@28
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 48
@48
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 48
@48
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 51
@51
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 30
@30
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// call Output.create 12
@12
D=A
@R13
M=D
@Output.create
D=A
@R14
M=D
@L_Output_144
D=A
@FW__CALL
0;JMP
(L_Output_144)
// pop temp 0
@SP
M=M-1
A=M
D=M
@5
M=D
// push constant 52
@52
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 16
@16
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 24
@24
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 28
@28
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 26
@26
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 25
@25
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 63
@63
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 24
@24
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 24
@24
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 60
@60
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// call Output.create 12
@12
D=A
@R13
M=D
@Output.create
D=A
@R14
M=D
@L_Output_145
D=A
@FW__CALL
0;JMP
(L_Output_145)
// pop temp 0
@SP
M=M-1
A=M
D=M
@5
M=D
// push constant 53
@53
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 63
@63
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 3
@3
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 3
@3
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 31
@31
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 48
@48
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 48
@48
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 48
@48
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 51
@51
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 30
@30
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// call Output.create 12
@12
D=A
@R13
M=D
@Output.create
D=A
@R14
M=D
@L_Output_146
D=A
@FW__CALL
0;JMP
(L_Output_146)
// pop temp 0
@SP
M=M-1
A=M
D=M
@5
M=D
// push constant 54
@54
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 28
@28
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 6
@6
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 3
@3
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 3
@3
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 31
@31
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 51
@51
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 51
@51
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 51
@51
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 30
@30
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// call Output.create 12
@12
D=A
@R13
M=D
@Output.create
D=A
@R14
M=D
@L_Output_147
D=A
@FW__CALL
0;JMP
(L_Output_147)
// pop temp 0
@SP
M=M-1
A=M
D=M
@5
M=D
// push constant 55
@55
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 63
@63
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 49
@49
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 48
@48
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 48
@48
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 24
@24
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 12
@12
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 12
@12
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 12
@12
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 12
@12
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// call Output.create 12
@12
D=A
@R13
M=D
@Output.create
D=A
@R14
M=D
@L_Output_148
D=A
@FW__CALL
0;JMP
(L_Output_148)
// pop temp 0
@SP
M=M-1
A=M
D=M
@5
M=D
// push constant 56
@56
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 30
@30
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 51
@51
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 51
@51
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 51
@51
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 30
@30
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 51
@51
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 51
@51
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 51
@51
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 30
@30
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// call Output.create 12
@12
D=A
@R13
M=D
@Output.create
D=A
@R14
M=D
@L_Output_149
D=A
@FW__CALL
0;JMP
(L_Output_149)
// pop temp 0
@SP
M=M-1
A=M
D=M
@5
M=D
// push constant 57
@57
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 30
@30
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 51
@51
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 51
@51
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 51
@51
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 62
@62
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 48
@48
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 48
@48
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 24
@24
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 14
@14
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// call Output.create 12
@12
D=A
@R13
M=D
@Output.create
D=A
@R14
M=D
@L_Output_150
D=A
@FW__CALL
0;JMP
(L_Output_150)
// pop temp 0
@SP
M=M-1
A=M
D=M
@5
M=D
// push constant 58
@58
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 12
@12
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 12
@12
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 12
@12
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 12
@12
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// call Output.create 12
@12
D=A
@R13
M=D
@Output.create
D=A
@R14
M=D
@L_Output_151
D=A
@FW__CALL
0;JMP
(L_Output_151)
// pop temp 0
@SP
M=M-1
A=M
D=M
@5
M=D
// push constant 59
@59
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 12
@12
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 12
@12
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 12
@12
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 12
@12
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 6
@6
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// call Output.create 12
@12
D=A
@R13
M=D
@Output.create
D=A
@R14
M=D
@L_Output_152
D=A
@FW__CALL
0;JMP
(L_Output_152)
// pop temp 0
@SP
M=M-1
A=M
D=M
@5
M=D
// push constant 60
@60
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 24
@24
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 12
@12
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 6
@6
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 3
@3
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 6
@6
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 12
@12
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 24
@24
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// call Output.create 12
@12
D=A
@R13
M=D
@Output.create
D=A
@R14
M=D
@L_Output_153
D=A
@FW__CALL
0;JMP
(L_Output_153)
// pop temp 0
@SP
M=M-1
A=M
D=M
@5
M=D
// push constant 61
@61
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 63
@63
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 63
@63
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// call Output.create 12
@12
D=A
@R13
M=D
@Output.create
D=A
@R14
M=D
@L_Output_154
D=A
@FW__CALL
0;JMP
(L_Output_154)
// pop temp 0
@SP
M=M-1
A=M
D=M
@5
M=D
// push constant 62
@62
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 3
@3
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 6
@6
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 12
@12
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 24
@24
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 12
@12
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 6
@6
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 3
@3
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// call Output.create 12
@12
D=A
@R13
M=D
@Output.create
D=A
@R14
M=D
@L_Output_155
D=A
@FW__CALL
0;JMP
(L_Output_155)
// pop temp 0
@SP
M=M-1
A=M
D=M
@5
M=D
// push constant 64
@64
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 30
@30
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 51
@51
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 51
@51
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 59
@59
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 59
@59
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 59
@59
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 27
@27
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 3
@3
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 30
@30
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// call Output.create 12
@12
D=A
@R13
M=D
@Output.create
D=A
@R14
M=D
@L_Output_156
D=A
@FW__CALL
0;JMP
(L_Output_156)
// pop temp 0
@SP
M=M-1
A=M
D=M
@5
M=D
// push constant 63
@63
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 30
@30
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 51
@51
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 51
@51
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 24
@24
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 12
@12
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 12
@12
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 12
@12
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 12
@12
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// call Output.create 12
@12
D=A
@R13
M=D
@Output.create
D=A
@R14
M=D
@L_Output_157
D=A
@FW__CALL
0;JMP
(L_Output_157)
// pop temp 0
@SP
M=M-1
A=M
D=M
@5
M=D
// push constant 65
@65
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 12
@12
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 30
@30
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 51
@51
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 51
@51
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 63
@63
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 51
@51
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 51
@51
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 51
@51
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 51
@51
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// call Output.create 12
@12
D=A
@R13
M=D
@Output.create
D=A
@R14
M=D
@L_Output_158
D=A
@FW__CALL
0;JMP
(L_Output_158)
// pop temp 0
@SP
M=M-1
A=M
D=M
@5
M=D
// push constant 66
@66
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 31
@31
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 51
@51
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 51
@51
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 51
@51
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 31
@31
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 51
@51
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 51
@51
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 51
@51
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 31
@31
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// call Output.create 12
@12
D=A
@R13
M=D
@Output.create
D=A
@R14
M=D
@L_Output_159
D=A
@FW__CALL
0;JMP
(L_Output_159)
// pop temp 0
@SP
M=M-1
A=M
D=M
@5
M=D
// push constant 67
@67
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 28
@28
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 54
@54
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 35
@35
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 3
@3
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 3
@3
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 3
@3
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 35
@35
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 54
@54
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 28
@28
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// call Output.create 12
@12
D=A
@R13
M=D
@Output.create
D=A
@R14
M=D
@L_Output_160
D=A
@FW__CALL
0;JMP
(L_Output_160)
// pop temp 0
@SP
M=M-1
A=M
D=M
@5
M=D
// push constant 68
@68
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 15
@15
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 27
@27
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 51
@51
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 51
@51
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 51
@51
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 51
@51
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 51
@51
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 27
@27
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 15
@15
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// call Output.create 12
@12
D=A
@R13
M=D
@Output.create
D=A
@R14
M=D
@L_Output_161
D=A
@FW__CALL
0;JMP
(L_Output_161)
// pop temp 0
@SP
M=M-1
A=M
D=M
@5
M=D
// push constant 69
@69
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 63
@63
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 51
@51
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 35
@35
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 11
@11
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 15
@15
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 11
@11
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 35
@35
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 51
@51
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 63
@63
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// call Output.create 12
@12
D=A
@R13
M=D
@Output.create
D=A
@R14
M=D
@L_Output_162
D=A
@FW__CALL
0;JMP
(L_Output_162)
// pop temp 0
@SP
M=M-1
A=M
D=M
@5
M=D
// push constant 70
@70
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 63
@63
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 51
@51
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 35
@35
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 11
@11
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 15
@15
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 11
@11
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 3
@3
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 3
@3
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 3
@3
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// call Output.create 12
@12
D=A
@R13
M=D
@Output.create
D=A
@R14
M=D
@L_Output_163
D=A
@FW__CALL
0;JMP
(L_Output_163)
// pop temp 0
@SP
M=M-1
A=M
D=M
@5
M=D
// push constant 71
@71
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 28
@28
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 54
@54
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 35
@35
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 3
@3
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 59
@59
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 51
@51
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 51
@51
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 54
@54
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 44
@44
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// call Output.create 12
@12
D=A
@R13
M=D
@Output.create
D=A
@R14
M=D
@L_Output_164
D=A
@FW__CALL
0;JMP
(L_Output_164)
// pop temp 0
@SP
M=M-1
A=M
D=M
@5
M=D
// push constant 72
@72
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 51
@51
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 51
@51
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 51
@51
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 51
@51
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 63
@63
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 51
@51
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 51
@51
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 51
@51
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 51
@51
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// call Output.create 12
@12
D=A
@R13
M=D
@Output.create
D=A
@R14
M=D
@L_Output_165
D=A
@FW__CALL
0;JMP
(L_Output_165)
// pop temp 0
@SP
M=M-1
A=M
D=M
@5
M=D
// push constant 73
@73
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 30
@30
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 12
@12
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 12
@12
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 12
@12
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 12
@12
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 12
@12
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 12
@12
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 12
@12
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 30
@30
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// call Output.create 12
@12
D=A
@R13
M=D
@Output.create
D=A
@R14
M=D
@L_Output_166
D=A
@FW__CALL
0;JMP
(L_Output_166)
// pop temp 0
@SP
M=M-1
A=M
D=M
@5
M=D
// push constant 74
@74
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 60
@60
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 24
@24
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 24
@24
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 24
@24
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 24
@24
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 24
@24
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 27
@27
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 27
@27
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 14
@14
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// call Output.create 12
@12
D=A
@R13
M=D
@Output.create
D=A
@R14
M=D
@L_Output_167
D=A
@FW__CALL
0;JMP
(L_Output_167)
// pop temp 0
@SP
M=M-1
A=M
D=M
@5
M=D
// push constant 75
@75
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 51
@51
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 51
@51
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 51
@51
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 27
@27
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 15
@15
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 27
@27
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 51
@51
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 51
@51
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 51
@51
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// call Output.create 12
@12
D=A
@R13
M=D
@Output.create
D=A
@R14
M=D
@L_Output_168
D=A
@FW__CALL
0;JMP
(L_Output_168)
// pop temp 0
@SP
M=M-1
A=M
D=M
@5
M=D
// push constant 76
@76
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 3
@3
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 3
@3
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 3
@3
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 3
@3
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 3
@3
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 3
@3
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 35
@35
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 51
@51
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 63
@63
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// call Output.create 12
@12
D=A
@R13
M=D
@Output.create
D=A
@R14
M=D
@L_Output_169
D=A
@FW__CALL
0;JMP
(L_Output_169)
// pop temp 0
@SP
M=M-1
A=M
D=M
@5
M=D
// push constant 77
@77
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 33
@33
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 51
@51
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 63
@63
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 63
@63
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 51
@51
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 51
@51
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 51
@51
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 51
@51
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 51
@51
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// call Output.create 12
@12
D=A
@R13
M=D
@Output.create
D=A
@R14
M=D
@L_Output_170
D=A
@FW__CALL
0;JMP
(L_Output_170)
// pop temp 0
@SP
M=M-1
A=M
D=M
@5
M=D
// push constant 78
@78
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 51
@51
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 51
@51
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 55
@55
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 55
@55
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 63
@63
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 59
@59
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 59
@59
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 51
@51
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 51
@51
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// call Output.create 12
@12
D=A
@R13
M=D
@Output.create
D=A
@R14
M=D
@L_Output_171
D=A
@FW__CALL
0;JMP
(L_Output_171)
// pop temp 0
@SP
M=M-1
A=M
D=M
@5
M=D
// push constant 79
@79
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 30
@30
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 51
@51
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 51
@51
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 51
@51
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 51
@51
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 51
@51
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 51
@51
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 51
@51
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 30
@30
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// call Output.create 12
@12
D=A
@R13
M=D
@Output.create
D=A
@R14
M=D
@L_Output_172
D=A
@FW__CALL
0;JMP
(L_Output_172)
// pop temp 0
@SP
M=M-1
A=M
D=M
@5
M=D
// push constant 80
@80
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 31
@31
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 51
@51
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 51
@51
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 51
@51
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 31
@31
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 3
@3
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 3
@3
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 3
@3
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 3
@3
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// call Output.create 12
@12
D=A
@R13
M=D
@Output.create
D=A
@R14
M=D
@L_Output_173
D=A
@FW__CALL
0;JMP
(L_Output_173)
// pop temp 0
@SP
M=M-1
A=M
D=M
@5
M=D
// push constant 81
@81
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 30
@30
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 51
@51
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 51
@51
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 51
@51
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 51
@51
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 51
@51
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 63
@63
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 59
@59
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 30
@30
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 48
@48
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// call Output.create 12
@12
D=A
@R13
M=D
@Output.create
D=A
@R14
M=D
@L_Output_174
D=A
@FW__CALL
0;JMP
(L_Output_174)
// pop temp 0
@SP
M=M-1
A=M
D=M
@5
M=D
// push constant 82
@82
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 31
@31
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 51
@51
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 51
@51
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 51
@51
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 31
@31
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 27
@27
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 51
@51
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 51
@51
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 51
@51
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// call Output.create 12
@12
D=A
@R13
M=D
@Output.create
D=A
@R14
M=D
@L_Output_175
D=A
@FW__CALL
0;JMP
(L_Output_175)
// pop temp 0
@SP
M=M-1
A=M
D=M
@5
M=D
// push constant 83
@83
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 30
@30
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 51
@51
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 51
@51
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 6
@6
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 28
@28
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 48
@48
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 51
@51
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 51
@51
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 30
@30
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// call Output.create 12
@12
D=A
@R13
M=D
@Output.create
D=A
@R14
M=D
@L_Output_176
D=A
@FW__CALL
0;JMP
(L_Output_176)
// pop temp 0
@SP
M=M-1
A=M
D=M
@5
M=D
// push constant 84
@84
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 63
@63
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 63
@63
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 45
@45
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 12
@12
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 12
@12
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 12
@12
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 12
@12
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 12
@12
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 30
@30
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// call Output.create 12
@12
D=A
@R13
M=D
@Output.create
D=A
@R14
M=D
@L_Output_177
D=A
@FW__CALL
0;JMP
(L_Output_177)
// pop temp 0
@SP
M=M-1
A=M
D=M
@5
M=D
// push constant 85
@85
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 51
@51
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 51
@51
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 51
@51
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 51
@51
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 51
@51
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 51
@51
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 51
@51
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 51
@51
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 30
@30
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// call Output.create 12
@12
D=A
@R13
M=D
@Output.create
D=A
@R14
M=D
@L_Output_178
D=A
@FW__CALL
0;JMP
(L_Output_178)
// pop temp 0
@SP
M=M-1
A=M
D=M
@5
M=D
// push constant 86
@86
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 51
@51
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 51
@51
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 51
@51
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 51
@51
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 51
@51
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 30
@30
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 30
@30
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 12
@12
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 12
@12
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// call Output.create 12
@12
D=A
@R13
M=D
@Output.create
D=A
@R14
M=D
@L_Output_179
D=A
@FW__CALL
0;JMP
(L_Output_179)
// pop temp 0
@SP
M=M-1
A=M
D=M
@5
M=D
// push constant 87
@87
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 51
@51
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 51
@51
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 51
@51
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 51
@51
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 51
@51
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 63
@63
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 63
@63
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 63
@63
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 18
@18
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// call Output.create 12
@12
D=A
@R13
M=D
@Output.create
D=A
@R14
M=D
@L_Output_180
D=A
@FW__CALL
0;JMP
(L_Output_180)
// pop temp 0
@SP
M=M-1
A=M
D=M
@5
M=D
// push constant 88
@88
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 51
@51
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 51
@51
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 30
@30
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 30
@30
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 12
@12
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 30
@30
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 30
@30
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 51
@51
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 51
@51
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// call Output.create 12
@12
D=A
@R13
M=D
@Output.create
D=A
@R14
M=D
@L_Output_181
D=A
@FW__CALL
0;JMP
(L_Output_181)
// pop temp 0
@SP
M=M-1
A=M
D=M
@5
M=D
// push constant 89
@89
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 51
@51
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 51
@51
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 51
@51
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 51
@51
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 30
@30
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 12
@12
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 12
@12
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 12
@12
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 30
@30
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// call Output.create 12
@12
D=A
@R13
M=D
@Output.create
D=A
@R14
M=D
@L_Output_182
D=A
@FW__CALL
0;JMP
(L_Output_182)
// pop temp 0
@SP
M=M-1
A=M
D=M
@5
M=D
// push constant 90
@90
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 63
@63
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 51
@51
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 49
@49
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 24
@24
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 12
@12
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 6
@6
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 35
@35
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 51
@51
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 63
@63
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// call Output.create 12
@12
D=A
@R13
M=D
@Output.create
D=A
@R14
M=D
@L_Output_183
D=A
@FW__CALL
0;JMP
(L_Output_183)
// pop temp 0
@SP
M=M-1
A=M
D=M
@5
M=D
// push constant 91
@91
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 30
@30
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 6
@6
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 6
@6
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 6
@6
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 6
@6
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 6
@6
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 6
@6
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 6
@6
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 30
@30
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// call Output.create 12
@12
D=A
@R13
M=D
@Output.create
D=A
@R14
M=D
@L_Output_184
D=A
@FW__CALL
0;JMP
(L_Output_184)
// pop temp 0
@SP
M=M-1
A=M
D=M
@5
M=D
// push constant 92
@92
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 1
@1
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 3
@3
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 6
@6
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 12
@12
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 24
@24
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 48
@48
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 32
@32
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// call Output.create 12
@12
D=A
@R13
M=D
@Output.create
D=A
@R14
M=D
@L_Output_185
D=A
@FW__CALL
0;JMP
(L_Output_185)
// pop temp 0
@SP
M=M-1
A=M
D=M
@5
M=D
// push constant 93
@93
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 30
@30
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 24
@24
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 24
@24
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 24
@24
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 24
@24
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 24
@24
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 24
@24
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 24
@24
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 30
@30
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// call Output.create 12
@12
D=A
@R13
M=D
@Output.create
D=A
@R14
M=D
@L_Output_186
D=A
@FW__CALL
0;JMP
(L_Output_186)
// pop temp 0
@SP
M=M-1
A=M
D=M
@5
M=D
// push constant 94
@94
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 8
@8
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 28
@28
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 54
@54
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// call Output.create 12
@12
D=A
@R13
M=D
@Output.create
D=A
@R14
M=D
@L_Output_187
D=A
@FW__CALL
0;JMP
(L_Output_187)
// pop temp 0
@SP
M=M-1
A=M
D=M
@5
M=D
// push constant 95
@95
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 63
@63
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// call Output.create 12
@12
D=A
@R13
M=D
@Output.create
D=A
@R14
M=D
@L_Output_188
D=A
@FW__CALL
0;JMP
(L_Output_188)
// pop temp 0
@SP
M=M-1
A=M
D=M
@5
M=D
// push constant 96
@96
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 6
@6
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 12
@12
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 24
@24
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// call Output.create 12
@12
D=A
@R13
M=D
@Output.create
D=A
@R14
M=D
@L_Output_189
D=A
@FW__CALL
0;JMP
(L_Output_189)
// pop temp 0
@SP
M=M-1
A=M
D=M
@5
M=D
// push constant 97
@97
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 14
@14
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 24
@24
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 30
@30
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 27
@27
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 27
@27
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 54
@54
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// call Output.create 12
@12
D=A
@R13
M=D
@Output.create
D=A
@R14
M=D
@L_Output_190
D=A
@FW__CALL
0;JMP
(L_Output_190)
// pop temp 0
@SP
M=M-1
A=M
D=M
@5
M=D
// push constant 98
@98
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 3
@3
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 3
@3
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 3
@3
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 15
@15
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 27
@27
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 51
@51
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 51
@51
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 51
@51
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 30
@30
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// call Output.create 12
@12
D=A
@R13
M=D
@Output.create
D=A
@R14
M=D
@L_Output_191
D=A
@FW__CALL
0;JMP
(L_Output_191)
// pop temp 0
@SP
M=M-1
A=M
D=M
@5
M=D
// push constant 99
@99
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 30
@30
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 51
@51
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 3
@3
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 3
@3
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 51
@51
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 30
@30
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// call Output.create 12
@12
D=A
@R13
M=D
@Output.create
D=A
@R14
M=D
@L_Output_192
D=A
@FW__CALL
0;JMP
(L_Output_192)
// pop temp 0
@SP
M=M-1
A=M
D=M
@5
M=D
// push constant 100
@100
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 48
@48
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 48
@48
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 48
@48
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 60
@60
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 54
@54
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 51
@51
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 51
@51
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 51
@51
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 30
@30
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// call Output.create 12
@12
D=A
@R13
M=D
@Output.create
D=A
@R14
M=D
@L_Output_193
D=A
@FW__CALL
0;JMP
(L_Output_193)
// pop temp 0
@SP
M=M-1
A=M
D=M
@5
M=D
// push constant 101
@101
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 30
@30
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 51
@51
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 63
@63
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 3
@3
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 51
@51
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 30
@30
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// call Output.create 12
@12
D=A
@R13
M=D
@Output.create
D=A
@R14
M=D
@L_Output_194
D=A
@FW__CALL
0;JMP
(L_Output_194)
// pop temp 0
@SP
M=M-1
A=M
D=M
@5
M=D
// push constant 102
@102
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 28
@28
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 54
@54
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 38
@38
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 6
@6
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 15
@15
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 6
@6
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 6
@6
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 6
@6
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 15
@15
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// call Output.create 12
@12
D=A
@R13
M=D
@Output.create
D=A
@R14
M=D
@L_Output_195
D=A
@FW__CALL
0;JMP
(L_Output_195)
// pop temp 0
@SP
M=M-1
A=M
D=M
@5
M=D
// push constant 103
@103
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 30
@30
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 51
@51
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 51
@51
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 51
@51
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 62
@62
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 48
@48
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 51
@51
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 30
@30
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// call Output.create 12
@12
D=A
@R13
M=D
@Output.create
D=A
@R14
M=D
@L_Output_196
D=A
@FW__CALL
0;JMP
(L_Output_196)
// pop temp 0
@SP
M=M-1
A=M
D=M
@5
M=D
// push constant 104
@104
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 3
@3
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 3
@3
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 3
@3
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 27
@27
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 55
@55
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 51
@51
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 51
@51
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 51
@51
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 51
@51
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// call Output.create 12
@12
D=A
@R13
M=D
@Output.create
D=A
@R14
M=D
@L_Output_197
D=A
@FW__CALL
0;JMP
(L_Output_197)
// pop temp 0
@SP
M=M-1
A=M
D=M
@5
M=D
// push constant 105
@105
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 12
@12
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 12
@12
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 14
@14
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 12
@12
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 12
@12
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 12
@12
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 12
@12
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 30
@30
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// call Output.create 12
@12
D=A
@R13
M=D
@Output.create
D=A
@R14
M=D
@L_Output_198
D=A
@FW__CALL
0;JMP
(L_Output_198)
// pop temp 0
@SP
M=M-1
A=M
D=M
@5
M=D
// push constant 106
@106
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 48
@48
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 48
@48
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 56
@56
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 48
@48
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 48
@48
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 48
@48
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 48
@48
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 51
@51
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 30
@30
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// call Output.create 12
@12
D=A
@R13
M=D
@Output.create
D=A
@R14
M=D
@L_Output_199
D=A
@FW__CALL
0;JMP
(L_Output_199)
// pop temp 0
@SP
M=M-1
A=M
D=M
@5
M=D
// push constant 107
@107
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 3
@3
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 3
@3
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 3
@3
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 51
@51
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 27
@27
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 15
@15
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 15
@15
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 27
@27
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 51
@51
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// call Output.create 12
@12
D=A
@R13
M=D
@Output.create
D=A
@R14
M=D
@L_Output_200
D=A
@FW__CALL
0;JMP
(L_Output_200)
// pop temp 0
@SP
M=M-1
A=M
D=M
@5
M=D
// push constant 108
@108
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 14
@14
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 12
@12
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 12
@12
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 12
@12
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 12
@12
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 12
@12
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 12
@12
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 12
@12
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 30
@30
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// call Output.create 12
@12
D=A
@R13
M=D
@Output.create
D=A
@R14
M=D
@L_Output_201
D=A
@FW__CALL
0;JMP
(L_Output_201)
// pop temp 0
@SP
M=M-1
A=M
D=M
@5
M=D
// push constant 109
@109
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 29
@29
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 63
@63
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 43
@43
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 43
@43
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 43
@43
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 43
@43
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// call Output.create 12
@12
D=A
@R13
M=D
@Output.create
D=A
@R14
M=D
@L_Output_202
D=A
@FW__CALL
0;JMP
(L_Output_202)
// pop temp 0
@SP
M=M-1
A=M
D=M
@5
M=D
// push constant 110
@110
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 29
@29
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 51
@51
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 51
@51
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 51
@51
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 51
@51
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 51
@51
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// call Output.create 12
@12
D=A
@R13
M=D
@Output.create
D=A
@R14
M=D
@L_Output_203
D=A
@FW__CALL
0;JMP
(L_Output_203)
// pop temp 0
@SP
M=M-1
A=M
D=M
@5
M=D
// push constant 111
@111
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 30
@30
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 51
@51
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 51
@51
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 51
@51
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 51
@51
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 30
@30
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// call Output.create 12
@12
D=A
@R13
M=D
@Output.create
D=A
@R14
M=D
@L_Output_204
D=A
@FW__CALL
0;JMP
(L_Output_204)
// pop temp 0
@SP
M=M-1
A=M
D=M
@5
M=D
// push constant 112
@112
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 30
@30
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 51
@51
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 51
@51
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 51
@51
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 31
@31
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 3
@3
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 3
@3
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// call Output.create 12
@12
D=A
@R13
M=D
@Output.create
D=A
@R14
M=D
@L_Output_205
D=A
@FW__CALL
0;JMP
(L_Output_205)
// pop temp 0
@SP
M=M-1
A=M
D=M
@5
M=D
// push constant 113
@113
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 30
@30
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 51
@51
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 51
@51
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 51
@51
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 62
@62
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 48
@48
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 48
@48
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// call Output.create 12
@12
D=A
@R13
M=D
@Output.create
D=A
@R14
M=D
@L_Output_206
D=A
@FW__CALL
0;JMP
(L_Output_206)
// pop temp 0
@SP
M=M-1
A=M
D=M
@5
M=D
// push constant 114
@114
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 29
@29
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 55
@55
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 51
@51
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 3
@3
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 3
@3
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 7
@7
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// call Output.create 12
@12
D=A
@R13
M=D
@Output.create
D=A
@R14
M=D
@L_Output_207
D=A
@FW__CALL
0;JMP
(L_Output_207)
// pop temp 0
@SP
M=M-1
A=M
D=M
@5
M=D
// push constant 115
@115
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 30
@30
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 51
@51
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 6
@6
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 24
@24
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 51
@51
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 30
@30
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// call Output.create 12
@12
D=A
@R13
M=D
@Output.create
D=A
@R14
M=D
@L_Output_208
D=A
@FW__CALL
0;JMP
(L_Output_208)
// pop temp 0
@SP
M=M-1
A=M
D=M
@5
M=D
// push constant 116
@116
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 4
@4
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 6
@6
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 6
@6
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 15
@15
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 6
@6
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 6
@6
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 6
@6
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 54
@54
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 28
@28
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// call Output.create 12
@12
D=A
@R13
M=D
@Output.create
D=A
@R14
M=D
@L_Output_209
D=A
@FW__CALL
0;JMP
(L_Output_209)
// pop temp 0
@SP
M=M-1
A=M
D=M
@5
M=D
// push constant 117
@117
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 27
@27
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 27
@27
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 27
@27
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 27
@27
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 27
@27
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 54
@54
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// call Output.create 12
@12
D=A
@R13
M=D
@Output.create
D=A
@R14
M=D
@L_Output_210
D=A
@FW__CALL
0;JMP
(L_Output_210)
// pop temp 0
@SP
M=M-1
A=M
D=M
@5
M=D
// push constant 118
@118
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 51
@51
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 51
@51
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 51
@51
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 51
@51
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 30
@30
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 12
@12
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// call Output.create 12
@12
D=A
@R13
M=D
@Output.create
D=A
@R14
M=D
@L_Output_211
D=A
@FW__CALL
0;JMP
(L_Output_211)
// pop temp 0
@SP
M=M-1
A=M
D=M
@5
M=D
// push constant 119
@119
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 51
@51
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 51
@51
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 51
@51
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 63
@63
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 63
@63
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 18
@18
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// call Output.create 12
@12
D=A
@R13
M=D
@Output.create
D=A
@R14
M=D
@L_Output_212
D=A
@FW__CALL
0;JMP
(L_Output_212)
// pop temp 0
@SP
M=M-1
A=M
D=M
@5
M=D
// push constant 120
@120
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 51
@51
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 30
@30
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 12
@12
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 12
@12
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 30
@30
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 51
@51
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// call Output.create 12
@12
D=A
@R13
M=D
@Output.create
D=A
@R14
M=D
@L_Output_213
D=A
@FW__CALL
0;JMP
(L_Output_213)
// pop temp 0
@SP
M=M-1
A=M
D=M
@5
M=D
// push constant 121
@121
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 51
@51
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 51
@51
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 51
@51
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 62
@62
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 48
@48
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 24
@24
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 15
@15
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// call Output.create 12
@12
D=A
@R13
M=D
@Output.create
D=A
@R14
M=D
@L_Output_214
D=A
@FW__CALL
0;JMP
(L_Output_214)
// pop temp 0
@SP
M=M-1
A=M
D=M
@5
M=D
// push constant 122
@122
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 63
@63
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 27
@27
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 12
@12
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 6
@6
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 51
@51
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 63
@63
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// call Output.create 12
@12
D=A
@R13
M=D
@Output.create
D=A
@R14
M=D
@L_Output_215
D=A
@FW__CALL
0;JMP
(L_Output_215)
// pop temp 0
@SP
M=M-1
A=M
D=M
@5
M=D
// push constant 123
@123
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 56
@56
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 12
@12
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 12
@12
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 12
@12
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 7
@7
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 12
@12
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 12
@12
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 12
@12
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 56
@56
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// call Output.create 12
@12
D=A
@R13
M=D
@Output.create
D=A
@R14
M=D
@L_Output_216
D=A
@FW__CALL
0;JMP
(L_Output_216)
// pop temp 0
@SP
M=M-1
A=M
D=M
@5
M=D
// push constant 124
@124
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 12
@12
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 12
@12
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 12
@12
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 12
@12
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 12
@12
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 12
@12
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 12
@12
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 12
@12
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 12
@12
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// call Output.create 12
@12
D=A
@R13
M=D
@Output.create
D=A
@R14
M=D
@L_Output_217
D=A
@FW__CALL
0;JMP
(L_Output_217)
// pop temp 0
@SP
M=M-1
A=M
D=M
@5
M=D
// push constant 125
@125
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 7
@7
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 12
@12
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 12
@12
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 12
@12
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 56
@56
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 12
@12
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 12
@12
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 12
@12
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 7
@7
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// call Output.create 12
@12
D=A
@R13
M=D
@Output.create
D=A
@R14
M=D
@L_Output_218
D=A
@FW__CALL
0;JMP
(L_Output_218)
// pop temp 0
@SP
M=M-1
A=M
D=M
@5
M=D
// push constant 126
@126
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 38
@38
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 45
@45
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 25
@25
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// call Output.create 12
@12
D=A
@R13
M=D
@Output.create
D=A
@R14
M=D
@L_Output_219
D=A
@FW__CALL
0;JMP
(L_Output_219)
// pop temp 0
@SP
M=M-1
A=M
D=M
@5
M=D
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// return
@FW__RETURN
0;JMP
// function Output.create 1
(Output.create)
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 11
@11
D=A
@SP
A=M
M=D
@SP
M=M+1
// call Array.new 1
@1
D=A
@R13
M=D
@Array.new
D=A
@R14
M=D
@L_Output_220
D=A
@FW__CALL
0;JMP
(L_Output_220)
// pop local 0
@1
D=M
@0
D=D+A
@R13
M=D
@SP
M=M-1
A=M
D=M
@R13
A=M
M=D
// push argument 0
@2
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// push static 5
@Output.5
D=M
@SP
A=M
M=D
@SP
M=M+1
// add
@SP
M=M-1
A=M
D=M
@SP
M=M-1
A=M
M=D+M
@SP
M=M+1
// push local 0
@1
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// pop temp 0
@SP
M=M-1
A=M
D=M
@5
M=D
// pop pointer 1
@SP
M=M-1
A=M
D=M
@4
M=D
// push temp 0
@5
D=M
@SP
A=M
M=D
@SP
M=M+1
// pop that 0
@4
D=M
@0
D=D+A
@R13
M=D
@SP
M=M-1
A=M
D=M
@R13
A=M
M=D
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// push local 0
@1
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// add
@SP
M=M-1
A=M
D=M
@SP
M=M-1
A=M
M=D+M
@SP
M=M+1
// push argument 1
@2
D=M
@1
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// pop temp 0
@SP
M=M-1
A=M
D=M
@5
M=D
// pop pointer 1
@SP
M=M-1
A=M
D=M
@4
M=D
// push temp 0
@5
D=M
@SP
A=M
M=D
@SP
M=M+1
// pop that 0
@4
D=M
@0
D=D+A
@R13
M=D
@SP
M=M-1
A=M
D=M
@R13
A=M
M=D
// push constant 1
@1
D=A
@SP
A=M
M=D
@SP
M=M+1
// push local 0
@1
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// add
@SP
M=M-1
A=M
D=M
@SP
M=M-1
A=M
M=D+M
@SP
M=M+1
// push argument 2
@2
D=M
@2
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// pop temp 0
@SP
M=M-1
A=M
D=M
@5
M=D
// pop pointer 1
@SP
M=M-1
A=M
D=M
@4
M=D
// push temp 0
@5
D=M
@SP
A=M
M=D
@SP
M=M+1
// pop that 0
@4
D=M
@0
D=D+A
@R13
M=D
@SP
M=M-1
A=M
D=M
@R13
A=M
M=D
// push constant 2
@2
D=A
@SP
A=M
M=D
@SP
M=M+1
// push local 0
@1
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// add
@SP
M=M-1
A=M
D=M
@SP
M=M-1
A=M
M=D+M
@SP
M=M+1
// push argument 3
@2
D=M
@3
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// pop temp 0
@SP
M=M-1
A=M
D=M
@5
M=D
// pop pointer 1
@SP
M=M-1
A=M
D=M
@4
M=D
// push temp 0
@5
D=M
@SP
A=M
M=D
@SP
M=M+1
// pop that 0
@4
D=M
@0
D=D+A
@R13
M=D
@SP
M=M-1
A=M
D=M
@R13
A=M
M=D
// push constant 3
@3
D=A
@SP
A=M
M=D
@SP
M=M+1
// push local 0
@1
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// add
@SP
M=M-1
A=M
D=M
@SP
M=M-1
A=M
M=D+M
@SP
M=M+1
// push argument 4
@2
D=M
@4
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// pop temp 0
@SP
M=M-1
A=M
D=M
@5
M=D
// pop pointer 1
@SP
M=M-1
A=M
D=M
@4
M=D
// push temp 0
@5
D=M
@SP
A=M
M=D
@SP
M=M+1
// pop that 0
@4
D=M
@0
D=D+A
@R13
M=D
@SP
M=M-1
A=M
D=M
@R13
A=M
M=D
// push constant 4
@4
D=A
@SP
A=M
M=D
@SP
M=M+1
// push local 0
@1
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// add
@SP
M=M-1
A=M
D=M
@SP
M=M-1
A=M
M=D+M
@SP
M=M+1
// push argument 5
@2
D=M
@5
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// pop temp 0
@SP
M=M-1
A=M
D=M
@5
M=D
// pop pointer 1
@SP
M=M-1
A=M
D=M
@4
M=D
// push temp 0
@5
D=M
@SP
A=M
M=D
@SP
M=M+1
// pop that 0
@4
D=M
@0
D=D+A
@R13
M=D
@SP
M=M-1
A=M
D=M
@R13
A=M
M=D
// push constant 5
@5
D=A
@SP
A=M
M=D
@SP
M=M+1
// push local 0
@1
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// add
@SP
M=M-1
A=M
D=M
@SP
M=M-1
A=M
M=D+M
@SP
M=M+1
// push argument 6
@2
D=M
@6
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// pop temp 0
@SP
M=M-1
A=M
D=M
@5
M=D
// pop pointer 1
@SP
M=M-1
A=M
D=M
@4
M=D
// push temp 0
@5
D=M
@SP
A=M
M=D
@SP
M=M+1
// pop that 0
@4
D=M
@0
D=D+A
@R13
M=D
@SP
M=M-1
A=M
D=M
@R13
A=M
M=D
// push constant 6
@6
D=A
@SP
A=M
M=D
@SP
M=M+1
// push local 0
@1
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// add
@SP
M=M-1
A=M
D=M
@SP
M=M-1
A=M
M=D+M
@SP
M=M+1
// push argument 7
@2
D=M
@7
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// pop temp 0
@SP
M=M-1
A=M
D=M
@5
M=D
// pop pointer 1
@SP
M=M-1
A=M
D=M
@4
M=D
// push temp 0
@5
D=M
@SP
A=M
M=D
@SP
M=M+1
// pop that 0
@4
D=M
@0
D=D+A
@R13
M=D
@SP
M=M-1
A=M
D=M
@R13
A=M
M=D
// push constant 7
@7
D=A
@SP
A=M
M=D
@SP
M=M+1
// push local 0
@1
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// add
@SP
M=M-1
A=M
D=M
@SP
M=M-1
A=M
M=D+M
@SP
M=M+1
// push argument 8
@2
D=M
@8
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// pop temp 0
@SP
M=M-1
A=M
D=M
@5
M=D
// pop pointer 1
@SP
M=M-1
A=M
D=M
@4
M=D
// push temp 0
@5
D=M
@SP
A=M
M=D
@SP
M=M+1
// pop that 0
@4
D=M
@0
D=D+A
@R13
M=D
@SP
M=M-1
A=M
D=M
@R13
A=M
M=D
// push constant 8
@8
D=A
@SP
A=M
M=D
@SP
M=M+1
// push local 0
@1
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// add
@SP
M=M-1
A=M
D=M
@SP
M=M-1
A=M
M=D+M
@SP
M=M+1
// push argument 9
@2
D=M
@9
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// pop temp 0
@SP
M=M-1
A=M
D=M
@5
M=D
// pop pointer 1
@SP
M=M-1
A=M
D=M
@4
M=D
// push temp 0
@5
D=M
@SP
A=M
M=D
@SP
M=M+1
// pop that 0
@4
D=M
@0
D=D+A
@R13
M=D
@SP
M=M-1
A=M
D=M
@R13
A=M
M=D
// push constant 9
@9
D=A
@SP
A=M
M=D
@SP
M=M+1
// push local 0
@1
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// add
@SP
M=M-1
A=M
D=M
@SP
M=M-1
A=M
M=D+M
@SP
M=M+1
// push argument 10
@2
D=M
@10
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// pop temp 0
@SP
M=M-1
A=M
D=M
@5
M=D
// pop pointer 1
@SP
M=M-1
A=M
D=M
@4
M=D
// push temp 0
@5
D=M
@SP
A=M
M=D
@SP
M=M+1
// pop that 0
@4
D=M
@0
D=D+A
@R13
M=D
@SP
M=M-1
A=M
D=M
@R13
A=M
M=D
// push constant 10
@10
D=A
@SP
A=M
M=D
@SP
M=M+1
// push local 0
@1
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// add
@SP
M=M-1
A=M
D=M
@SP
M=M-1
A=M
M=D+M
@SP
M=M+1
// push argument 11
@2
D=M
@11
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// pop temp 0
@SP
M=M-1
A=M
D=M
@5
M=D
// pop pointer 1
@SP
M=M-1
A=M
D=M
@4
M=D
// push temp 0
@5
D=M
@SP
A=M
M=D
@SP
M=M+1
// pop that 0
@4
D=M
@0
D=D+A
@R13
M=D
@SP
M=M-1
A=M
D=M
@R13
A=M
M=D
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// return
@FW__RETURN
0;JMP
// function Output.createShiftedMap 4
(Output.createShiftedMap)
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 127
@127
D=A
@SP
A=M
M=D
@SP
M=M+1
// call Array.new 1
@1
D=A
@R13
M=D
@Array.new
D=A
@R14
M=D
@L_Output_221
D=A
@FW__CALL
0;JMP
(L_Output_221)
// pop static 6
@SP
M=M-1
A=M
D=M
@Output.6
M=D
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// pop local 2
@1
D=M
@2
D=D+A
@R13
M=D
@SP
M=M-1
A=M
D=M
@R13
A=M
M=D
// label WHILE_EXP0
(Output.Output.createShiftedMap$WHILE_EXP0)
// push local 2
@1
D=M
@2
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// push constant 127
@127
D=A
@SP
A=M
M=D
@SP
M=M+1
// lt
@SP
M=M-1
A=M
D=M
@SP
M=M-1
A=M
D=D-M
@L_Output_222
D;JLE
D=-1
@L_Output_223
D;JMP
(L_Output_222)
D=0
(L_Output_223)
@SP
A=M
M=D
@SP
M=M+1
// not
@SP
M=M-1
A=M
M=!M
@SP
M=M+1
// if-goto WHILE_END0
@SP
M=M-1
A=M
D=M
@Output.Output.createShiftedMap$WHILE_END0
D;JNE
// push local 2
@1
D=M
@2
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// push static 5
@Output.5
D=M
@SP
A=M
M=D
@SP
M=M+1
// add
@SP
M=M-1
A=M
D=M
@SP
M=M-1
A=M
M=D+M
@SP
M=M+1
// pop pointer 1
@SP
M=M-1
A=M
D=M
@4
M=D
// push that 0
@THAT
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// pop local 0
@1
D=M
@0
D=D+A
@R13
M=D
@SP
M=M-1
A=M
D=M
@R13
A=M
M=D
// push constant 11
@11
D=A
@SP
A=M
M=D
@SP
M=M+1
// call Array.new 1
@1
D=A
@R13
M=D
@Array.new
D=A
@R14
M=D
@L_Output_224
D=A
@FW__CALL
0;JMP
(L_Output_224)
// pop local 1
@1
D=M
@1
D=D+A
@R13
M=D
@SP
M=M-1
A=M
D=M
@R13
A=M
M=D
// push local 2
@1
D=M
@2
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// push static 6
@Output.6
D=M
@SP
A=M
M=D
@SP
M=M+1
// add
@SP
M=M-1
A=M
D=M
@SP
M=M-1
A=M
M=D+M
@SP
M=M+1
// push local 1
@1
D=M
@1
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// pop temp 0
@SP
M=M-1
A=M
D=M
@5
M=D
// pop pointer 1
@SP
M=M-1
A=M
D=M
@4
M=D
// push temp 0
@5
D=M
@SP
A=M
M=D
@SP
M=M+1
// pop that 0
@4
D=M
@0
D=D+A
@R13
M=D
@SP
M=M-1
A=M
D=M
@R13
A=M
M=D
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// pop local 3
@1
D=M
@3
D=D+A
@R13
M=D
@SP
M=M-1
A=M
D=M
@R13
A=M
M=D
// label WHILE_EXP1
(Output.Output.createShiftedMap$WHILE_EXP1)
// push local 3
@1
D=M
@3
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// push constant 11
@11
D=A
@SP
A=M
M=D
@SP
M=M+1
// lt
@SP
M=M-1
A=M
D=M
@SP
M=M-1
A=M
D=D-M
@L_Output_225
D;JLE
D=-1
@L_Output_226
D;JMP
(L_Output_225)
D=0
(L_Output_226)
@SP
A=M
M=D
@SP
M=M+1
// not
@SP
M=M-1
A=M
M=!M
@SP
M=M+1
// if-goto WHILE_END1
@SP
M=M-1
A=M
D=M
@Output.Output.createShiftedMap$WHILE_END1
D;JNE
// push local 3
@1
D=M
@3
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// push local 1
@1
D=M
@1
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// add
@SP
M=M-1
A=M
D=M
@SP
M=M-1
A=M
M=D+M
@SP
M=M+1
// push local 3
@1
D=M
@3
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// push local 0
@1
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// add
@SP
M=M-1
A=M
D=M
@SP
M=M-1
A=M
M=D+M
@SP
M=M+1
// pop pointer 1
@SP
M=M-1
A=M
D=M
@4
M=D
// push that 0
@THAT
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// push constant 256
@256
D=A
@SP
A=M
M=D
@SP
M=M+1
// call Math.multiply 2
@2
D=A
@R13
M=D
@Math.multiply
D=A
@R14
M=D
@L_Output_227
D=A
@FW__CALL
0;JMP
(L_Output_227)
// pop temp 0
@SP
M=M-1
A=M
D=M
@5
M=D
// pop pointer 1
@SP
M=M-1
A=M
D=M
@4
M=D
// push temp 0
@5
D=M
@SP
A=M
M=D
@SP
M=M+1
// pop that 0
@4
D=M
@0
D=D+A
@R13
M=D
@SP
M=M-1
A=M
D=M
@R13
A=M
M=D
// push local 3
@1
D=M
@3
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// push constant 1
@1
D=A
@SP
A=M
M=D
@SP
M=M+1
// add
@SP
M=M-1
A=M
D=M
@SP
M=M-1
A=M
M=D+M
@SP
M=M+1
// pop local 3
@1
D=M
@3
D=D+A
@R13
M=D
@SP
M=M-1
A=M
D=M
@R13
A=M
M=D
// goto WHILE_EXP1
@Output.Output.createShiftedMap$WHILE_EXP1
0;JMP
// label WHILE_END1
(Output.Output.createShiftedMap$WHILE_END1)
// push local 2
@1
D=M
@2
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// eq
@SP
M=M-1
A=M
D=M
@SP
M=M-1
A=M
D=D-M
@L_Output_228
D;JNE
D=-1
@L_Output_229
D;JMP
(L_Output_228)
D=0
(L_Output_229)
@SP
A=M
M=D
@SP
M=M+1
// if-goto IF_TRUE0
@SP
M=M-1
A=M
D=M
@Output.Output.createShiftedMap$IF_TRUE0
D;JNE
// goto IF_FALSE0
@Output.Output.createShiftedMap$IF_FALSE0
0;JMP
// label IF_TRUE0
(Output.Output.createShiftedMap$IF_TRUE0)
// push constant 32
@32
D=A
@SP
A=M
M=D
@SP
M=M+1
// pop local 2
@1
D=M
@2
D=D+A
@R13
M=D
@SP
M=M-1
A=M
D=M
@R13
A=M
M=D
// goto IF_END0
@Output.Output.createShiftedMap$IF_END0
0;JMP
// label IF_FALSE0
(Output.Output.createShiftedMap$IF_FALSE0)
// push local 2
@1
D=M
@2
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// push constant 1
@1
D=A
@SP
A=M
M=D
@SP
M=M+1
// add
@SP
M=M-1
A=M
D=M
@SP
M=M-1
A=M
M=D+M
@SP
M=M+1
// pop local 2
@1
D=M
@2
D=D+A
@R13
M=D
@SP
M=M-1
A=M
D=M
@R13
A=M
M=D
// label IF_END0
(Output.Output.createShiftedMap$IF_END0)
// goto WHILE_EXP0
@Output.Output.createShiftedMap$WHILE_EXP0
0;JMP
// label WHILE_END0
(Output.Output.createShiftedMap$WHILE_END0)
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// return
@FW__RETURN
0;JMP
// function Output.getMap 1
(Output.getMap)
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// push argument 0
@2
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// push constant 32
@32
D=A
@SP
A=M
M=D
@SP
M=M+1
// lt
@SP
M=M-1
A=M
D=M
@SP
M=M-1
A=M
D=D-M
@L_Output_230
D;JLE
D=-1
@L_Output_231
D;JMP
(L_Output_230)
D=0
(L_Output_231)
@SP
A=M
M=D
@SP
M=M+1
// push argument 0
@2
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// push constant 126
@126
D=A
@SP
A=M
M=D
@SP
M=M+1
// gt
@SP
M=M-1
A=M
D=M
@SP
M=M-1
A=M
D=D-M
@L_Output_232
D;JGE
D=-1
@L_Output_233
D;JMP
(L_Output_232)
D=0
(L_Output_233)
@SP
A=M
M=D
@SP
M=M+1
// or
@SP
M=M-1
A=M
D=M
@SP
M=M-1
A=M
M=D|M
@SP
M=M+1
// if-goto IF_TRUE0
@SP
M=M-1
A=M
D=M
@Output.Output.getMap$IF_TRUE0
D;JNE
// goto IF_FALSE0
@Output.Output.getMap$IF_FALSE0
0;JMP
// label IF_TRUE0
(Output.Output.getMap$IF_TRUE0)
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// pop argument 0
@2
D=M
@0
D=D+A
@R13
M=D
@SP
M=M-1
A=M
D=M
@R13
A=M
M=D
// label IF_FALSE0
(Output.Output.getMap$IF_FALSE0)
// push static 2
@Output.2
D=M
@SP
A=M
M=D
@SP
M=M+1
// if-goto IF_TRUE1
@SP
M=M-1
A=M
D=M
@Output.Output.getMap$IF_TRUE1
D;JNE
// goto IF_FALSE1
@Output.Output.getMap$IF_FALSE1
0;JMP
// label IF_TRUE1
(Output.Output.getMap$IF_TRUE1)
// push argument 0
@2
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// push static 5
@Output.5
D=M
@SP
A=M
M=D
@SP
M=M+1
// add
@SP
M=M-1
A=M
D=M
@SP
M=M-1
A=M
M=D+M
@SP
M=M+1
// pop pointer 1
@SP
M=M-1
A=M
D=M
@4
M=D
// push that 0
@THAT
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// pop local 0
@1
D=M
@0
D=D+A
@R13
M=D
@SP
M=M-1
A=M
D=M
@R13
A=M
M=D
// goto IF_END1
@Output.Output.getMap$IF_END1
0;JMP
// label IF_FALSE1
(Output.Output.getMap$IF_FALSE1)
// push argument 0
@2
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// push static 6
@Output.6
D=M
@SP
A=M
M=D
@SP
M=M+1
// add
@SP
M=M-1
A=M
D=M
@SP
M=M-1
A=M
M=D+M
@SP
M=M+1
// pop pointer 1
@SP
M=M-1
A=M
D=M
@4
M=D
// push that 0
@THAT
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// pop local 0
@1
D=M
@0
D=D+A
@R13
M=D
@SP
M=M-1
A=M
D=M
@R13
A=M
M=D
// label IF_END1
(Output.Output.getMap$IF_END1)
// push local 0
@1
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// return
@FW__RETURN
0;JMP
// function Output.drawChar 4
(Output.drawChar)
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// push argument 0
@2
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// call Output.getMap 1
@1
D=A
@R13
M=D
@Output.getMap
D=A
@R14
M=D
@L_Output_234
D=A
@FW__CALL
0;JMP
(L_Output_234)
// pop local 2
@1
D=M
@2
D=D+A
@R13
M=D
@SP
M=M-1
A=M
D=M
@R13
A=M
M=D
// push static 1
@Output.1
D=M
@SP
A=M
M=D
@SP
M=M+1
// pop local 0
@1
D=M
@0
D=D+A
@R13
M=D
@SP
M=M-1
A=M
D=M
@R13
A=M
M=D
// label WHILE_EXP0
(Output.Output.drawChar$WHILE_EXP0)
// push local 1
@1
D=M
@1
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// push constant 11
@11
D=A
@SP
A=M
M=D
@SP
M=M+1
// lt
@SP
M=M-1
A=M
D=M
@SP
M=M-1
A=M
D=D-M
@L_Output_235
D;JLE
D=-1
@L_Output_236
D;JMP
(L_Output_235)
D=0
(L_Output_236)
@SP
A=M
M=D
@SP
M=M+1
// not
@SP
M=M-1
A=M
M=!M
@SP
M=M+1
// if-goto WHILE_END0
@SP
M=M-1
A=M
D=M
@Output.Output.drawChar$WHILE_END0
D;JNE
// push static 2
@Output.2
D=M
@SP
A=M
M=D
@SP
M=M+1
// if-goto IF_TRUE0
@SP
M=M-1
A=M
D=M
@Output.Output.drawChar$IF_TRUE0
D;JNE
// goto IF_FALSE0
@Output.Output.drawChar$IF_FALSE0
0;JMP
// label IF_TRUE0
(Output.Output.drawChar$IF_TRUE0)
// push local 0
@1
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// push static 4
@Output.4
D=M
@SP
A=M
M=D
@SP
M=M+1
// add
@SP
M=M-1
A=M
D=M
@SP
M=M-1
A=M
M=D+M
@SP
M=M+1
// pop pointer 1
@SP
M=M-1
A=M
D=M
@4
M=D
// push that 0
@THAT
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// push constant 256
@256
D=A
@SP
A=M
M=D
@SP
M=M+1
// neg
@SP
M=M-1
A=M
M=-M
@SP
M=M+1
// and
@SP
M=M-1
A=M
D=M
@SP
M=M-1
A=M
M=D&M
@SP
M=M+1
// pop local 3
@1
D=M
@3
D=D+A
@R13
M=D
@SP
M=M-1
A=M
D=M
@R13
A=M
M=D
// goto IF_END0
@Output.Output.drawChar$IF_END0
0;JMP
// label IF_FALSE0
(Output.Output.drawChar$IF_FALSE0)
// push local 0
@1
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// push static 4
@Output.4
D=M
@SP
A=M
M=D
@SP
M=M+1
// add
@SP
M=M-1
A=M
D=M
@SP
M=M-1
A=M
M=D+M
@SP
M=M+1
// pop pointer 1
@SP
M=M-1
A=M
D=M
@4
M=D
// push that 0
@THAT
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// push constant 255
@255
D=A
@SP
A=M
M=D
@SP
M=M+1
// and
@SP
M=M-1
A=M
D=M
@SP
M=M-1
A=M
M=D&M
@SP
M=M+1
// pop local 3
@1
D=M
@3
D=D+A
@R13
M=D
@SP
M=M-1
A=M
D=M
@R13
A=M
M=D
// label IF_END0
(Output.Output.drawChar$IF_END0)
// push local 0
@1
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// push static 4
@Output.4
D=M
@SP
A=M
M=D
@SP
M=M+1
// add
@SP
M=M-1
A=M
D=M
@SP
M=M-1
A=M
M=D+M
@SP
M=M+1
// push local 1
@1
D=M
@1
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// push local 2
@1
D=M
@2
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// add
@SP
M=M-1
A=M
D=M
@SP
M=M-1
A=M
M=D+M
@SP
M=M+1
// pop pointer 1
@SP
M=M-1
A=M
D=M
@4
M=D
// push that 0
@THAT
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// push local 3
@1
D=M
@3
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// or
@SP
M=M-1
A=M
D=M
@SP
M=M-1
A=M
M=D|M
@SP
M=M+1
// pop temp 0
@SP
M=M-1
A=M
D=M
@5
M=D
// pop pointer 1
@SP
M=M-1
A=M
D=M
@4
M=D
// push temp 0
@5
D=M
@SP
A=M
M=D
@SP
M=M+1
// pop that 0
@4
D=M
@0
D=D+A
@R13
M=D
@SP
M=M-1
A=M
D=M
@R13
A=M
M=D
// push local 0
@1
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// push constant 32
@32
D=A
@SP
A=M
M=D
@SP
M=M+1
// add
@SP
M=M-1
A=M
D=M
@SP
M=M-1
A=M
M=D+M
@SP
M=M+1
// pop local 0
@1
D=M
@0
D=D+A
@R13
M=D
@SP
M=M-1
A=M
D=M
@R13
A=M
M=D
// push local 1
@1
D=M
@1
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// push constant 1
@1
D=A
@SP
A=M
M=D
@SP
M=M+1
// add
@SP
M=M-1
A=M
D=M
@SP
M=M-1
A=M
M=D+M
@SP
M=M+1
// pop local 1
@1
D=M
@1
D=D+A
@R13
M=D
@SP
M=M-1
A=M
D=M
@R13
A=M
M=D
// goto WHILE_EXP0
@Output.Output.drawChar$WHILE_EXP0
0;JMP
// label WHILE_END0
(Output.Output.drawChar$WHILE_END0)
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// return
@FW__RETURN
0;JMP
// function Output.moveCursor 0
(Output.moveCursor)
// push argument 0
@2
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// lt
@SP
M=M-1
A=M
D=M
@SP
M=M-1
A=M
D=D-M
@L_Output_237
D;JLE
D=-1
@L_Output_238
D;JMP
(L_Output_237)
D=0
(L_Output_238)
@SP
A=M
M=D
@SP
M=M+1
// push argument 0
@2
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// push constant 22
@22
D=A
@SP
A=M
M=D
@SP
M=M+1
// gt
@SP
M=M-1
A=M
D=M
@SP
M=M-1
A=M
D=D-M
@L_Output_239
D;JGE
D=-1
@L_Output_240
D;JMP
(L_Output_239)
D=0
(L_Output_240)
@SP
A=M
M=D
@SP
M=M+1
// or
@SP
M=M-1
A=M
D=M
@SP
M=M-1
A=M
M=D|M
@SP
M=M+1
// push argument 1
@2
D=M
@1
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// lt
@SP
M=M-1
A=M
D=M
@SP
M=M-1
A=M
D=D-M
@L_Output_241
D;JLE
D=-1
@L_Output_242
D;JMP
(L_Output_241)
D=0
(L_Output_242)
@SP
A=M
M=D
@SP
M=M+1
// or
@SP
M=M-1
A=M
D=M
@SP
M=M-1
A=M
M=D|M
@SP
M=M+1
// push argument 1
@2
D=M
@1
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// push constant 63
@63
D=A
@SP
A=M
M=D
@SP
M=M+1
// gt
@SP
M=M-1
A=M
D=M
@SP
M=M-1
A=M
D=D-M
@L_Output_243
D;JGE
D=-1
@L_Output_244
D;JMP
(L_Output_243)
D=0
(L_Output_244)
@SP
A=M
M=D
@SP
M=M+1
// or
@SP
M=M-1
A=M
D=M
@SP
M=M-1
A=M
M=D|M
@SP
M=M+1
// if-goto IF_TRUE0
@SP
M=M-1
A=M
D=M
@Output.Output.moveCursor$IF_TRUE0
D;JNE
// goto IF_FALSE0
@Output.Output.moveCursor$IF_FALSE0
0;JMP
// label IF_TRUE0
(Output.Output.moveCursor$IF_TRUE0)
// push constant 20
@20
D=A
@SP
A=M
M=D
@SP
M=M+1
// call Sys.error 1
@1
D=A
@R13
M=D
@Sys.error
D=A
@R14
M=D
@L_Output_245
D=A
@FW__CALL
0;JMP
(L_Output_245)
// pop temp 0
@SP
M=M-1
A=M
D=M
@5
M=D
// label IF_FALSE0
(Output.Output.moveCursor$IF_FALSE0)
// push argument 1
@2
D=M
@1
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// push constant 2
@2
D=A
@SP
A=M
M=D
@SP
M=M+1
// call Math.divide 2
@2
D=A
@R13
M=D
@Math.divide
D=A
@R14
M=D
@L_Output_246
D=A
@FW__CALL
0;JMP
(L_Output_246)
// pop static 0
@SP
M=M-1
A=M
D=M
@Output.0
M=D
// push constant 32
@32
D=A
@SP
A=M
M=D
@SP
M=M+1
// push argument 0
@2
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// push constant 352
@352
D=A
@SP
A=M
M=D
@SP
M=M+1
// call Math.multiply 2
@2
D=A
@R13
M=D
@Math.multiply
D=A
@R14
M=D
@L_Output_247
D=A
@FW__CALL
0;JMP
(L_Output_247)
// add
@SP
M=M-1
A=M
D=M
@SP
M=M-1
A=M
M=D+M
@SP
M=M+1
// push static 0
@Output.0
D=M
@SP
A=M
M=D
@SP
M=M+1
// add
@SP
M=M-1
A=M
D=M
@SP
M=M-1
A=M
M=D+M
@SP
M=M+1
// pop static 1
@SP
M=M-1
A=M
D=M
@Output.1
M=D
// push argument 1
@2
D=M
@1
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// push static 0
@Output.0
D=M
@SP
A=M
M=D
@SP
M=M+1
// push constant 2
@2
D=A
@SP
A=M
M=D
@SP
M=M+1
// call Math.multiply 2
@2
D=A
@R13
M=D
@Math.multiply
D=A
@R14
M=D
@L_Output_248
D=A
@FW__CALL
0;JMP
(L_Output_248)
// eq
@SP
M=M-1
A=M
D=M
@SP
M=M-1
A=M
D=D-M
@L_Output_249
D;JNE
D=-1
@L_Output_250
D;JMP
(L_Output_249)
D=0
(L_Output_250)
@SP
A=M
M=D
@SP
M=M+1
// pop static 2
@SP
M=M-1
A=M
D=M
@Output.2
M=D
// push constant 32
@32
D=A
@SP
A=M
M=D
@SP
M=M+1
// call Output.drawChar 1
@1
D=A
@R13
M=D
@Output.drawChar
D=A
@R14
M=D
@L_Output_251
D=A
@FW__CALL
0;JMP
(L_Output_251)
// pop temp 0
@SP
M=M-1
A=M
D=M
@5
M=D
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// return
@FW__RETURN
0;JMP
// function Output.printChar 0
(Output.printChar)
// push argument 0
@2
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// call String.newLine 0
@0
D=A
@R13
M=D
@String.newLine
D=A
@R14
M=D
@L_Output_252
D=A
@FW__CALL
0;JMP
(L_Output_252)
// eq
@SP
M=M-1
A=M
D=M
@SP
M=M-1
A=M
D=D-M
@L_Output_253
D;JNE
D=-1
@L_Output_254
D;JMP
(L_Output_253)
D=0
(L_Output_254)
@SP
A=M
M=D
@SP
M=M+1
// if-goto IF_TRUE0
@SP
M=M-1
A=M
D=M
@Output.Output.printChar$IF_TRUE0
D;JNE
// goto IF_FALSE0
@Output.Output.printChar$IF_FALSE0
0;JMP
// label IF_TRUE0
(Output.Output.printChar$IF_TRUE0)
// call Output.println 0
@0
D=A
@R13
M=D
@Output.println
D=A
@R14
M=D
@L_Output_255
D=A
@FW__CALL
0;JMP
(L_Output_255)
// pop temp 0
@SP
M=M-1
A=M
D=M
@5
M=D
// goto IF_END0
@Output.Output.printChar$IF_END0
0;JMP
// label IF_FALSE0
(Output.Output.printChar$IF_FALSE0)
// push argument 0
@2
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// call String.backSpace 0
@0
D=A
@R13
M=D
@String.backSpace
D=A
@R14
M=D
@L_Output_256
D=A
@FW__CALL
0;JMP
(L_Output_256)
// eq
@SP
M=M-1
A=M
D=M
@SP
M=M-1
A=M
D=D-M
@L_Output_257
D;JNE
D=-1
@L_Output_258
D;JMP
(L_Output_257)
D=0
(L_Output_258)
@SP
A=M
M=D
@SP
M=M+1
// if-goto IF_TRUE1
@SP
M=M-1
A=M
D=M
@Output.Output.printChar$IF_TRUE1
D;JNE
// goto IF_FALSE1
@Output.Output.printChar$IF_FALSE1
0;JMP
// label IF_TRUE1
(Output.Output.printChar$IF_TRUE1)
// call Output.backSpace 0
@0
D=A
@R13
M=D
@Output.backSpace
D=A
@R14
M=D
@L_Output_259
D=A
@FW__CALL
0;JMP
(L_Output_259)
// pop temp 0
@SP
M=M-1
A=M
D=M
@5
M=D
// goto IF_END1
@Output.Output.printChar$IF_END1
0;JMP
// label IF_FALSE1
(Output.Output.printChar$IF_FALSE1)
// push argument 0
@2
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// call Output.drawChar 1
@1
D=A
@R13
M=D
@Output.drawChar
D=A
@R14
M=D
@L_Output_260
D=A
@FW__CALL
0;JMP
(L_Output_260)
// pop temp 0
@SP
M=M-1
A=M
D=M
@5
M=D
// push static 2
@Output.2
D=M
@SP
A=M
M=D
@SP
M=M+1
// not
@SP
M=M-1
A=M
M=!M
@SP
M=M+1
// if-goto IF_TRUE2
@SP
M=M-1
A=M
D=M
@Output.Output.printChar$IF_TRUE2
D;JNE
// goto IF_FALSE2
@Output.Output.printChar$IF_FALSE2
0;JMP
// label IF_TRUE2
(Output.Output.printChar$IF_TRUE2)
// push static 0
@Output.0
D=M
@SP
A=M
M=D
@SP
M=M+1
// push constant 1
@1
D=A
@SP
A=M
M=D
@SP
M=M+1
// add
@SP
M=M-1
A=M
D=M
@SP
M=M-1
A=M
M=D+M
@SP
M=M+1
// pop static 0
@SP
M=M-1
A=M
D=M
@Output.0
M=D
// push static 1
@Output.1
D=M
@SP
A=M
M=D
@SP
M=M+1
// push constant 1
@1
D=A
@SP
A=M
M=D
@SP
M=M+1
// add
@SP
M=M-1
A=M
D=M
@SP
M=M-1
A=M
M=D+M
@SP
M=M+1
// pop static 1
@SP
M=M-1
A=M
D=M
@Output.1
M=D
// label IF_FALSE2
(Output.Output.printChar$IF_FALSE2)
// push static 0
@Output.0
D=M
@SP
A=M
M=D
@SP
M=M+1
// push constant 32
@32
D=A
@SP
A=M
M=D
@SP
M=M+1
// eq
@SP
M=M-1
A=M
D=M
@SP
M=M-1
A=M
D=D-M
@L_Output_261
D;JNE
D=-1
@L_Output_262
D;JMP
(L_Output_261)
D=0
(L_Output_262)
@SP
A=M
M=D
@SP
M=M+1
// if-goto IF_TRUE3
@SP
M=M-1
A=M
D=M
@Output.Output.printChar$IF_TRUE3
D;JNE
// goto IF_FALSE3
@Output.Output.printChar$IF_FALSE3
0;JMP
// label IF_TRUE3
(Output.Output.printChar$IF_TRUE3)
// call Output.println 0
@0
D=A
@R13
M=D
@Output.println
D=A
@R14
M=D
@L_Output_263
D=A
@FW__CALL
0;JMP
(L_Output_263)
// pop temp 0
@SP
M=M-1
A=M
D=M
@5
M=D
// goto IF_END3
@Output.Output.printChar$IF_END3
0;JMP
// label IF_FALSE3
(Output.Output.printChar$IF_FALSE3)
// push static 2
@Output.2
D=M
@SP
A=M
M=D
@SP
M=M+1
// not
@SP
M=M-1
A=M
M=!M
@SP
M=M+1
// pop static 2
@SP
M=M-1
A=M
D=M
@Output.2
M=D
// label IF_END3
(Output.Output.printChar$IF_END3)
// label IF_END1
(Output.Output.printChar$IF_END1)
// label IF_END0
(Output.Output.printChar$IF_END0)
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// return
@FW__RETURN
0;JMP
// function Output.printString 2
(Output.printString)
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// push argument 0
@2
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// call String.length 1
@1
D=A
@R13
M=D
@String.length
D=A
@R14
M=D
@L_Output_264
D=A
@FW__CALL
0;JMP
(L_Output_264)
// pop local 1
@1
D=M
@1
D=D+A
@R13
M=D
@SP
M=M-1
A=M
D=M
@R13
A=M
M=D
// label WHILE_EXP0
(Output.Output.printString$WHILE_EXP0)
// push local 0
@1
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// push local 1
@1
D=M
@1
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// lt
@SP
M=M-1
A=M
D=M
@SP
M=M-1
A=M
D=D-M
@L_Output_265
D;JLE
D=-1
@L_Output_266
D;JMP
(L_Output_265)
D=0
(L_Output_266)
@SP
A=M
M=D
@SP
M=M+1
// not
@SP
M=M-1
A=M
M=!M
@SP
M=M+1
// if-goto WHILE_END0
@SP
M=M-1
A=M
D=M
@Output.Output.printString$WHILE_END0
D;JNE
// push argument 0
@2
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// push local 0
@1
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// call String.charAt 2
@2
D=A
@R13
M=D
@String.charAt
D=A
@R14
M=D
@L_Output_267
D=A
@FW__CALL
0;JMP
(L_Output_267)
// call Output.printChar 1
@1
D=A
@R13
M=D
@Output.printChar
D=A
@R14
M=D
@L_Output_268
D=A
@FW__CALL
0;JMP
(L_Output_268)
// pop temp 0
@SP
M=M-1
A=M
D=M
@5
M=D
// push local 0
@1
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// push constant 1
@1
D=A
@SP
A=M
M=D
@SP
M=M+1
// add
@SP
M=M-1
A=M
D=M
@SP
M=M-1
A=M
M=D+M
@SP
M=M+1
// pop local 0
@1
D=M
@0
D=D+A
@R13
M=D
@SP
M=M-1
A=M
D=M
@R13
A=M
M=D
// goto WHILE_EXP0
@Output.Output.printString$WHILE_EXP0
0;JMP
// label WHILE_END0
(Output.Output.printString$WHILE_END0)
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// return
@FW__RETURN
0;JMP
// function Output.printInt 0
(Output.printInt)
// push static 3
@Output.3
D=M
@SP
A=M
M=D
@SP
M=M+1
// push argument 0
@2
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// call String.setInt 2
@2
D=A
@R13
M=D
@String.setInt
D=A
@R14
M=D
@L_Output_269
D=A
@FW__CALL
0;JMP
(L_Output_269)
// pop temp 0
@SP
M=M-1
A=M
D=M
@5
M=D
// push static 3
@Output.3
D=M
@SP
A=M
M=D
@SP
M=M+1
// call Output.printString 1
@1
D=A
@R13
M=D
@Output.printString
D=A
@R14
M=D
@L_Output_270
D=A
@FW__CALL
0;JMP
(L_Output_270)
// pop temp 0
@SP
M=M-1
A=M
D=M
@5
M=D
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// return
@FW__RETURN
0;JMP
// function Output.println 0
(Output.println)
// push static 1
@Output.1
D=M
@SP
A=M
M=D
@SP
M=M+1
// push constant 352
@352
D=A
@SP
A=M
M=D
@SP
M=M+1
// add
@SP
M=M-1
A=M
D=M
@SP
M=M-1
A=M
M=D+M
@SP
M=M+1
// push static 0
@Output.0
D=M
@SP
A=M
M=D
@SP
M=M+1
// sub
@SP
M=M-1
A=M
D=M
@SP
M=M-1
A=M
M=D-M
M=-M
@SP
M=M+1
// pop static 1
@SP
M=M-1
A=M
D=M
@Output.1
M=D
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// pop static 0
@SP
M=M-1
A=M
D=M
@Output.0
M=D
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// not
@SP
M=M-1
A=M
M=!M
@SP
M=M+1
// pop static 2
@SP
M=M-1
A=M
D=M
@Output.2
M=D
// push static 1
@Output.1
D=M
@SP
A=M
M=D
@SP
M=M+1
// push constant 8128
@8128
D=A
@SP
A=M
M=D
@SP
M=M+1
// eq
@SP
M=M-1
A=M
D=M
@SP
M=M-1
A=M
D=D-M
@L_Output_271
D;JNE
D=-1
@L_Output_272
D;JMP
(L_Output_271)
D=0
(L_Output_272)
@SP
A=M
M=D
@SP
M=M+1
// if-goto IF_TRUE0
@SP
M=M-1
A=M
D=M
@Output.Output.println$IF_TRUE0
D;JNE
// goto IF_FALSE0
@Output.Output.println$IF_FALSE0
0;JMP
// label IF_TRUE0
(Output.Output.println$IF_TRUE0)
// push constant 32
@32
D=A
@SP
A=M
M=D
@SP
M=M+1
// pop static 1
@SP
M=M-1
A=M
D=M
@Output.1
M=D
// label IF_FALSE0
(Output.Output.println$IF_FALSE0)
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// return
@FW__RETURN
0;JMP
// function Output.backSpace 0
(Output.backSpace)
// push static 2
@Output.2
D=M
@SP
A=M
M=D
@SP
M=M+1
// if-goto IF_TRUE0
@SP
M=M-1
A=M
D=M
@Output.Output.backSpace$IF_TRUE0
D;JNE
// goto IF_FALSE0
@Output.Output.backSpace$IF_FALSE0
0;JMP
// label IF_TRUE0
(Output.Output.backSpace$IF_TRUE0)
// push static 0
@Output.0
D=M
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// gt
@SP
M=M-1
A=M
D=M
@SP
M=M-1
A=M
D=D-M
@L_Output_273
D;JGE
D=-1
@L_Output_274
D;JMP
(L_Output_273)
D=0
(L_Output_274)
@SP
A=M
M=D
@SP
M=M+1
// if-goto IF_TRUE1
@SP
M=M-1
A=M
D=M
@Output.Output.backSpace$IF_TRUE1
D;JNE
// goto IF_FALSE1
@Output.Output.backSpace$IF_FALSE1
0;JMP
// label IF_TRUE1
(Output.Output.backSpace$IF_TRUE1)
// push static 0
@Output.0
D=M
@SP
A=M
M=D
@SP
M=M+1
// push constant 1
@1
D=A
@SP
A=M
M=D
@SP
M=M+1
// sub
@SP
M=M-1
A=M
D=M
@SP
M=M-1
A=M
M=D-M
M=-M
@SP
M=M+1
// pop static 0
@SP
M=M-1
A=M
D=M
@Output.0
M=D
// push static 1
@Output.1
D=M
@SP
A=M
M=D
@SP
M=M+1
// push constant 1
@1
D=A
@SP
A=M
M=D
@SP
M=M+1
// sub
@SP
M=M-1
A=M
D=M
@SP
M=M-1
A=M
M=D-M
M=-M
@SP
M=M+1
// pop static 1
@SP
M=M-1
A=M
D=M
@Output.1
M=D
// goto IF_END1
@Output.Output.backSpace$IF_END1
0;JMP
// label IF_FALSE1
(Output.Output.backSpace$IF_FALSE1)
// push constant 31
@31
D=A
@SP
A=M
M=D
@SP
M=M+1
// pop static 0
@SP
M=M-1
A=M
D=M
@Output.0
M=D
// push static 1
@Output.1
D=M
@SP
A=M
M=D
@SP
M=M+1
// push constant 32
@32
D=A
@SP
A=M
M=D
@SP
M=M+1
// eq
@SP
M=M-1
A=M
D=M
@SP
M=M-1
A=M
D=D-M
@L_Output_275
D;JNE
D=-1
@L_Output_276
D;JMP
(L_Output_275)
D=0
(L_Output_276)
@SP
A=M
M=D
@SP
M=M+1
// if-goto IF_TRUE2
@SP
M=M-1
A=M
D=M
@Output.Output.backSpace$IF_TRUE2
D;JNE
// goto IF_FALSE2
@Output.Output.backSpace$IF_FALSE2
0;JMP
// label IF_TRUE2
(Output.Output.backSpace$IF_TRUE2)
// push constant 8128
@8128
D=A
@SP
A=M
M=D
@SP
M=M+1
// pop static 1
@SP
M=M-1
A=M
D=M
@Output.1
M=D
// label IF_FALSE2
(Output.Output.backSpace$IF_FALSE2)
// push static 1
@Output.1
D=M
@SP
A=M
M=D
@SP
M=M+1
// push constant 321
@321
D=A
@SP
A=M
M=D
@SP
M=M+1
// sub
@SP
M=M-1
A=M
D=M
@SP
M=M-1
A=M
M=D-M
M=-M
@SP
M=M+1
// pop static 1
@SP
M=M-1
A=M
D=M
@Output.1
M=D
// label IF_END1
(Output.Output.backSpace$IF_END1)
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// pop static 2
@SP
M=M-1
A=M
D=M
@Output.2
M=D
// goto IF_END0
@Output.Output.backSpace$IF_END0
0;JMP
// label IF_FALSE0
(Output.Output.backSpace$IF_FALSE0)
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// not
@SP
M=M-1
A=M
M=!M
@SP
M=M+1
// pop static 2
@SP
M=M-1
A=M
D=M
@Output.2
M=D
// label IF_END0
(Output.Output.backSpace$IF_END0)
// push constant 32
@32
D=A
@SP
A=M
M=D
@SP
M=M+1
// call Output.drawChar 1
@1
D=A
@R13
M=D
@Output.drawChar
D=A
@R14
M=D
@L_Output_277
D=A
@FW__CALL
0;JMP
(L_Output_277)
// pop temp 0
@SP
M=M-1
A=M
D=M
@5
M=D
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// return
@FW__RETURN
0;JMP
// 
// function Screen.init 1
(Screen.init)
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 16384
@16384
D=A
@SP
A=M
M=D
@SP
M=M+1
// pop static 1
@SP
M=M-1
A=M
D=M
@Screen.1
M=D
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// not
@SP
M=M-1
A=M
M=!M
@SP
M=M+1
// pop static 2
@SP
M=M-1
A=M
D=M
@Screen.2
M=D
// push constant 17
@17
D=A
@SP
A=M
M=D
@SP
M=M+1
// call Array.new 1
@1
D=A
@R13
M=D
@Array.new
D=A
@R14
M=D
@L_Screen_278
D=A
@FW__CALL
0;JMP
(L_Screen_278)
// pop static 0
@SP
M=M-1
A=M
D=M
@Screen.0
M=D
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// push static 0
@Screen.0
D=M
@SP
A=M
M=D
@SP
M=M+1
// add
@SP
M=M-1
A=M
D=M
@SP
M=M-1
A=M
M=D+M
@SP
M=M+1
// push constant 1
@1
D=A
@SP
A=M
M=D
@SP
M=M+1
// pop temp 0
@SP
M=M-1
A=M
D=M
@5
M=D
// pop pointer 1
@SP
M=M-1
A=M
D=M
@4
M=D
// push temp 0
@5
D=M
@SP
A=M
M=D
@SP
M=M+1
// pop that 0
@4
D=M
@0
D=D+A
@R13
M=D
@SP
M=M-1
A=M
D=M
@R13
A=M
M=D
// label WHILE_EXP0
(Screen.Screen.init$WHILE_EXP0)
// push local 0
@1
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// push constant 16
@16
D=A
@SP
A=M
M=D
@SP
M=M+1
// lt
@SP
M=M-1
A=M
D=M
@SP
M=M-1
A=M
D=D-M
@L_Screen_279
D;JLE
D=-1
@L_Screen_280
D;JMP
(L_Screen_279)
D=0
(L_Screen_280)
@SP
A=M
M=D
@SP
M=M+1
// not
@SP
M=M-1
A=M
M=!M
@SP
M=M+1
// if-goto WHILE_END0
@SP
M=M-1
A=M
D=M
@Screen.Screen.init$WHILE_END0
D;JNE
// push local 0
@1
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// push constant 1
@1
D=A
@SP
A=M
M=D
@SP
M=M+1
// add
@SP
M=M-1
A=M
D=M
@SP
M=M-1
A=M
M=D+M
@SP
M=M+1
// pop local 0
@1
D=M
@0
D=D+A
@R13
M=D
@SP
M=M-1
A=M
D=M
@R13
A=M
M=D
// push local 0
@1
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// push static 0
@Screen.0
D=M
@SP
A=M
M=D
@SP
M=M+1
// add
@SP
M=M-1
A=M
D=M
@SP
M=M-1
A=M
M=D+M
@SP
M=M+1
// push local 0
@1
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// push constant 1
@1
D=A
@SP
A=M
M=D
@SP
M=M+1
// sub
@SP
M=M-1
A=M
D=M
@SP
M=M-1
A=M
M=D-M
M=-M
@SP
M=M+1
// push static 0
@Screen.0
D=M
@SP
A=M
M=D
@SP
M=M+1
// add
@SP
M=M-1
A=M
D=M
@SP
M=M-1
A=M
M=D+M
@SP
M=M+1
// pop pointer 1
@SP
M=M-1
A=M
D=M
@4
M=D
// push that 0
@THAT
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// push local 0
@1
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// push constant 1
@1
D=A
@SP
A=M
M=D
@SP
M=M+1
// sub
@SP
M=M-1
A=M
D=M
@SP
M=M-1
A=M
M=D-M
M=-M
@SP
M=M+1
// push static 0
@Screen.0
D=M
@SP
A=M
M=D
@SP
M=M+1
// add
@SP
M=M-1
A=M
D=M
@SP
M=M-1
A=M
M=D+M
@SP
M=M+1
// pop pointer 1
@SP
M=M-1
A=M
D=M
@4
M=D
// push that 0
@THAT
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// add
@SP
M=M-1
A=M
D=M
@SP
M=M-1
A=M
M=D+M
@SP
M=M+1
// pop temp 0
@SP
M=M-1
A=M
D=M
@5
M=D
// pop pointer 1
@SP
M=M-1
A=M
D=M
@4
M=D
// push temp 0
@5
D=M
@SP
A=M
M=D
@SP
M=M+1
// pop that 0
@4
D=M
@0
D=D+A
@R13
M=D
@SP
M=M-1
A=M
D=M
@R13
A=M
M=D
// goto WHILE_EXP0
@Screen.Screen.init$WHILE_EXP0
0;JMP
// label WHILE_END0
(Screen.Screen.init$WHILE_END0)
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// return
@FW__RETURN
0;JMP
// function Screen.clearScreen 1
(Screen.clearScreen)
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// label WHILE_EXP0
(Screen.Screen.clearScreen$WHILE_EXP0)
// push local 0
@1
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// push constant 8192
@8192
D=A
@SP
A=M
M=D
@SP
M=M+1
// lt
@SP
M=M-1
A=M
D=M
@SP
M=M-1
A=M
D=D-M
@L_Screen_281
D;JLE
D=-1
@L_Screen_282
D;JMP
(L_Screen_281)
D=0
(L_Screen_282)
@SP
A=M
M=D
@SP
M=M+1
// not
@SP
M=M-1
A=M
M=!M
@SP
M=M+1
// if-goto WHILE_END0
@SP
M=M-1
A=M
D=M
@Screen.Screen.clearScreen$WHILE_END0
D;JNE
// push local 0
@1
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// push static 1
@Screen.1
D=M
@SP
A=M
M=D
@SP
M=M+1
// add
@SP
M=M-1
A=M
D=M
@SP
M=M-1
A=M
M=D+M
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// pop temp 0
@SP
M=M-1
A=M
D=M
@5
M=D
// pop pointer 1
@SP
M=M-1
A=M
D=M
@4
M=D
// push temp 0
@5
D=M
@SP
A=M
M=D
@SP
M=M+1
// pop that 0
@4
D=M
@0
D=D+A
@R13
M=D
@SP
M=M-1
A=M
D=M
@R13
A=M
M=D
// push local 0
@1
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// push constant 1
@1
D=A
@SP
A=M
M=D
@SP
M=M+1
// add
@SP
M=M-1
A=M
D=M
@SP
M=M-1
A=M
M=D+M
@SP
M=M+1
// pop local 0
@1
D=M
@0
D=D+A
@R13
M=D
@SP
M=M-1
A=M
D=M
@R13
A=M
M=D
// goto WHILE_EXP0
@Screen.Screen.clearScreen$WHILE_EXP0
0;JMP
// label WHILE_END0
(Screen.Screen.clearScreen$WHILE_END0)
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// return
@FW__RETURN
0;JMP
// function Screen.updateLocation 0
(Screen.updateLocation)
// push static 2
@Screen.2
D=M
@SP
A=M
M=D
@SP
M=M+1
// if-goto IF_TRUE0
@SP
M=M-1
A=M
D=M
@Screen.Screen.updateLocation$IF_TRUE0
D;JNE
// goto IF_FALSE0
@Screen.Screen.updateLocation$IF_FALSE0
0;JMP
// label IF_TRUE0
(Screen.Screen.updateLocation$IF_TRUE0)
// push argument 0
@2
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// push static 1
@Screen.1
D=M
@SP
A=M
M=D
@SP
M=M+1
// add
@SP
M=M-1
A=M
D=M
@SP
M=M-1
A=M
M=D+M
@SP
M=M+1
// push argument 0
@2
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// push static 1
@Screen.1
D=M
@SP
A=M
M=D
@SP
M=M+1
// add
@SP
M=M-1
A=M
D=M
@SP
M=M-1
A=M
M=D+M
@SP
M=M+1
// pop pointer 1
@SP
M=M-1
A=M
D=M
@4
M=D
// push that 0
@THAT
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// push argument 1
@2
D=M
@1
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// or
@SP
M=M-1
A=M
D=M
@SP
M=M-1
A=M
M=D|M
@SP
M=M+1
// pop temp 0
@SP
M=M-1
A=M
D=M
@5
M=D
// pop pointer 1
@SP
M=M-1
A=M
D=M
@4
M=D
// push temp 0
@5
D=M
@SP
A=M
M=D
@SP
M=M+1
// pop that 0
@4
D=M
@0
D=D+A
@R13
M=D
@SP
M=M-1
A=M
D=M
@R13
A=M
M=D
// goto IF_END0
@Screen.Screen.updateLocation$IF_END0
0;JMP
// label IF_FALSE0
(Screen.Screen.updateLocation$IF_FALSE0)
// push argument 0
@2
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// push static 1
@Screen.1
D=M
@SP
A=M
M=D
@SP
M=M+1
// add
@SP
M=M-1
A=M
D=M
@SP
M=M-1
A=M
M=D+M
@SP
M=M+1
// push argument 0
@2
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// push static 1
@Screen.1
D=M
@SP
A=M
M=D
@SP
M=M+1
// add
@SP
M=M-1
A=M
D=M
@SP
M=M-1
A=M
M=D+M
@SP
M=M+1
// pop pointer 1
@SP
M=M-1
A=M
D=M
@4
M=D
// push that 0
@THAT
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// push argument 1
@2
D=M
@1
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// not
@SP
M=M-1
A=M
M=!M
@SP
M=M+1
// and
@SP
M=M-1
A=M
D=M
@SP
M=M-1
A=M
M=D&M
@SP
M=M+1
// pop temp 0
@SP
M=M-1
A=M
D=M
@5
M=D
// pop pointer 1
@SP
M=M-1
A=M
D=M
@4
M=D
// push temp 0
@5
D=M
@SP
A=M
M=D
@SP
M=M+1
// pop that 0
@4
D=M
@0
D=D+A
@R13
M=D
@SP
M=M-1
A=M
D=M
@R13
A=M
M=D
// label IF_END0
(Screen.Screen.updateLocation$IF_END0)
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// return
@FW__RETURN
0;JMP
// function Screen.setColor 0
(Screen.setColor)
// push argument 0
@2
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// pop static 2
@SP
M=M-1
A=M
D=M
@Screen.2
M=D
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// return
@FW__RETURN
0;JMP
// function Screen.drawPixel 3
(Screen.drawPixel)
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// push argument 0
@2
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// lt
@SP
M=M-1
A=M
D=M
@SP
M=M-1
A=M
D=D-M
@L_Screen_283
D;JLE
D=-1
@L_Screen_284
D;JMP
(L_Screen_283)
D=0
(L_Screen_284)
@SP
A=M
M=D
@SP
M=M+1
// push argument 0
@2
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// push constant 511
@511
D=A
@SP
A=M
M=D
@SP
M=M+1
// gt
@SP
M=M-1
A=M
D=M
@SP
M=M-1
A=M
D=D-M
@L_Screen_285
D;JGE
D=-1
@L_Screen_286
D;JMP
(L_Screen_285)
D=0
(L_Screen_286)
@SP
A=M
M=D
@SP
M=M+1
// or
@SP
M=M-1
A=M
D=M
@SP
M=M-1
A=M
M=D|M
@SP
M=M+1
// push argument 1
@2
D=M
@1
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// lt
@SP
M=M-1
A=M
D=M
@SP
M=M-1
A=M
D=D-M
@L_Screen_287
D;JLE
D=-1
@L_Screen_288
D;JMP
(L_Screen_287)
D=0
(L_Screen_288)
@SP
A=M
M=D
@SP
M=M+1
// or
@SP
M=M-1
A=M
D=M
@SP
M=M-1
A=M
M=D|M
@SP
M=M+1
// push argument 1
@2
D=M
@1
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// push constant 255
@255
D=A
@SP
A=M
M=D
@SP
M=M+1
// gt
@SP
M=M-1
A=M
D=M
@SP
M=M-1
A=M
D=D-M
@L_Screen_289
D;JGE
D=-1
@L_Screen_290
D;JMP
(L_Screen_289)
D=0
(L_Screen_290)
@SP
A=M
M=D
@SP
M=M+1
// or
@SP
M=M-1
A=M
D=M
@SP
M=M-1
A=M
M=D|M
@SP
M=M+1
// if-goto IF_TRUE0
@SP
M=M-1
A=M
D=M
@Screen.Screen.drawPixel$IF_TRUE0
D;JNE
// goto IF_FALSE0
@Screen.Screen.drawPixel$IF_FALSE0
0;JMP
// label IF_TRUE0
(Screen.Screen.drawPixel$IF_TRUE0)
// push constant 7
@7
D=A
@SP
A=M
M=D
@SP
M=M+1
// call Sys.error 1
@1
D=A
@R13
M=D
@Sys.error
D=A
@R14
M=D
@L_Screen_291
D=A
@FW__CALL
0;JMP
(L_Screen_291)
// pop temp 0
@SP
M=M-1
A=M
D=M
@5
M=D
// label IF_FALSE0
(Screen.Screen.drawPixel$IF_FALSE0)
// push argument 0
@2
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// push constant 16
@16
D=A
@SP
A=M
M=D
@SP
M=M+1
// call Math.divide 2
@2
D=A
@R13
M=D
@Math.divide
D=A
@R14
M=D
@L_Screen_292
D=A
@FW__CALL
0;JMP
(L_Screen_292)
// pop local 0
@1
D=M
@0
D=D+A
@R13
M=D
@SP
M=M-1
A=M
D=M
@R13
A=M
M=D
// push argument 0
@2
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// push local 0
@1
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// push constant 16
@16
D=A
@SP
A=M
M=D
@SP
M=M+1
// call Math.multiply 2
@2
D=A
@R13
M=D
@Math.multiply
D=A
@R14
M=D
@L_Screen_293
D=A
@FW__CALL
0;JMP
(L_Screen_293)
// sub
@SP
M=M-1
A=M
D=M
@SP
M=M-1
A=M
M=D-M
M=-M
@SP
M=M+1
// pop local 1
@1
D=M
@1
D=D+A
@R13
M=D
@SP
M=M-1
A=M
D=M
@R13
A=M
M=D
// push argument 1
@2
D=M
@1
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// push constant 32
@32
D=A
@SP
A=M
M=D
@SP
M=M+1
// call Math.multiply 2
@2
D=A
@R13
M=D
@Math.multiply
D=A
@R14
M=D
@L_Screen_294
D=A
@FW__CALL
0;JMP
(L_Screen_294)
// push local 0
@1
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// add
@SP
M=M-1
A=M
D=M
@SP
M=M-1
A=M
M=D+M
@SP
M=M+1
// pop local 2
@1
D=M
@2
D=D+A
@R13
M=D
@SP
M=M-1
A=M
D=M
@R13
A=M
M=D
// push local 2
@1
D=M
@2
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// push local 1
@1
D=M
@1
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// push static 0
@Screen.0
D=M
@SP
A=M
M=D
@SP
M=M+1
// add
@SP
M=M-1
A=M
D=M
@SP
M=M-1
A=M
M=D+M
@SP
M=M+1
// pop pointer 1
@SP
M=M-1
A=M
D=M
@4
M=D
// push that 0
@THAT
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// call Screen.updateLocation 2
@2
D=A
@R13
M=D
@Screen.updateLocation
D=A
@R14
M=D
@L_Screen_295
D=A
@FW__CALL
0;JMP
(L_Screen_295)
// pop temp 0
@SP
M=M-1
A=M
D=M
@5
M=D
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// return
@FW__RETURN
0;JMP
// function Screen.drawConditional 0
(Screen.drawConditional)
// push argument 2
@2
D=M
@2
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// if-goto IF_TRUE0
@SP
M=M-1
A=M
D=M
@Screen.Screen.drawConditional$IF_TRUE0
D;JNE
// goto IF_FALSE0
@Screen.Screen.drawConditional$IF_FALSE0
0;JMP
// label IF_TRUE0
(Screen.Screen.drawConditional$IF_TRUE0)
// push argument 1
@2
D=M
@1
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// push argument 0
@2
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// call Screen.drawPixel 2
@2
D=A
@R13
M=D
@Screen.drawPixel
D=A
@R14
M=D
@L_Screen_296
D=A
@FW__CALL
0;JMP
(L_Screen_296)
// pop temp 0
@SP
M=M-1
A=M
D=M
@5
M=D
// goto IF_END0
@Screen.Screen.drawConditional$IF_END0
0;JMP
// label IF_FALSE0
(Screen.Screen.drawConditional$IF_FALSE0)
// push argument 0
@2
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// push argument 1
@2
D=M
@1
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// call Screen.drawPixel 2
@2
D=A
@R13
M=D
@Screen.drawPixel
D=A
@R14
M=D
@L_Screen_297
D=A
@FW__CALL
0;JMP
(L_Screen_297)
// pop temp 0
@SP
M=M-1
A=M
D=M
@5
M=D
// label IF_END0
(Screen.Screen.drawConditional$IF_END0)
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// return
@FW__RETURN
0;JMP
// function Screen.drawLine 11
(Screen.drawLine)
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// push argument 0
@2
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// lt
@SP
M=M-1
A=M
D=M
@SP
M=M-1
A=M
D=D-M
@L_Screen_298
D;JLE
D=-1
@L_Screen_299
D;JMP
(L_Screen_298)
D=0
(L_Screen_299)
@SP
A=M
M=D
@SP
M=M+1
// push argument 2
@2
D=M
@2
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// push constant 511
@511
D=A
@SP
A=M
M=D
@SP
M=M+1
// gt
@SP
M=M-1
A=M
D=M
@SP
M=M-1
A=M
D=D-M
@L_Screen_300
D;JGE
D=-1
@L_Screen_301
D;JMP
(L_Screen_300)
D=0
(L_Screen_301)
@SP
A=M
M=D
@SP
M=M+1
// or
@SP
M=M-1
A=M
D=M
@SP
M=M-1
A=M
M=D|M
@SP
M=M+1
// push argument 1
@2
D=M
@1
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// lt
@SP
M=M-1
A=M
D=M
@SP
M=M-1
A=M
D=D-M
@L_Screen_302
D;JLE
D=-1
@L_Screen_303
D;JMP
(L_Screen_302)
D=0
(L_Screen_303)
@SP
A=M
M=D
@SP
M=M+1
// or
@SP
M=M-1
A=M
D=M
@SP
M=M-1
A=M
M=D|M
@SP
M=M+1
// push argument 3
@2
D=M
@3
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// push constant 255
@255
D=A
@SP
A=M
M=D
@SP
M=M+1
// gt
@SP
M=M-1
A=M
D=M
@SP
M=M-1
A=M
D=D-M
@L_Screen_304
D;JGE
D=-1
@L_Screen_305
D;JMP
(L_Screen_304)
D=0
(L_Screen_305)
@SP
A=M
M=D
@SP
M=M+1
// or
@SP
M=M-1
A=M
D=M
@SP
M=M-1
A=M
M=D|M
@SP
M=M+1
// if-goto IF_TRUE0
@SP
M=M-1
A=M
D=M
@Screen.Screen.drawLine$IF_TRUE0
D;JNE
// goto IF_FALSE0
@Screen.Screen.drawLine$IF_FALSE0
0;JMP
// label IF_TRUE0
(Screen.Screen.drawLine$IF_TRUE0)
// push constant 8
@8
D=A
@SP
A=M
M=D
@SP
M=M+1
// call Sys.error 1
@1
D=A
@R13
M=D
@Sys.error
D=A
@R14
M=D
@L_Screen_306
D=A
@FW__CALL
0;JMP
(L_Screen_306)
// pop temp 0
@SP
M=M-1
A=M
D=M
@5
M=D
// label IF_FALSE0
(Screen.Screen.drawLine$IF_FALSE0)
// push argument 2
@2
D=M
@2
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// push argument 0
@2
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// sub
@SP
M=M-1
A=M
D=M
@SP
M=M-1
A=M
M=D-M
M=-M
@SP
M=M+1
// call Math.abs 1
@1
D=A
@R13
M=D
@Math.abs
D=A
@R14
M=D
@L_Screen_307
D=A
@FW__CALL
0;JMP
(L_Screen_307)
// pop local 3
@1
D=M
@3
D=D+A
@R13
M=D
@SP
M=M-1
A=M
D=M
@R13
A=M
M=D
// push argument 3
@2
D=M
@3
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// push argument 1
@2
D=M
@1
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// sub
@SP
M=M-1
A=M
D=M
@SP
M=M-1
A=M
M=D-M
M=-M
@SP
M=M+1
// call Math.abs 1
@1
D=A
@R13
M=D
@Math.abs
D=A
@R14
M=D
@L_Screen_308
D=A
@FW__CALL
0;JMP
(L_Screen_308)
// pop local 2
@1
D=M
@2
D=D+A
@R13
M=D
@SP
M=M-1
A=M
D=M
@R13
A=M
M=D
// push local 3
@1
D=M
@3
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// push local 2
@1
D=M
@2
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// lt
@SP
M=M-1
A=M
D=M
@SP
M=M-1
A=M
D=D-M
@L_Screen_309
D;JLE
D=-1
@L_Screen_310
D;JMP
(L_Screen_309)
D=0
(L_Screen_310)
@SP
A=M
M=D
@SP
M=M+1
// pop local 6
@1
D=M
@6
D=D+A
@R13
M=D
@SP
M=M-1
A=M
D=M
@R13
A=M
M=D
// push local 6
@1
D=M
@6
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// push argument 3
@2
D=M
@3
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// push argument 1
@2
D=M
@1
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// lt
@SP
M=M-1
A=M
D=M
@SP
M=M-1
A=M
D=D-M
@L_Screen_311
D;JLE
D=-1
@L_Screen_312
D;JMP
(L_Screen_311)
D=0
(L_Screen_312)
@SP
A=M
M=D
@SP
M=M+1
// and
@SP
M=M-1
A=M
D=M
@SP
M=M-1
A=M
M=D&M
@SP
M=M+1
// push local 6
@1
D=M
@6
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// not
@SP
M=M-1
A=M
M=!M
@SP
M=M+1
// push argument 2
@2
D=M
@2
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// push argument 0
@2
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// lt
@SP
M=M-1
A=M
D=M
@SP
M=M-1
A=M
D=D-M
@L_Screen_313
D;JLE
D=-1
@L_Screen_314
D;JMP
(L_Screen_313)
D=0
(L_Screen_314)
@SP
A=M
M=D
@SP
M=M+1
// and
@SP
M=M-1
A=M
D=M
@SP
M=M-1
A=M
M=D&M
@SP
M=M+1
// or
@SP
M=M-1
A=M
D=M
@SP
M=M-1
A=M
M=D|M
@SP
M=M+1
// if-goto IF_TRUE1
@SP
M=M-1
A=M
D=M
@Screen.Screen.drawLine$IF_TRUE1
D;JNE
// goto IF_FALSE1
@Screen.Screen.drawLine$IF_FALSE1
0;JMP
// label IF_TRUE1
(Screen.Screen.drawLine$IF_TRUE1)
// push argument 0
@2
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// pop local 4
@1
D=M
@4
D=D+A
@R13
M=D
@SP
M=M-1
A=M
D=M
@R13
A=M
M=D
// push argument 2
@2
D=M
@2
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// pop argument 0
@2
D=M
@0
D=D+A
@R13
M=D
@SP
M=M-1
A=M
D=M
@R13
A=M
M=D
// push local 4
@1
D=M
@4
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// pop argument 2
@2
D=M
@2
D=D+A
@R13
M=D
@SP
M=M-1
A=M
D=M
@R13
A=M
M=D
// push argument 1
@2
D=M
@1
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// pop local 4
@1
D=M
@4
D=D+A
@R13
M=D
@SP
M=M-1
A=M
D=M
@R13
A=M
M=D
// push argument 3
@2
D=M
@3
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// pop argument 1
@2
D=M
@1
D=D+A
@R13
M=D
@SP
M=M-1
A=M
D=M
@R13
A=M
M=D
// push local 4
@1
D=M
@4
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// pop argument 3
@2
D=M
@3
D=D+A
@R13
M=D
@SP
M=M-1
A=M
D=M
@R13
A=M
M=D
// label IF_FALSE1
(Screen.Screen.drawLine$IF_FALSE1)
// push local 6
@1
D=M
@6
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// if-goto IF_TRUE2
@SP
M=M-1
A=M
D=M
@Screen.Screen.drawLine$IF_TRUE2
D;JNE
// goto IF_FALSE2
@Screen.Screen.drawLine$IF_FALSE2
0;JMP
// label IF_TRUE2
(Screen.Screen.drawLine$IF_TRUE2)
// push local 3
@1
D=M
@3
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// pop local 4
@1
D=M
@4
D=D+A
@R13
M=D
@SP
M=M-1
A=M
D=M
@R13
A=M
M=D
// push local 2
@1
D=M
@2
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// pop local 3
@1
D=M
@3
D=D+A
@R13
M=D
@SP
M=M-1
A=M
D=M
@R13
A=M
M=D
// push local 4
@1
D=M
@4
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// pop local 2
@1
D=M
@2
D=D+A
@R13
M=D
@SP
M=M-1
A=M
D=M
@R13
A=M
M=D
// push argument 1
@2
D=M
@1
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// pop local 1
@1
D=M
@1
D=D+A
@R13
M=D
@SP
M=M-1
A=M
D=M
@R13
A=M
M=D
// push argument 0
@2
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// pop local 0
@1
D=M
@0
D=D+A
@R13
M=D
@SP
M=M-1
A=M
D=M
@R13
A=M
M=D
// push argument 3
@2
D=M
@3
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// pop local 8
@1
D=M
@8
D=D+A
@R13
M=D
@SP
M=M-1
A=M
D=M
@R13
A=M
M=D
// push argument 0
@2
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// push argument 2
@2
D=M
@2
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// gt
@SP
M=M-1
A=M
D=M
@SP
M=M-1
A=M
D=D-M
@L_Screen_315
D;JGE
D=-1
@L_Screen_316
D;JMP
(L_Screen_315)
D=0
(L_Screen_316)
@SP
A=M
M=D
@SP
M=M+1
// pop local 7
@1
D=M
@7
D=D+A
@R13
M=D
@SP
M=M-1
A=M
D=M
@R13
A=M
M=D
// goto IF_END2
@Screen.Screen.drawLine$IF_END2
0;JMP
// label IF_FALSE2
(Screen.Screen.drawLine$IF_FALSE2)
// push argument 0
@2
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// pop local 1
@1
D=M
@1
D=D+A
@R13
M=D
@SP
M=M-1
A=M
D=M
@R13
A=M
M=D
// push argument 1
@2
D=M
@1
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// pop local 0
@1
D=M
@0
D=D+A
@R13
M=D
@SP
M=M-1
A=M
D=M
@R13
A=M
M=D
// push argument 2
@2
D=M
@2
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// pop local 8
@1
D=M
@8
D=D+A
@R13
M=D
@SP
M=M-1
A=M
D=M
@R13
A=M
M=D
// push argument 1
@2
D=M
@1
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// push argument 3
@2
D=M
@3
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// gt
@SP
M=M-1
A=M
D=M
@SP
M=M-1
A=M
D=D-M
@L_Screen_317
D;JGE
D=-1
@L_Screen_318
D;JMP
(L_Screen_317)
D=0
(L_Screen_318)
@SP
A=M
M=D
@SP
M=M+1
// pop local 7
@1
D=M
@7
D=D+A
@R13
M=D
@SP
M=M-1
A=M
D=M
@R13
A=M
M=D
// label IF_END2
(Screen.Screen.drawLine$IF_END2)
// push constant 2
@2
D=A
@SP
A=M
M=D
@SP
M=M+1
// push local 2
@1
D=M
@2
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// call Math.multiply 2
@2
D=A
@R13
M=D
@Math.multiply
D=A
@R14
M=D
@L_Screen_319
D=A
@FW__CALL
0;JMP
(L_Screen_319)
// push local 3
@1
D=M
@3
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// sub
@SP
M=M-1
A=M
D=M
@SP
M=M-1
A=M
M=D-M
M=-M
@SP
M=M+1
// pop local 5
@1
D=M
@5
D=D+A
@R13
M=D
@SP
M=M-1
A=M
D=M
@R13
A=M
M=D
// push constant 2
@2
D=A
@SP
A=M
M=D
@SP
M=M+1
// push local 2
@1
D=M
@2
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// call Math.multiply 2
@2
D=A
@R13
M=D
@Math.multiply
D=A
@R14
M=D
@L_Screen_320
D=A
@FW__CALL
0;JMP
(L_Screen_320)
// pop local 9
@1
D=M
@9
D=D+A
@R13
M=D
@SP
M=M-1
A=M
D=M
@R13
A=M
M=D
// push constant 2
@2
D=A
@SP
A=M
M=D
@SP
M=M+1
// push local 2
@1
D=M
@2
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// push local 3
@1
D=M
@3
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// sub
@SP
M=M-1
A=M
D=M
@SP
M=M-1
A=M
M=D-M
M=-M
@SP
M=M+1
// call Math.multiply 2
@2
D=A
@R13
M=D
@Math.multiply
D=A
@R14
M=D
@L_Screen_321
D=A
@FW__CALL
0;JMP
(L_Screen_321)
// pop local 10
@1
D=M
@10
D=D+A
@R13
M=D
@SP
M=M-1
A=M
D=M
@R13
A=M
M=D
// push local 1
@1
D=M
@1
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// push local 0
@1
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// push local 6
@1
D=M
@6
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// call Screen.drawConditional 3
@3
D=A
@R13
M=D
@Screen.drawConditional
D=A
@R14
M=D
@L_Screen_322
D=A
@FW__CALL
0;JMP
(L_Screen_322)
// pop temp 0
@SP
M=M-1
A=M
D=M
@5
M=D
// label WHILE_EXP0
(Screen.Screen.drawLine$WHILE_EXP0)
// push local 1
@1
D=M
@1
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// push local 8
@1
D=M
@8
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// lt
@SP
M=M-1
A=M
D=M
@SP
M=M-1
A=M
D=D-M
@L_Screen_323
D;JLE
D=-1
@L_Screen_324
D;JMP
(L_Screen_323)
D=0
(L_Screen_324)
@SP
A=M
M=D
@SP
M=M+1
// not
@SP
M=M-1
A=M
M=!M
@SP
M=M+1
// if-goto WHILE_END0
@SP
M=M-1
A=M
D=M
@Screen.Screen.drawLine$WHILE_END0
D;JNE
// push local 5
@1
D=M
@5
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// lt
@SP
M=M-1
A=M
D=M
@SP
M=M-1
A=M
D=D-M
@L_Screen_325
D;JLE
D=-1
@L_Screen_326
D;JMP
(L_Screen_325)
D=0
(L_Screen_326)
@SP
A=M
M=D
@SP
M=M+1
// if-goto IF_TRUE3
@SP
M=M-1
A=M
D=M
@Screen.Screen.drawLine$IF_TRUE3
D;JNE
// goto IF_FALSE3
@Screen.Screen.drawLine$IF_FALSE3
0;JMP
// label IF_TRUE3
(Screen.Screen.drawLine$IF_TRUE3)
// push local 5
@1
D=M
@5
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// push local 9
@1
D=M
@9
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// add
@SP
M=M-1
A=M
D=M
@SP
M=M-1
A=M
M=D+M
@SP
M=M+1
// pop local 5
@1
D=M
@5
D=D+A
@R13
M=D
@SP
M=M-1
A=M
D=M
@R13
A=M
M=D
// goto IF_END3
@Screen.Screen.drawLine$IF_END3
0;JMP
// label IF_FALSE3
(Screen.Screen.drawLine$IF_FALSE3)
// push local 5
@1
D=M
@5
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// push local 10
@1
D=M
@10
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// add
@SP
M=M-1
A=M
D=M
@SP
M=M-1
A=M
M=D+M
@SP
M=M+1
// pop local 5
@1
D=M
@5
D=D+A
@R13
M=D
@SP
M=M-1
A=M
D=M
@R13
A=M
M=D
// push local 7
@1
D=M
@7
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// if-goto IF_TRUE4
@SP
M=M-1
A=M
D=M
@Screen.Screen.drawLine$IF_TRUE4
D;JNE
// goto IF_FALSE4
@Screen.Screen.drawLine$IF_FALSE4
0;JMP
// label IF_TRUE4
(Screen.Screen.drawLine$IF_TRUE4)
// push local 0
@1
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// push constant 1
@1
D=A
@SP
A=M
M=D
@SP
M=M+1
// sub
@SP
M=M-1
A=M
D=M
@SP
M=M-1
A=M
M=D-M
M=-M
@SP
M=M+1
// pop local 0
@1
D=M
@0
D=D+A
@R13
M=D
@SP
M=M-1
A=M
D=M
@R13
A=M
M=D
// goto IF_END4
@Screen.Screen.drawLine$IF_END4
0;JMP
// label IF_FALSE4
(Screen.Screen.drawLine$IF_FALSE4)
// push local 0
@1
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// push constant 1
@1
D=A
@SP
A=M
M=D
@SP
M=M+1
// add
@SP
M=M-1
A=M
D=M
@SP
M=M-1
A=M
M=D+M
@SP
M=M+1
// pop local 0
@1
D=M
@0
D=D+A
@R13
M=D
@SP
M=M-1
A=M
D=M
@R13
A=M
M=D
// label IF_END4
(Screen.Screen.drawLine$IF_END4)
// label IF_END3
(Screen.Screen.drawLine$IF_END3)
// push local 1
@1
D=M
@1
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// push constant 1
@1
D=A
@SP
A=M
M=D
@SP
M=M+1
// add
@SP
M=M-1
A=M
D=M
@SP
M=M-1
A=M
M=D+M
@SP
M=M+1
// pop local 1
@1
D=M
@1
D=D+A
@R13
M=D
@SP
M=M-1
A=M
D=M
@R13
A=M
M=D
// push local 1
@1
D=M
@1
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// push local 0
@1
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// push local 6
@1
D=M
@6
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// call Screen.drawConditional 3
@3
D=A
@R13
M=D
@Screen.drawConditional
D=A
@R14
M=D
@L_Screen_327
D=A
@FW__CALL
0;JMP
(L_Screen_327)
// pop temp 0
@SP
M=M-1
A=M
D=M
@5
M=D
// goto WHILE_EXP0
@Screen.Screen.drawLine$WHILE_EXP0
0;JMP
// label WHILE_END0
(Screen.Screen.drawLine$WHILE_END0)
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// return
@FW__RETURN
0;JMP
// function Screen.drawRectangle 9
(Screen.drawRectangle)
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// push argument 0
@2
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// push argument 2
@2
D=M
@2
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// gt
@SP
M=M-1
A=M
D=M
@SP
M=M-1
A=M
D=D-M
@L_Screen_328
D;JGE
D=-1
@L_Screen_329
D;JMP
(L_Screen_328)
D=0
(L_Screen_329)
@SP
A=M
M=D
@SP
M=M+1
// push argument 1
@2
D=M
@1
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// push argument 3
@2
D=M
@3
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// gt
@SP
M=M-1
A=M
D=M
@SP
M=M-1
A=M
D=D-M
@L_Screen_330
D;JGE
D=-1
@L_Screen_331
D;JMP
(L_Screen_330)
D=0
(L_Screen_331)
@SP
A=M
M=D
@SP
M=M+1
// or
@SP
M=M-1
A=M
D=M
@SP
M=M-1
A=M
M=D|M
@SP
M=M+1
// push argument 0
@2
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// lt
@SP
M=M-1
A=M
D=M
@SP
M=M-1
A=M
D=D-M
@L_Screen_332
D;JLE
D=-1
@L_Screen_333
D;JMP
(L_Screen_332)
D=0
(L_Screen_333)
@SP
A=M
M=D
@SP
M=M+1
// or
@SP
M=M-1
A=M
D=M
@SP
M=M-1
A=M
M=D|M
@SP
M=M+1
// push argument 2
@2
D=M
@2
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// push constant 511
@511
D=A
@SP
A=M
M=D
@SP
M=M+1
// gt
@SP
M=M-1
A=M
D=M
@SP
M=M-1
A=M
D=D-M
@L_Screen_334
D;JGE
D=-1
@L_Screen_335
D;JMP
(L_Screen_334)
D=0
(L_Screen_335)
@SP
A=M
M=D
@SP
M=M+1
// or
@SP
M=M-1
A=M
D=M
@SP
M=M-1
A=M
M=D|M
@SP
M=M+1
// push argument 1
@2
D=M
@1
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// lt
@SP
M=M-1
A=M
D=M
@SP
M=M-1
A=M
D=D-M
@L_Screen_336
D;JLE
D=-1
@L_Screen_337
D;JMP
(L_Screen_336)
D=0
(L_Screen_337)
@SP
A=M
M=D
@SP
M=M+1
// or
@SP
M=M-1
A=M
D=M
@SP
M=M-1
A=M
M=D|M
@SP
M=M+1
// push argument 3
@2
D=M
@3
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// push constant 255
@255
D=A
@SP
A=M
M=D
@SP
M=M+1
// gt
@SP
M=M-1
A=M
D=M
@SP
M=M-1
A=M
D=D-M
@L_Screen_338
D;JGE
D=-1
@L_Screen_339
D;JMP
(L_Screen_338)
D=0
(L_Screen_339)
@SP
A=M
M=D
@SP
M=M+1
// or
@SP
M=M-1
A=M
D=M
@SP
M=M-1
A=M
M=D|M
@SP
M=M+1
// if-goto IF_TRUE0
@SP
M=M-1
A=M
D=M
@Screen.Screen.drawRectangle$IF_TRUE0
D;JNE
// goto IF_FALSE0
@Screen.Screen.drawRectangle$IF_FALSE0
0;JMP
// label IF_TRUE0
(Screen.Screen.drawRectangle$IF_TRUE0)
// push constant 9
@9
D=A
@SP
A=M
M=D
@SP
M=M+1
// call Sys.error 1
@1
D=A
@R13
M=D
@Sys.error
D=A
@R14
M=D
@L_Screen_340
D=A
@FW__CALL
0;JMP
(L_Screen_340)
// pop temp 0
@SP
M=M-1
A=M
D=M
@5
M=D
// label IF_FALSE0
(Screen.Screen.drawRectangle$IF_FALSE0)
// push argument 0
@2
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// push constant 16
@16
D=A
@SP
A=M
M=D
@SP
M=M+1
// call Math.divide 2
@2
D=A
@R13
M=D
@Math.divide
D=A
@R14
M=D
@L_Screen_341
D=A
@FW__CALL
0;JMP
(L_Screen_341)
// pop local 3
@1
D=M
@3
D=D+A
@R13
M=D
@SP
M=M-1
A=M
D=M
@R13
A=M
M=D
// push argument 0
@2
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// push local 3
@1
D=M
@3
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// push constant 16
@16
D=A
@SP
A=M
M=D
@SP
M=M+1
// call Math.multiply 2
@2
D=A
@R13
M=D
@Math.multiply
D=A
@R14
M=D
@L_Screen_342
D=A
@FW__CALL
0;JMP
(L_Screen_342)
// sub
@SP
M=M-1
A=M
D=M
@SP
M=M-1
A=M
M=D-M
M=-M
@SP
M=M+1
// pop local 7
@1
D=M
@7
D=D+A
@R13
M=D
@SP
M=M-1
A=M
D=M
@R13
A=M
M=D
// push argument 2
@2
D=M
@2
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// push constant 16
@16
D=A
@SP
A=M
M=D
@SP
M=M+1
// call Math.divide 2
@2
D=A
@R13
M=D
@Math.divide
D=A
@R14
M=D
@L_Screen_343
D=A
@FW__CALL
0;JMP
(L_Screen_343)
// pop local 4
@1
D=M
@4
D=D+A
@R13
M=D
@SP
M=M-1
A=M
D=M
@R13
A=M
M=D
// push argument 2
@2
D=M
@2
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// push local 4
@1
D=M
@4
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// push constant 16
@16
D=A
@SP
A=M
M=D
@SP
M=M+1
// call Math.multiply 2
@2
D=A
@R13
M=D
@Math.multiply
D=A
@R14
M=D
@L_Screen_344
D=A
@FW__CALL
0;JMP
(L_Screen_344)
// sub
@SP
M=M-1
A=M
D=M
@SP
M=M-1
A=M
M=D-M
M=-M
@SP
M=M+1
// pop local 8
@1
D=M
@8
D=D+A
@R13
M=D
@SP
M=M-1
A=M
D=M
@R13
A=M
M=D
// push local 7
@1
D=M
@7
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// push static 0
@Screen.0
D=M
@SP
A=M
M=D
@SP
M=M+1
// add
@SP
M=M-1
A=M
D=M
@SP
M=M-1
A=M
M=D+M
@SP
M=M+1
// pop pointer 1
@SP
M=M-1
A=M
D=M
@4
M=D
// push that 0
@THAT
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// push constant 1
@1
D=A
@SP
A=M
M=D
@SP
M=M+1
// sub
@SP
M=M-1
A=M
D=M
@SP
M=M-1
A=M
M=D-M
M=-M
@SP
M=M+1
// not
@SP
M=M-1
A=M
M=!M
@SP
M=M+1
// pop local 6
@1
D=M
@6
D=D+A
@R13
M=D
@SP
M=M-1
A=M
D=M
@R13
A=M
M=D
// push local 8
@1
D=M
@8
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// push constant 1
@1
D=A
@SP
A=M
M=D
@SP
M=M+1
// add
@SP
M=M-1
A=M
D=M
@SP
M=M-1
A=M
M=D+M
@SP
M=M+1
// push static 0
@Screen.0
D=M
@SP
A=M
M=D
@SP
M=M+1
// add
@SP
M=M-1
A=M
D=M
@SP
M=M-1
A=M
M=D+M
@SP
M=M+1
// pop pointer 1
@SP
M=M-1
A=M
D=M
@4
M=D
// push that 0
@THAT
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// push constant 1
@1
D=A
@SP
A=M
M=D
@SP
M=M+1
// sub
@SP
M=M-1
A=M
D=M
@SP
M=M-1
A=M
M=D-M
M=-M
@SP
M=M+1
// pop local 5
@1
D=M
@5
D=D+A
@R13
M=D
@SP
M=M-1
A=M
D=M
@R13
A=M
M=D
// push argument 1
@2
D=M
@1
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// push constant 32
@32
D=A
@SP
A=M
M=D
@SP
M=M+1
// call Math.multiply 2
@2
D=A
@R13
M=D
@Math.multiply
D=A
@R14
M=D
@L_Screen_345
D=A
@FW__CALL
0;JMP
(L_Screen_345)
// push local 3
@1
D=M
@3
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// add
@SP
M=M-1
A=M
D=M
@SP
M=M-1
A=M
M=D+M
@SP
M=M+1
// pop local 0
@1
D=M
@0
D=D+A
@R13
M=D
@SP
M=M-1
A=M
D=M
@R13
A=M
M=D
// push local 4
@1
D=M
@4
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// push local 3
@1
D=M
@3
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// sub
@SP
M=M-1
A=M
D=M
@SP
M=M-1
A=M
M=D-M
M=-M
@SP
M=M+1
// pop local 2
@1
D=M
@2
D=D+A
@R13
M=D
@SP
M=M-1
A=M
D=M
@R13
A=M
M=D
// label WHILE_EXP0
(Screen.Screen.drawRectangle$WHILE_EXP0)
// push argument 1
@2
D=M
@1
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// push argument 3
@2
D=M
@3
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// gt
@SP
M=M-1
A=M
D=M
@SP
M=M-1
A=M
D=D-M
@L_Screen_346
D;JGE
D=-1
@L_Screen_347
D;JMP
(L_Screen_346)
D=0
(L_Screen_347)
@SP
A=M
M=D
@SP
M=M+1
// not
@SP
M=M-1
A=M
M=!M
@SP
M=M+1
// not
@SP
M=M-1
A=M
M=!M
@SP
M=M+1
// if-goto WHILE_END0
@SP
M=M-1
A=M
D=M
@Screen.Screen.drawRectangle$WHILE_END0
D;JNE
// push local 0
@1
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// push local 2
@1
D=M
@2
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// add
@SP
M=M-1
A=M
D=M
@SP
M=M-1
A=M
M=D+M
@SP
M=M+1
// pop local 1
@1
D=M
@1
D=D+A
@R13
M=D
@SP
M=M-1
A=M
D=M
@R13
A=M
M=D
// push local 2
@1
D=M
@2
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// eq
@SP
M=M-1
A=M
D=M
@SP
M=M-1
A=M
D=D-M
@L_Screen_348
D;JNE
D=-1
@L_Screen_349
D;JMP
(L_Screen_348)
D=0
(L_Screen_349)
@SP
A=M
M=D
@SP
M=M+1
// if-goto IF_TRUE1
@SP
M=M-1
A=M
D=M
@Screen.Screen.drawRectangle$IF_TRUE1
D;JNE
// goto IF_FALSE1
@Screen.Screen.drawRectangle$IF_FALSE1
0;JMP
// label IF_TRUE1
(Screen.Screen.drawRectangle$IF_TRUE1)
// push local 0
@1
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// push local 5
@1
D=M
@5
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// push local 6
@1
D=M
@6
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// and
@SP
M=M-1
A=M
D=M
@SP
M=M-1
A=M
M=D&M
@SP
M=M+1
// call Screen.updateLocation 2
@2
D=A
@R13
M=D
@Screen.updateLocation
D=A
@R14
M=D
@L_Screen_350
D=A
@FW__CALL
0;JMP
(L_Screen_350)
// pop temp 0
@SP
M=M-1
A=M
D=M
@5
M=D
// goto IF_END1
@Screen.Screen.drawRectangle$IF_END1
0;JMP
// label IF_FALSE1
(Screen.Screen.drawRectangle$IF_FALSE1)
// push local 0
@1
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// push local 6
@1
D=M
@6
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// call Screen.updateLocation 2
@2
D=A
@R13
M=D
@Screen.updateLocation
D=A
@R14
M=D
@L_Screen_351
D=A
@FW__CALL
0;JMP
(L_Screen_351)
// pop temp 0
@SP
M=M-1
A=M
D=M
@5
M=D
// push local 0
@1
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// push constant 1
@1
D=A
@SP
A=M
M=D
@SP
M=M+1
// add
@SP
M=M-1
A=M
D=M
@SP
M=M-1
A=M
M=D+M
@SP
M=M+1
// pop local 0
@1
D=M
@0
D=D+A
@R13
M=D
@SP
M=M-1
A=M
D=M
@R13
A=M
M=D
// label WHILE_EXP1
(Screen.Screen.drawRectangle$WHILE_EXP1)
// push local 0
@1
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// push local 1
@1
D=M
@1
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// lt
@SP
M=M-1
A=M
D=M
@SP
M=M-1
A=M
D=D-M
@L_Screen_352
D;JLE
D=-1
@L_Screen_353
D;JMP
(L_Screen_352)
D=0
(L_Screen_353)
@SP
A=M
M=D
@SP
M=M+1
// not
@SP
M=M-1
A=M
M=!M
@SP
M=M+1
// if-goto WHILE_END1
@SP
M=M-1
A=M
D=M
@Screen.Screen.drawRectangle$WHILE_END1
D;JNE
// push local 0
@1
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// push constant 1
@1
D=A
@SP
A=M
M=D
@SP
M=M+1
// neg
@SP
M=M-1
A=M
M=-M
@SP
M=M+1
// call Screen.updateLocation 2
@2
D=A
@R13
M=D
@Screen.updateLocation
D=A
@R14
M=D
@L_Screen_354
D=A
@FW__CALL
0;JMP
(L_Screen_354)
// pop temp 0
@SP
M=M-1
A=M
D=M
@5
M=D
// push local 0
@1
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// push constant 1
@1
D=A
@SP
A=M
M=D
@SP
M=M+1
// add
@SP
M=M-1
A=M
D=M
@SP
M=M-1
A=M
M=D+M
@SP
M=M+1
// pop local 0
@1
D=M
@0
D=D+A
@R13
M=D
@SP
M=M-1
A=M
D=M
@R13
A=M
M=D
// goto WHILE_EXP1
@Screen.Screen.drawRectangle$WHILE_EXP1
0;JMP
// label WHILE_END1
(Screen.Screen.drawRectangle$WHILE_END1)
// push local 1
@1
D=M
@1
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// push local 5
@1
D=M
@5
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// call Screen.updateLocation 2
@2
D=A
@R13
M=D
@Screen.updateLocation
D=A
@R14
M=D
@L_Screen_355
D=A
@FW__CALL
0;JMP
(L_Screen_355)
// pop temp 0
@SP
M=M-1
A=M
D=M
@5
M=D
// label IF_END1
(Screen.Screen.drawRectangle$IF_END1)
// push argument 1
@2
D=M
@1
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// push constant 1
@1
D=A
@SP
A=M
M=D
@SP
M=M+1
// add
@SP
M=M-1
A=M
D=M
@SP
M=M-1
A=M
M=D+M
@SP
M=M+1
// pop argument 1
@2
D=M
@1
D=D+A
@R13
M=D
@SP
M=M-1
A=M
D=M
@R13
A=M
M=D
// push local 1
@1
D=M
@1
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// push constant 32
@32
D=A
@SP
A=M
M=D
@SP
M=M+1
// add
@SP
M=M-1
A=M
D=M
@SP
M=M-1
A=M
M=D+M
@SP
M=M+1
// push local 2
@1
D=M
@2
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// sub
@SP
M=M-1
A=M
D=M
@SP
M=M-1
A=M
M=D-M
M=-M
@SP
M=M+1
// pop local 0
@1
D=M
@0
D=D+A
@R13
M=D
@SP
M=M-1
A=M
D=M
@R13
A=M
M=D
// goto WHILE_EXP0
@Screen.Screen.drawRectangle$WHILE_EXP0
0;JMP
// label WHILE_END0
(Screen.Screen.drawRectangle$WHILE_END0)
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// return
@FW__RETURN
0;JMP
// function Screen.drawHorizontal 11
(Screen.drawHorizontal)
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// push argument 1
@2
D=M
@1
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// push argument 2
@2
D=M
@2
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// call Math.min 2
@2
D=A
@R13
M=D
@Math.min
D=A
@R14
M=D
@L_Screen_356
D=A
@FW__CALL
0;JMP
(L_Screen_356)
// pop local 7
@1
D=M
@7
D=D+A
@R13
M=D
@SP
M=M-1
A=M
D=M
@R13
A=M
M=D
// push argument 1
@2
D=M
@1
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// push argument 2
@2
D=M
@2
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// call Math.max 2
@2
D=A
@R13
M=D
@Math.max
D=A
@R14
M=D
@L_Screen_357
D=A
@FW__CALL
0;JMP
(L_Screen_357)
// pop local 8
@1
D=M
@8
D=D+A
@R13
M=D
@SP
M=M-1
A=M
D=M
@R13
A=M
M=D
// push argument 0
@2
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// push constant 1
@1
D=A
@SP
A=M
M=D
@SP
M=M+1
// neg
@SP
M=M-1
A=M
M=-M
@SP
M=M+1
// gt
@SP
M=M-1
A=M
D=M
@SP
M=M-1
A=M
D=D-M
@L_Screen_358
D;JGE
D=-1
@L_Screen_359
D;JMP
(L_Screen_358)
D=0
(L_Screen_359)
@SP
A=M
M=D
@SP
M=M+1
// push argument 0
@2
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// push constant 256
@256
D=A
@SP
A=M
M=D
@SP
M=M+1
// lt
@SP
M=M-1
A=M
D=M
@SP
M=M-1
A=M
D=D-M
@L_Screen_360
D;JLE
D=-1
@L_Screen_361
D;JMP
(L_Screen_360)
D=0
(L_Screen_361)
@SP
A=M
M=D
@SP
M=M+1
// and
@SP
M=M-1
A=M
D=M
@SP
M=M-1
A=M
M=D&M
@SP
M=M+1
// push local 7
@1
D=M
@7
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// push constant 512
@512
D=A
@SP
A=M
M=D
@SP
M=M+1
// lt
@SP
M=M-1
A=M
D=M
@SP
M=M-1
A=M
D=D-M
@L_Screen_362
D;JLE
D=-1
@L_Screen_363
D;JMP
(L_Screen_362)
D=0
(L_Screen_363)
@SP
A=M
M=D
@SP
M=M+1
// and
@SP
M=M-1
A=M
D=M
@SP
M=M-1
A=M
M=D&M
@SP
M=M+1
// push local 8
@1
D=M
@8
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// push constant 1
@1
D=A
@SP
A=M
M=D
@SP
M=M+1
// neg
@SP
M=M-1
A=M
M=-M
@SP
M=M+1
// gt
@SP
M=M-1
A=M
D=M
@SP
M=M-1
A=M
D=D-M
@L_Screen_364
D;JGE
D=-1
@L_Screen_365
D;JMP
(L_Screen_364)
D=0
(L_Screen_365)
@SP
A=M
M=D
@SP
M=M+1
// and
@SP
M=M-1
A=M
D=M
@SP
M=M-1
A=M
M=D&M
@SP
M=M+1
// if-goto IF_TRUE0
@SP
M=M-1
A=M
D=M
@Screen.Screen.drawHorizontal$IF_TRUE0
D;JNE
// goto IF_FALSE0
@Screen.Screen.drawHorizontal$IF_FALSE0
0;JMP
// label IF_TRUE0
(Screen.Screen.drawHorizontal$IF_TRUE0)
// push local 7
@1
D=M
@7
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// call Math.max 2
@2
D=A
@R13
M=D
@Math.max
D=A
@R14
M=D
@L_Screen_366
D=A
@FW__CALL
0;JMP
(L_Screen_366)
// pop local 7
@1
D=M
@7
D=D+A
@R13
M=D
@SP
M=M-1
A=M
D=M
@R13
A=M
M=D
// push local 8
@1
D=M
@8
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// push constant 511
@511
D=A
@SP
A=M
M=D
@SP
M=M+1
// call Math.min 2
@2
D=A
@R13
M=D
@Math.min
D=A
@R14
M=D
@L_Screen_367
D=A
@FW__CALL
0;JMP
(L_Screen_367)
// pop local 8
@1
D=M
@8
D=D+A
@R13
M=D
@SP
M=M-1
A=M
D=M
@R13
A=M
M=D
// push local 7
@1
D=M
@7
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// push constant 16
@16
D=A
@SP
A=M
M=D
@SP
M=M+1
// call Math.divide 2
@2
D=A
@R13
M=D
@Math.divide
D=A
@R14
M=D
@L_Screen_368
D=A
@FW__CALL
0;JMP
(L_Screen_368)
// pop local 1
@1
D=M
@1
D=D+A
@R13
M=D
@SP
M=M-1
A=M
D=M
@R13
A=M
M=D
// push local 7
@1
D=M
@7
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// push local 1
@1
D=M
@1
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// push constant 16
@16
D=A
@SP
A=M
M=D
@SP
M=M+1
// call Math.multiply 2
@2
D=A
@R13
M=D
@Math.multiply
D=A
@R14
M=D
@L_Screen_369
D=A
@FW__CALL
0;JMP
(L_Screen_369)
// sub
@SP
M=M-1
A=M
D=M
@SP
M=M-1
A=M
M=D-M
M=-M
@SP
M=M+1
// pop local 9
@1
D=M
@9
D=D+A
@R13
M=D
@SP
M=M-1
A=M
D=M
@R13
A=M
M=D
// push local 8
@1
D=M
@8
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// push constant 16
@16
D=A
@SP
A=M
M=D
@SP
M=M+1
// call Math.divide 2
@2
D=A
@R13
M=D
@Math.divide
D=A
@R14
M=D
@L_Screen_370
D=A
@FW__CALL
0;JMP
(L_Screen_370)
// pop local 2
@1
D=M
@2
D=D+A
@R13
M=D
@SP
M=M-1
A=M
D=M
@R13
A=M
M=D
// push local 8
@1
D=M
@8
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// push local 2
@1
D=M
@2
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// push constant 16
@16
D=A
@SP
A=M
M=D
@SP
M=M+1
// call Math.multiply 2
@2
D=A
@R13
M=D
@Math.multiply
D=A
@R14
M=D
@L_Screen_371
D=A
@FW__CALL
0;JMP
(L_Screen_371)
// sub
@SP
M=M-1
A=M
D=M
@SP
M=M-1
A=M
M=D-M
M=-M
@SP
M=M+1
// pop local 10
@1
D=M
@10
D=D+A
@R13
M=D
@SP
M=M-1
A=M
D=M
@R13
A=M
M=D
// push local 9
@1
D=M
@9
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// push static 0
@Screen.0
D=M
@SP
A=M
M=D
@SP
M=M+1
// add
@SP
M=M-1
A=M
D=M
@SP
M=M-1
A=M
M=D+M
@SP
M=M+1
// pop pointer 1
@SP
M=M-1
A=M
D=M
@4
M=D
// push that 0
@THAT
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// push constant 1
@1
D=A
@SP
A=M
M=D
@SP
M=M+1
// sub
@SP
M=M-1
A=M
D=M
@SP
M=M-1
A=M
M=D-M
M=-M
@SP
M=M+1
// not
@SP
M=M-1
A=M
M=!M
@SP
M=M+1
// pop local 5
@1
D=M
@5
D=D+A
@R13
M=D
@SP
M=M-1
A=M
D=M
@R13
A=M
M=D
// push local 10
@1
D=M
@10
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// push constant 1
@1
D=A
@SP
A=M
M=D
@SP
M=M+1
// add
@SP
M=M-1
A=M
D=M
@SP
M=M-1
A=M
M=D+M
@SP
M=M+1
// push static 0
@Screen.0
D=M
@SP
A=M
M=D
@SP
M=M+1
// add
@SP
M=M-1
A=M
D=M
@SP
M=M-1
A=M
M=D+M
@SP
M=M+1
// pop pointer 1
@SP
M=M-1
A=M
D=M
@4
M=D
// push that 0
@THAT
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// push constant 1
@1
D=A
@SP
A=M
M=D
@SP
M=M+1
// sub
@SP
M=M-1
A=M
D=M
@SP
M=M-1
A=M
M=D-M
M=-M
@SP
M=M+1
// pop local 4
@1
D=M
@4
D=D+A
@R13
M=D
@SP
M=M-1
A=M
D=M
@R13
A=M
M=D
// push argument 0
@2
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// push constant 32
@32
D=A
@SP
A=M
M=D
@SP
M=M+1
// call Math.multiply 2
@2
D=A
@R13
M=D
@Math.multiply
D=A
@R14
M=D
@L_Screen_372
D=A
@FW__CALL
0;JMP
(L_Screen_372)
// push local 1
@1
D=M
@1
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// add
@SP
M=M-1
A=M
D=M
@SP
M=M-1
A=M
M=D+M
@SP
M=M+1
// pop local 0
@1
D=M
@0
D=D+A
@R13
M=D
@SP
M=M-1
A=M
D=M
@R13
A=M
M=D
// push local 2
@1
D=M
@2
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// push local 1
@1
D=M
@1
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// sub
@SP
M=M-1
A=M
D=M
@SP
M=M-1
A=M
M=D-M
M=-M
@SP
M=M+1
// pop local 6
@1
D=M
@6
D=D+A
@R13
M=D
@SP
M=M-1
A=M
D=M
@R13
A=M
M=D
// push local 0
@1
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// push local 6
@1
D=M
@6
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// add
@SP
M=M-1
A=M
D=M
@SP
M=M-1
A=M
M=D+M
@SP
M=M+1
// pop local 3
@1
D=M
@3
D=D+A
@R13
M=D
@SP
M=M-1
A=M
D=M
@R13
A=M
M=D
// push local 6
@1
D=M
@6
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// eq
@SP
M=M-1
A=M
D=M
@SP
M=M-1
A=M
D=D-M
@L_Screen_373
D;JNE
D=-1
@L_Screen_374
D;JMP
(L_Screen_373)
D=0
(L_Screen_374)
@SP
A=M
M=D
@SP
M=M+1
// if-goto IF_TRUE1
@SP
M=M-1
A=M
D=M
@Screen.Screen.drawHorizontal$IF_TRUE1
D;JNE
// goto IF_FALSE1
@Screen.Screen.drawHorizontal$IF_FALSE1
0;JMP
// label IF_TRUE1
(Screen.Screen.drawHorizontal$IF_TRUE1)
// push local 0
@1
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// push local 4
@1
D=M
@4
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// push local 5
@1
D=M
@5
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// and
@SP
M=M-1
A=M
D=M
@SP
M=M-1
A=M
M=D&M
@SP
M=M+1
// call Screen.updateLocation 2
@2
D=A
@R13
M=D
@Screen.updateLocation
D=A
@R14
M=D
@L_Screen_375
D=A
@FW__CALL
0;JMP
(L_Screen_375)
// pop temp 0
@SP
M=M-1
A=M
D=M
@5
M=D
// goto IF_END1
@Screen.Screen.drawHorizontal$IF_END1
0;JMP
// label IF_FALSE1
(Screen.Screen.drawHorizontal$IF_FALSE1)
// push local 0
@1
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// push local 5
@1
D=M
@5
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// call Screen.updateLocation 2
@2
D=A
@R13
M=D
@Screen.updateLocation
D=A
@R14
M=D
@L_Screen_376
D=A
@FW__CALL
0;JMP
(L_Screen_376)
// pop temp 0
@SP
M=M-1
A=M
D=M
@5
M=D
// push local 0
@1
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// push constant 1
@1
D=A
@SP
A=M
M=D
@SP
M=M+1
// add
@SP
M=M-1
A=M
D=M
@SP
M=M-1
A=M
M=D+M
@SP
M=M+1
// pop local 0
@1
D=M
@0
D=D+A
@R13
M=D
@SP
M=M-1
A=M
D=M
@R13
A=M
M=D
// label WHILE_EXP0
(Screen.Screen.drawHorizontal$WHILE_EXP0)
// push local 0
@1
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// push local 3
@1
D=M
@3
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// lt
@SP
M=M-1
A=M
D=M
@SP
M=M-1
A=M
D=D-M
@L_Screen_377
D;JLE
D=-1
@L_Screen_378
D;JMP
(L_Screen_377)
D=0
(L_Screen_378)
@SP
A=M
M=D
@SP
M=M+1
// not
@SP
M=M-1
A=M
M=!M
@SP
M=M+1
// if-goto WHILE_END0
@SP
M=M-1
A=M
D=M
@Screen.Screen.drawHorizontal$WHILE_END0
D;JNE
// push local 0
@1
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// push constant 1
@1
D=A
@SP
A=M
M=D
@SP
M=M+1
// neg
@SP
M=M-1
A=M
M=-M
@SP
M=M+1
// call Screen.updateLocation 2
@2
D=A
@R13
M=D
@Screen.updateLocation
D=A
@R14
M=D
@L_Screen_379
D=A
@FW__CALL
0;JMP
(L_Screen_379)
// pop temp 0
@SP
M=M-1
A=M
D=M
@5
M=D
// push local 0
@1
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// push constant 1
@1
D=A
@SP
A=M
M=D
@SP
M=M+1
// add
@SP
M=M-1
A=M
D=M
@SP
M=M-1
A=M
M=D+M
@SP
M=M+1
// pop local 0
@1
D=M
@0
D=D+A
@R13
M=D
@SP
M=M-1
A=M
D=M
@R13
A=M
M=D
// goto WHILE_EXP0
@Screen.Screen.drawHorizontal$WHILE_EXP0
0;JMP
// label WHILE_END0
(Screen.Screen.drawHorizontal$WHILE_END0)
// push local 3
@1
D=M
@3
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// push local 4
@1
D=M
@4
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// call Screen.updateLocation 2
@2
D=A
@R13
M=D
@Screen.updateLocation
D=A
@R14
M=D
@L_Screen_380
D=A
@FW__CALL
0;JMP
(L_Screen_380)
// pop temp 0
@SP
M=M-1
A=M
D=M
@5
M=D
// label IF_END1
(Screen.Screen.drawHorizontal$IF_END1)
// label IF_FALSE0
(Screen.Screen.drawHorizontal$IF_FALSE0)
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// return
@FW__RETURN
0;JMP
// function Screen.drawSymetric 0
(Screen.drawSymetric)
// push argument 1
@2
D=M
@1
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// push argument 3
@2
D=M
@3
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// sub
@SP
M=M-1
A=M
D=M
@SP
M=M-1
A=M
M=D-M
M=-M
@SP
M=M+1
// push argument 0
@2
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// push argument 2
@2
D=M
@2
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// add
@SP
M=M-1
A=M
D=M
@SP
M=M-1
A=M
M=D+M
@SP
M=M+1
// push argument 0
@2
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// push argument 2
@2
D=M
@2
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// sub
@SP
M=M-1
A=M
D=M
@SP
M=M-1
A=M
M=D-M
M=-M
@SP
M=M+1
// call Screen.drawHorizontal 3
@3
D=A
@R13
M=D
@Screen.drawHorizontal
D=A
@R14
M=D
@L_Screen_381
D=A
@FW__CALL
0;JMP
(L_Screen_381)
// pop temp 0
@SP
M=M-1
A=M
D=M
@5
M=D
// push argument 1
@2
D=M
@1
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// push argument 3
@2
D=M
@3
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// add
@SP
M=M-1
A=M
D=M
@SP
M=M-1
A=M
M=D+M
@SP
M=M+1
// push argument 0
@2
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// push argument 2
@2
D=M
@2
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// add
@SP
M=M-1
A=M
D=M
@SP
M=M-1
A=M
M=D+M
@SP
M=M+1
// push argument 0
@2
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// push argument 2
@2
D=M
@2
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// sub
@SP
M=M-1
A=M
D=M
@SP
M=M-1
A=M
M=D-M
M=-M
@SP
M=M+1
// call Screen.drawHorizontal 3
@3
D=A
@R13
M=D
@Screen.drawHorizontal
D=A
@R14
M=D
@L_Screen_382
D=A
@FW__CALL
0;JMP
(L_Screen_382)
// pop temp 0
@SP
M=M-1
A=M
D=M
@5
M=D
// push argument 1
@2
D=M
@1
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// push argument 2
@2
D=M
@2
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// sub
@SP
M=M-1
A=M
D=M
@SP
M=M-1
A=M
M=D-M
M=-M
@SP
M=M+1
// push argument 0
@2
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// push argument 3
@2
D=M
@3
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// sub
@SP
M=M-1
A=M
D=M
@SP
M=M-1
A=M
M=D-M
M=-M
@SP
M=M+1
// push argument 0
@2
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// push argument 3
@2
D=M
@3
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// add
@SP
M=M-1
A=M
D=M
@SP
M=M-1
A=M
M=D+M
@SP
M=M+1
// call Screen.drawHorizontal 3
@3
D=A
@R13
M=D
@Screen.drawHorizontal
D=A
@R14
M=D
@L_Screen_383
D=A
@FW__CALL
0;JMP
(L_Screen_383)
// pop temp 0
@SP
M=M-1
A=M
D=M
@5
M=D
// push argument 1
@2
D=M
@1
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// push argument 2
@2
D=M
@2
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// add
@SP
M=M-1
A=M
D=M
@SP
M=M-1
A=M
M=D+M
@SP
M=M+1
// push argument 0
@2
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// push argument 3
@2
D=M
@3
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// sub
@SP
M=M-1
A=M
D=M
@SP
M=M-1
A=M
M=D-M
M=-M
@SP
M=M+1
// push argument 0
@2
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// push argument 3
@2
D=M
@3
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// add
@SP
M=M-1
A=M
D=M
@SP
M=M-1
A=M
M=D+M
@SP
M=M+1
// call Screen.drawHorizontal 3
@3
D=A
@R13
M=D
@Screen.drawHorizontal
D=A
@R14
M=D
@L_Screen_384
D=A
@FW__CALL
0;JMP
(L_Screen_384)
// pop temp 0
@SP
M=M-1
A=M
D=M
@5
M=D
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// return
@FW__RETURN
0;JMP
// function Screen.drawCircle 3
(Screen.drawCircle)
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// push argument 0
@2
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// lt
@SP
M=M-1
A=M
D=M
@SP
M=M-1
A=M
D=D-M
@L_Screen_385
D;JLE
D=-1
@L_Screen_386
D;JMP
(L_Screen_385)
D=0
(L_Screen_386)
@SP
A=M
M=D
@SP
M=M+1
// push argument 0
@2
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// push constant 511
@511
D=A
@SP
A=M
M=D
@SP
M=M+1
// gt
@SP
M=M-1
A=M
D=M
@SP
M=M-1
A=M
D=D-M
@L_Screen_387
D;JGE
D=-1
@L_Screen_388
D;JMP
(L_Screen_387)
D=0
(L_Screen_388)
@SP
A=M
M=D
@SP
M=M+1
// or
@SP
M=M-1
A=M
D=M
@SP
M=M-1
A=M
M=D|M
@SP
M=M+1
// push argument 1
@2
D=M
@1
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// lt
@SP
M=M-1
A=M
D=M
@SP
M=M-1
A=M
D=D-M
@L_Screen_389
D;JLE
D=-1
@L_Screen_390
D;JMP
(L_Screen_389)
D=0
(L_Screen_390)
@SP
A=M
M=D
@SP
M=M+1
// or
@SP
M=M-1
A=M
D=M
@SP
M=M-1
A=M
M=D|M
@SP
M=M+1
// push argument 1
@2
D=M
@1
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// push constant 255
@255
D=A
@SP
A=M
M=D
@SP
M=M+1
// gt
@SP
M=M-1
A=M
D=M
@SP
M=M-1
A=M
D=D-M
@L_Screen_391
D;JGE
D=-1
@L_Screen_392
D;JMP
(L_Screen_391)
D=0
(L_Screen_392)
@SP
A=M
M=D
@SP
M=M+1
// or
@SP
M=M-1
A=M
D=M
@SP
M=M-1
A=M
M=D|M
@SP
M=M+1
// if-goto IF_TRUE0
@SP
M=M-1
A=M
D=M
@Screen.Screen.drawCircle$IF_TRUE0
D;JNE
// goto IF_FALSE0
@Screen.Screen.drawCircle$IF_FALSE0
0;JMP
// label IF_TRUE0
(Screen.Screen.drawCircle$IF_TRUE0)
// push constant 12
@12
D=A
@SP
A=M
M=D
@SP
M=M+1
// call Sys.error 1
@1
D=A
@R13
M=D
@Sys.error
D=A
@R14
M=D
@L_Screen_393
D=A
@FW__CALL
0;JMP
(L_Screen_393)
// pop temp 0
@SP
M=M-1
A=M
D=M
@5
M=D
// label IF_FALSE0
(Screen.Screen.drawCircle$IF_FALSE0)
// push argument 0
@2
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// push argument 2
@2
D=M
@2
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// sub
@SP
M=M-1
A=M
D=M
@SP
M=M-1
A=M
M=D-M
M=-M
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// lt
@SP
M=M-1
A=M
D=M
@SP
M=M-1
A=M
D=D-M
@L_Screen_394
D;JLE
D=-1
@L_Screen_395
D;JMP
(L_Screen_394)
D=0
(L_Screen_395)
@SP
A=M
M=D
@SP
M=M+1
// push argument 0
@2
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// push argument 2
@2
D=M
@2
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// add
@SP
M=M-1
A=M
D=M
@SP
M=M-1
A=M
M=D+M
@SP
M=M+1
// push constant 511
@511
D=A
@SP
A=M
M=D
@SP
M=M+1
// gt
@SP
M=M-1
A=M
D=M
@SP
M=M-1
A=M
D=D-M
@L_Screen_396
D;JGE
D=-1
@L_Screen_397
D;JMP
(L_Screen_396)
D=0
(L_Screen_397)
@SP
A=M
M=D
@SP
M=M+1
// or
@SP
M=M-1
A=M
D=M
@SP
M=M-1
A=M
M=D|M
@SP
M=M+1
// push argument 1
@2
D=M
@1
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// push argument 2
@2
D=M
@2
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// sub
@SP
M=M-1
A=M
D=M
@SP
M=M-1
A=M
M=D-M
M=-M
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// lt
@SP
M=M-1
A=M
D=M
@SP
M=M-1
A=M
D=D-M
@L_Screen_398
D;JLE
D=-1
@L_Screen_399
D;JMP
(L_Screen_398)
D=0
(L_Screen_399)
@SP
A=M
M=D
@SP
M=M+1
// or
@SP
M=M-1
A=M
D=M
@SP
M=M-1
A=M
M=D|M
@SP
M=M+1
// push argument 1
@2
D=M
@1
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// push argument 2
@2
D=M
@2
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// add
@SP
M=M-1
A=M
D=M
@SP
M=M-1
A=M
M=D+M
@SP
M=M+1
// push constant 255
@255
D=A
@SP
A=M
M=D
@SP
M=M+1
// gt
@SP
M=M-1
A=M
D=M
@SP
M=M-1
A=M
D=D-M
@L_Screen_400
D;JGE
D=-1
@L_Screen_401
D;JMP
(L_Screen_400)
D=0
(L_Screen_401)
@SP
A=M
M=D
@SP
M=M+1
// or
@SP
M=M-1
A=M
D=M
@SP
M=M-1
A=M
M=D|M
@SP
M=M+1
// if-goto IF_TRUE1
@SP
M=M-1
A=M
D=M
@Screen.Screen.drawCircle$IF_TRUE1
D;JNE
// goto IF_FALSE1
@Screen.Screen.drawCircle$IF_FALSE1
0;JMP
// label IF_TRUE1
(Screen.Screen.drawCircle$IF_TRUE1)
// push constant 13
@13
D=A
@SP
A=M
M=D
@SP
M=M+1
// call Sys.error 1
@1
D=A
@R13
M=D
@Sys.error
D=A
@R14
M=D
@L_Screen_402
D=A
@FW__CALL
0;JMP
(L_Screen_402)
// pop temp 0
@SP
M=M-1
A=M
D=M
@5
M=D
// label IF_FALSE1
(Screen.Screen.drawCircle$IF_FALSE1)
// push argument 2
@2
D=M
@2
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// pop local 1
@1
D=M
@1
D=D+A
@R13
M=D
@SP
M=M-1
A=M
D=M
@R13
A=M
M=D
// push constant 1
@1
D=A
@SP
A=M
M=D
@SP
M=M+1
// push argument 2
@2
D=M
@2
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// sub
@SP
M=M-1
A=M
D=M
@SP
M=M-1
A=M
M=D-M
M=-M
@SP
M=M+1
// pop local 2
@1
D=M
@2
D=D+A
@R13
M=D
@SP
M=M-1
A=M
D=M
@R13
A=M
M=D
// push argument 0
@2
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// push argument 1
@2
D=M
@1
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// push local 0
@1
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// push local 1
@1
D=M
@1
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// call Screen.drawSymetric 4
@4
D=A
@R13
M=D
@Screen.drawSymetric
D=A
@R14
M=D
@L_Screen_403
D=A
@FW__CALL
0;JMP
(L_Screen_403)
// pop temp 0
@SP
M=M-1
A=M
D=M
@5
M=D
// label WHILE_EXP0
(Screen.Screen.drawCircle$WHILE_EXP0)
// push local 1
@1
D=M
@1
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// push local 0
@1
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// gt
@SP
M=M-1
A=M
D=M
@SP
M=M-1
A=M
D=D-M
@L_Screen_404
D;JGE
D=-1
@L_Screen_405
D;JMP
(L_Screen_404)
D=0
(L_Screen_405)
@SP
A=M
M=D
@SP
M=M+1
// not
@SP
M=M-1
A=M
M=!M
@SP
M=M+1
// if-goto WHILE_END0
@SP
M=M-1
A=M
D=M
@Screen.Screen.drawCircle$WHILE_END0
D;JNE
// push local 2
@1
D=M
@2
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// lt
@SP
M=M-1
A=M
D=M
@SP
M=M-1
A=M
D=D-M
@L_Screen_406
D;JLE
D=-1
@L_Screen_407
D;JMP
(L_Screen_406)
D=0
(L_Screen_407)
@SP
A=M
M=D
@SP
M=M+1
// if-goto IF_TRUE2
@SP
M=M-1
A=M
D=M
@Screen.Screen.drawCircle$IF_TRUE2
D;JNE
// goto IF_FALSE2
@Screen.Screen.drawCircle$IF_FALSE2
0;JMP
// label IF_TRUE2
(Screen.Screen.drawCircle$IF_TRUE2)
// push local 2
@1
D=M
@2
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// push constant 2
@2
D=A
@SP
A=M
M=D
@SP
M=M+1
// push local 0
@1
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// call Math.multiply 2
@2
D=A
@R13
M=D
@Math.multiply
D=A
@R14
M=D
@L_Screen_408
D=A
@FW__CALL
0;JMP
(L_Screen_408)
// add
@SP
M=M-1
A=M
D=M
@SP
M=M-1
A=M
M=D+M
@SP
M=M+1
// push constant 3
@3
D=A
@SP
A=M
M=D
@SP
M=M+1
// add
@SP
M=M-1
A=M
D=M
@SP
M=M-1
A=M
M=D+M
@SP
M=M+1
// pop local 2
@1
D=M
@2
D=D+A
@R13
M=D
@SP
M=M-1
A=M
D=M
@R13
A=M
M=D
// goto IF_END2
@Screen.Screen.drawCircle$IF_END2
0;JMP
// label IF_FALSE2
(Screen.Screen.drawCircle$IF_FALSE2)
// push local 2
@1
D=M
@2
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// push constant 2
@2
D=A
@SP
A=M
M=D
@SP
M=M+1
// push local 0
@1
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// push local 1
@1
D=M
@1
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// sub
@SP
M=M-1
A=M
D=M
@SP
M=M-1
A=M
M=D-M
M=-M
@SP
M=M+1
// call Math.multiply 2
@2
D=A
@R13
M=D
@Math.multiply
D=A
@R14
M=D
@L_Screen_409
D=A
@FW__CALL
0;JMP
(L_Screen_409)
// add
@SP
M=M-1
A=M
D=M
@SP
M=M-1
A=M
M=D+M
@SP
M=M+1
// push constant 5
@5
D=A
@SP
A=M
M=D
@SP
M=M+1
// add
@SP
M=M-1
A=M
D=M
@SP
M=M-1
A=M
M=D+M
@SP
M=M+1
// pop local 2
@1
D=M
@2
D=D+A
@R13
M=D
@SP
M=M-1
A=M
D=M
@R13
A=M
M=D
// push local 1
@1
D=M
@1
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// push constant 1
@1
D=A
@SP
A=M
M=D
@SP
M=M+1
// sub
@SP
M=M-1
A=M
D=M
@SP
M=M-1
A=M
M=D-M
M=-M
@SP
M=M+1
// pop local 1
@1
D=M
@1
D=D+A
@R13
M=D
@SP
M=M-1
A=M
D=M
@R13
A=M
M=D
// label IF_END2
(Screen.Screen.drawCircle$IF_END2)
// push local 0
@1
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// push constant 1
@1
D=A
@SP
A=M
M=D
@SP
M=M+1
// add
@SP
M=M-1
A=M
D=M
@SP
M=M-1
A=M
M=D+M
@SP
M=M+1
// pop local 0
@1
D=M
@0
D=D+A
@R13
M=D
@SP
M=M-1
A=M
D=M
@R13
A=M
M=D
// push argument 0
@2
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// push argument 1
@2
D=M
@1
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// push local 0
@1
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// push local 1
@1
D=M
@1
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// call Screen.drawSymetric 4
@4
D=A
@R13
M=D
@Screen.drawSymetric
D=A
@R14
M=D
@L_Screen_410
D=A
@FW__CALL
0;JMP
(L_Screen_410)
// pop temp 0
@SP
M=M-1
A=M
D=M
@5
M=D
// goto WHILE_EXP0
@Screen.Screen.drawCircle$WHILE_EXP0
0;JMP
// label WHILE_END0
(Screen.Screen.drawCircle$WHILE_END0)
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// return
@FW__RETURN
0;JMP
// 
// function String.new 0
(String.new)
// push constant 3
@3
D=A
@SP
A=M
M=D
@SP
M=M+1
// call Memory.alloc 1
@1
D=A
@R13
M=D
@Memory.alloc
D=A
@R14
M=D
@L_String_411
D=A
@FW__CALL
0;JMP
(L_String_411)
// pop pointer 0
@SP
M=M-1
A=M
D=M
@3
M=D
// push argument 0
@2
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// lt
@SP
M=M-1
A=M
D=M
@SP
M=M-1
A=M
D=D-M
@L_String_412
D;JLE
D=-1
@L_String_413
D;JMP
(L_String_412)
D=0
(L_String_413)
@SP
A=M
M=D
@SP
M=M+1
// if-goto IF_TRUE0
@SP
M=M-1
A=M
D=M
@String.String.new$IF_TRUE0
D;JNE
// goto IF_FALSE0
@String.String.new$IF_FALSE0
0;JMP
// label IF_TRUE0
(String.String.new$IF_TRUE0)
// push constant 14
@14
D=A
@SP
A=M
M=D
@SP
M=M+1
// call Sys.error 1
@1
D=A
@R13
M=D
@Sys.error
D=A
@R14
M=D
@L_String_414
D=A
@FW__CALL
0;JMP
(L_String_414)
// pop temp 0
@SP
M=M-1
A=M
D=M
@5
M=D
// label IF_FALSE0
(String.String.new$IF_FALSE0)
// push argument 0
@2
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// gt
@SP
M=M-1
A=M
D=M
@SP
M=M-1
A=M
D=D-M
@L_String_415
D;JGE
D=-1
@L_String_416
D;JMP
(L_String_415)
D=0
(L_String_416)
@SP
A=M
M=D
@SP
M=M+1
// if-goto IF_TRUE1
@SP
M=M-1
A=M
D=M
@String.String.new$IF_TRUE1
D;JNE
// goto IF_FALSE1
@String.String.new$IF_FALSE1
0;JMP
// label IF_TRUE1
(String.String.new$IF_TRUE1)
// push argument 0
@2
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// call Array.new 1
@1
D=A
@R13
M=D
@Array.new
D=A
@R14
M=D
@L_String_417
D=A
@FW__CALL
0;JMP
(L_String_417)
// pop this 1
@3
D=M
@1
D=D+A
@R13
M=D
@SP
M=M-1
A=M
D=M
@R13
A=M
M=D
// label IF_FALSE1
(String.String.new$IF_FALSE1)
// push argument 0
@2
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// pop this 0
@3
D=M
@0
D=D+A
@R13
M=D
@SP
M=M-1
A=M
D=M
@R13
A=M
M=D
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// pop this 2
@3
D=M
@2
D=D+A
@R13
M=D
@SP
M=M-1
A=M
D=M
@R13
A=M
M=D
// push pointer 0
@3
D=M
@SP
A=M
M=D
@SP
M=M+1
// return
@FW__RETURN
0;JMP
// function String.dispose 0
(String.dispose)
// push argument 0
@2
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// pop pointer 0
@SP
M=M-1
A=M
D=M
@3
M=D
// push this 0
@THIS
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// gt
@SP
M=M-1
A=M
D=M
@SP
M=M-1
A=M
D=D-M
@L_String_418
D;JGE
D=-1
@L_String_419
D;JMP
(L_String_418)
D=0
(L_String_419)
@SP
A=M
M=D
@SP
M=M+1
// if-goto IF_TRUE0
@SP
M=M-1
A=M
D=M
@String.String.dispose$IF_TRUE0
D;JNE
// goto IF_FALSE0
@String.String.dispose$IF_FALSE0
0;JMP
// label IF_TRUE0
(String.String.dispose$IF_TRUE0)
// push this 1
@THIS
D=M
@1
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// call Array.dispose 1
@1
D=A
@R13
M=D
@Array.dispose
D=A
@R14
M=D
@L_String_420
D=A
@FW__CALL
0;JMP
(L_String_420)
// pop temp 0
@SP
M=M-1
A=M
D=M
@5
M=D
// label IF_FALSE0
(String.String.dispose$IF_FALSE0)
// push pointer 0
@3
D=M
@SP
A=M
M=D
@SP
M=M+1
// call Memory.deAlloc 1
@1
D=A
@R13
M=D
@Memory.deAlloc
D=A
@R14
M=D
@L_String_421
D=A
@FW__CALL
0;JMP
(L_String_421)
// pop temp 0
@SP
M=M-1
A=M
D=M
@5
M=D
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// return
@FW__RETURN
0;JMP
// function String.length 0
(String.length)
// push argument 0
@2
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// pop pointer 0
@SP
M=M-1
A=M
D=M
@3
M=D
// push this 2
@THIS
D=M
@2
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// return
@FW__RETURN
0;JMP
// function String.charAt 0
(String.charAt)
// push argument 0
@2
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// pop pointer 0
@SP
M=M-1
A=M
D=M
@3
M=D
// push argument 1
@2
D=M
@1
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// lt
@SP
M=M-1
A=M
D=M
@SP
M=M-1
A=M
D=D-M
@L_String_422
D;JLE
D=-1
@L_String_423
D;JMP
(L_String_422)
D=0
(L_String_423)
@SP
A=M
M=D
@SP
M=M+1
// push argument 1
@2
D=M
@1
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// push this 2
@THIS
D=M
@2
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// gt
@SP
M=M-1
A=M
D=M
@SP
M=M-1
A=M
D=D-M
@L_String_424
D;JGE
D=-1
@L_String_425
D;JMP
(L_String_424)
D=0
(L_String_425)
@SP
A=M
M=D
@SP
M=M+1
// or
@SP
M=M-1
A=M
D=M
@SP
M=M-1
A=M
M=D|M
@SP
M=M+1
// push argument 1
@2
D=M
@1
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// push this 2
@THIS
D=M
@2
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// eq
@SP
M=M-1
A=M
D=M
@SP
M=M-1
A=M
D=D-M
@L_String_426
D;JNE
D=-1
@L_String_427
D;JMP
(L_String_426)
D=0
(L_String_427)
@SP
A=M
M=D
@SP
M=M+1
// or
@SP
M=M-1
A=M
D=M
@SP
M=M-1
A=M
M=D|M
@SP
M=M+1
// if-goto IF_TRUE0
@SP
M=M-1
A=M
D=M
@String.String.charAt$IF_TRUE0
D;JNE
// goto IF_FALSE0
@String.String.charAt$IF_FALSE0
0;JMP
// label IF_TRUE0
(String.String.charAt$IF_TRUE0)
// push constant 15
@15
D=A
@SP
A=M
M=D
@SP
M=M+1
// call Sys.error 1
@1
D=A
@R13
M=D
@Sys.error
D=A
@R14
M=D
@L_String_428
D=A
@FW__CALL
0;JMP
(L_String_428)
// pop temp 0
@SP
M=M-1
A=M
D=M
@5
M=D
// label IF_FALSE0
(String.String.charAt$IF_FALSE0)
// push argument 1
@2
D=M
@1
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// push this 1
@THIS
D=M
@1
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// add
@SP
M=M-1
A=M
D=M
@SP
M=M-1
A=M
M=D+M
@SP
M=M+1
// pop pointer 1
@SP
M=M-1
A=M
D=M
@4
M=D
// push that 0
@THAT
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// return
@FW__RETURN
0;JMP
// function String.setCharAt 0
(String.setCharAt)
// push argument 0
@2
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// pop pointer 0
@SP
M=M-1
A=M
D=M
@3
M=D
// push argument 1
@2
D=M
@1
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// lt
@SP
M=M-1
A=M
D=M
@SP
M=M-1
A=M
D=D-M
@L_String_429
D;JLE
D=-1
@L_String_430
D;JMP
(L_String_429)
D=0
(L_String_430)
@SP
A=M
M=D
@SP
M=M+1
// push argument 1
@2
D=M
@1
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// push this 2
@THIS
D=M
@2
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// gt
@SP
M=M-1
A=M
D=M
@SP
M=M-1
A=M
D=D-M
@L_String_431
D;JGE
D=-1
@L_String_432
D;JMP
(L_String_431)
D=0
(L_String_432)
@SP
A=M
M=D
@SP
M=M+1
// or
@SP
M=M-1
A=M
D=M
@SP
M=M-1
A=M
M=D|M
@SP
M=M+1
// push argument 1
@2
D=M
@1
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// push this 2
@THIS
D=M
@2
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// eq
@SP
M=M-1
A=M
D=M
@SP
M=M-1
A=M
D=D-M
@L_String_433
D;JNE
D=-1
@L_String_434
D;JMP
(L_String_433)
D=0
(L_String_434)
@SP
A=M
M=D
@SP
M=M+1
// or
@SP
M=M-1
A=M
D=M
@SP
M=M-1
A=M
M=D|M
@SP
M=M+1
// if-goto IF_TRUE0
@SP
M=M-1
A=M
D=M
@String.String.setCharAt$IF_TRUE0
D;JNE
// goto IF_FALSE0
@String.String.setCharAt$IF_FALSE0
0;JMP
// label IF_TRUE0
(String.String.setCharAt$IF_TRUE0)
// push constant 16
@16
D=A
@SP
A=M
M=D
@SP
M=M+1
// call Sys.error 1
@1
D=A
@R13
M=D
@Sys.error
D=A
@R14
M=D
@L_String_435
D=A
@FW__CALL
0;JMP
(L_String_435)
// pop temp 0
@SP
M=M-1
A=M
D=M
@5
M=D
// label IF_FALSE0
(String.String.setCharAt$IF_FALSE0)
// push argument 1
@2
D=M
@1
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// push this 1
@THIS
D=M
@1
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// add
@SP
M=M-1
A=M
D=M
@SP
M=M-1
A=M
M=D+M
@SP
M=M+1
// push argument 2
@2
D=M
@2
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// pop temp 0
@SP
M=M-1
A=M
D=M
@5
M=D
// pop pointer 1
@SP
M=M-1
A=M
D=M
@4
M=D
// push temp 0
@5
D=M
@SP
A=M
M=D
@SP
M=M+1
// pop that 0
@4
D=M
@0
D=D+A
@R13
M=D
@SP
M=M-1
A=M
D=M
@R13
A=M
M=D
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// return
@FW__RETURN
0;JMP
// function String.appendChar 0
(String.appendChar)
// push argument 0
@2
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// pop pointer 0
@SP
M=M-1
A=M
D=M
@3
M=D
// push this 2
@THIS
D=M
@2
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// push this 0
@THIS
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// eq
@SP
M=M-1
A=M
D=M
@SP
M=M-1
A=M
D=D-M
@L_String_436
D;JNE
D=-1
@L_String_437
D;JMP
(L_String_436)
D=0
(L_String_437)
@SP
A=M
M=D
@SP
M=M+1
// if-goto IF_TRUE0
@SP
M=M-1
A=M
D=M
@String.String.appendChar$IF_TRUE0
D;JNE
// goto IF_FALSE0
@String.String.appendChar$IF_FALSE0
0;JMP
// label IF_TRUE0
(String.String.appendChar$IF_TRUE0)
// push constant 17
@17
D=A
@SP
A=M
M=D
@SP
M=M+1
// call Sys.error 1
@1
D=A
@R13
M=D
@Sys.error
D=A
@R14
M=D
@L_String_438
D=A
@FW__CALL
0;JMP
(L_String_438)
// pop temp 0
@SP
M=M-1
A=M
D=M
@5
M=D
// label IF_FALSE0
(String.String.appendChar$IF_FALSE0)
// push this 2
@THIS
D=M
@2
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// push this 1
@THIS
D=M
@1
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// add
@SP
M=M-1
A=M
D=M
@SP
M=M-1
A=M
M=D+M
@SP
M=M+1
// push argument 1
@2
D=M
@1
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// pop temp 0
@SP
M=M-1
A=M
D=M
@5
M=D
// pop pointer 1
@SP
M=M-1
A=M
D=M
@4
M=D
// push temp 0
@5
D=M
@SP
A=M
M=D
@SP
M=M+1
// pop that 0
@4
D=M
@0
D=D+A
@R13
M=D
@SP
M=M-1
A=M
D=M
@R13
A=M
M=D
// push this 2
@THIS
D=M
@2
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// push constant 1
@1
D=A
@SP
A=M
M=D
@SP
M=M+1
// add
@SP
M=M-1
A=M
D=M
@SP
M=M-1
A=M
M=D+M
@SP
M=M+1
// pop this 2
@3
D=M
@2
D=D+A
@R13
M=D
@SP
M=M-1
A=M
D=M
@R13
A=M
M=D
// push pointer 0
@3
D=M
@SP
A=M
M=D
@SP
M=M+1
// return
@FW__RETURN
0;JMP
// function String.eraseLastChar 0
(String.eraseLastChar)
// push argument 0
@2
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// pop pointer 0
@SP
M=M-1
A=M
D=M
@3
M=D
// push this 2
@THIS
D=M
@2
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// eq
@SP
M=M-1
A=M
D=M
@SP
M=M-1
A=M
D=D-M
@L_String_439
D;JNE
D=-1
@L_String_440
D;JMP
(L_String_439)
D=0
(L_String_440)
@SP
A=M
M=D
@SP
M=M+1
// if-goto IF_TRUE0
@SP
M=M-1
A=M
D=M
@String.String.eraseLastChar$IF_TRUE0
D;JNE
// goto IF_FALSE0
@String.String.eraseLastChar$IF_FALSE0
0;JMP
// label IF_TRUE0
(String.String.eraseLastChar$IF_TRUE0)
// push constant 18
@18
D=A
@SP
A=M
M=D
@SP
M=M+1
// call Sys.error 1
@1
D=A
@R13
M=D
@Sys.error
D=A
@R14
M=D
@L_String_441
D=A
@FW__CALL
0;JMP
(L_String_441)
// pop temp 0
@SP
M=M-1
A=M
D=M
@5
M=D
// label IF_FALSE0
(String.String.eraseLastChar$IF_FALSE0)
// push this 2
@THIS
D=M
@2
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// push constant 1
@1
D=A
@SP
A=M
M=D
@SP
M=M+1
// sub
@SP
M=M-1
A=M
D=M
@SP
M=M-1
A=M
M=D-M
M=-M
@SP
M=M+1
// pop this 2
@3
D=M
@2
D=D+A
@R13
M=D
@SP
M=M-1
A=M
D=M
@R13
A=M
M=D
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// return
@FW__RETURN
0;JMP
// function String.intValue 5
(String.intValue)
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// push argument 0
@2
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// pop pointer 0
@SP
M=M-1
A=M
D=M
@3
M=D
// push this 2
@THIS
D=M
@2
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// eq
@SP
M=M-1
A=M
D=M
@SP
M=M-1
A=M
D=D-M
@L_String_442
D;JNE
D=-1
@L_String_443
D;JMP
(L_String_442)
D=0
(L_String_443)
@SP
A=M
M=D
@SP
M=M+1
// if-goto IF_TRUE0
@SP
M=M-1
A=M
D=M
@String.String.intValue$IF_TRUE0
D;JNE
// goto IF_FALSE0
@String.String.intValue$IF_FALSE0
0;JMP
// label IF_TRUE0
(String.String.intValue$IF_TRUE0)
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// return
@FW__RETURN
0;JMP
// label IF_FALSE0
(String.String.intValue$IF_FALSE0)
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// not
@SP
M=M-1
A=M
M=!M
@SP
M=M+1
// pop local 3
@1
D=M
@3
D=D+A
@R13
M=D
@SP
M=M-1
A=M
D=M
@R13
A=M
M=D
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// push this 1
@THIS
D=M
@1
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// add
@SP
M=M-1
A=M
D=M
@SP
M=M-1
A=M
M=D+M
@SP
M=M+1
// pop pointer 1
@SP
M=M-1
A=M
D=M
@4
M=D
// push that 0
@THAT
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// push constant 45
@45
D=A
@SP
A=M
M=D
@SP
M=M+1
// eq
@SP
M=M-1
A=M
D=M
@SP
M=M-1
A=M
D=D-M
@L_String_444
D;JNE
D=-1
@L_String_445
D;JMP
(L_String_444)
D=0
(L_String_445)
@SP
A=M
M=D
@SP
M=M+1
// if-goto IF_TRUE1
@SP
M=M-1
A=M
D=M
@String.String.intValue$IF_TRUE1
D;JNE
// goto IF_FALSE1
@String.String.intValue$IF_FALSE1
0;JMP
// label IF_TRUE1
(String.String.intValue$IF_TRUE1)
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// not
@SP
M=M-1
A=M
M=!M
@SP
M=M+1
// pop local 4
@1
D=M
@4
D=D+A
@R13
M=D
@SP
M=M-1
A=M
D=M
@R13
A=M
M=D
// push constant 1
@1
D=A
@SP
A=M
M=D
@SP
M=M+1
// pop local 0
@1
D=M
@0
D=D+A
@R13
M=D
@SP
M=M-1
A=M
D=M
@R13
A=M
M=D
// label IF_FALSE1
(String.String.intValue$IF_FALSE1)
// label WHILE_EXP0
(String.String.intValue$WHILE_EXP0)
// push local 0
@1
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// push this 2
@THIS
D=M
@2
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// lt
@SP
M=M-1
A=M
D=M
@SP
M=M-1
A=M
D=D-M
@L_String_446
D;JLE
D=-1
@L_String_447
D;JMP
(L_String_446)
D=0
(L_String_447)
@SP
A=M
M=D
@SP
M=M+1
// push local 3
@1
D=M
@3
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// and
@SP
M=M-1
A=M
D=M
@SP
M=M-1
A=M
M=D&M
@SP
M=M+1
// not
@SP
M=M-1
A=M
M=!M
@SP
M=M+1
// if-goto WHILE_END0
@SP
M=M-1
A=M
D=M
@String.String.intValue$WHILE_END0
D;JNE
// push local 0
@1
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// push this 1
@THIS
D=M
@1
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// add
@SP
M=M-1
A=M
D=M
@SP
M=M-1
A=M
M=D+M
@SP
M=M+1
// pop pointer 1
@SP
M=M-1
A=M
D=M
@4
M=D
// push that 0
@THAT
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// push constant 48
@48
D=A
@SP
A=M
M=D
@SP
M=M+1
// sub
@SP
M=M-1
A=M
D=M
@SP
M=M-1
A=M
M=D-M
M=-M
@SP
M=M+1
// pop local 2
@1
D=M
@2
D=D+A
@R13
M=D
@SP
M=M-1
A=M
D=M
@R13
A=M
M=D
// push local 2
@1
D=M
@2
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// lt
@SP
M=M-1
A=M
D=M
@SP
M=M-1
A=M
D=D-M
@L_String_448
D;JLE
D=-1
@L_String_449
D;JMP
(L_String_448)
D=0
(L_String_449)
@SP
A=M
M=D
@SP
M=M+1
// push local 2
@1
D=M
@2
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// push constant 9
@9
D=A
@SP
A=M
M=D
@SP
M=M+1
// gt
@SP
M=M-1
A=M
D=M
@SP
M=M-1
A=M
D=D-M
@L_String_450
D;JGE
D=-1
@L_String_451
D;JMP
(L_String_450)
D=0
(L_String_451)
@SP
A=M
M=D
@SP
M=M+1
// or
@SP
M=M-1
A=M
D=M
@SP
M=M-1
A=M
M=D|M
@SP
M=M+1
// not
@SP
M=M-1
A=M
M=!M
@SP
M=M+1
// pop local 3
@1
D=M
@3
D=D+A
@R13
M=D
@SP
M=M-1
A=M
D=M
@R13
A=M
M=D
// push local 3
@1
D=M
@3
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// if-goto IF_TRUE2
@SP
M=M-1
A=M
D=M
@String.String.intValue$IF_TRUE2
D;JNE
// goto IF_FALSE2
@String.String.intValue$IF_FALSE2
0;JMP
// label IF_TRUE2
(String.String.intValue$IF_TRUE2)
// push local 1
@1
D=M
@1
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// push constant 10
@10
D=A
@SP
A=M
M=D
@SP
M=M+1
// call Math.multiply 2
@2
D=A
@R13
M=D
@Math.multiply
D=A
@R14
M=D
@L_String_452
D=A
@FW__CALL
0;JMP
(L_String_452)
// push local 2
@1
D=M
@2
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// add
@SP
M=M-1
A=M
D=M
@SP
M=M-1
A=M
M=D+M
@SP
M=M+1
// pop local 1
@1
D=M
@1
D=D+A
@R13
M=D
@SP
M=M-1
A=M
D=M
@R13
A=M
M=D
// push local 0
@1
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// push constant 1
@1
D=A
@SP
A=M
M=D
@SP
M=M+1
// add
@SP
M=M-1
A=M
D=M
@SP
M=M-1
A=M
M=D+M
@SP
M=M+1
// pop local 0
@1
D=M
@0
D=D+A
@R13
M=D
@SP
M=M-1
A=M
D=M
@R13
A=M
M=D
// label IF_FALSE2
(String.String.intValue$IF_FALSE2)
// goto WHILE_EXP0
@String.String.intValue$WHILE_EXP0
0;JMP
// label WHILE_END0
(String.String.intValue$WHILE_END0)
// push local 4
@1
D=M
@4
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// if-goto IF_TRUE3
@SP
M=M-1
A=M
D=M
@String.String.intValue$IF_TRUE3
D;JNE
// goto IF_FALSE3
@String.String.intValue$IF_FALSE3
0;JMP
// label IF_TRUE3
(String.String.intValue$IF_TRUE3)
// push local 1
@1
D=M
@1
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// neg
@SP
M=M-1
A=M
M=-M
@SP
M=M+1
// pop local 1
@1
D=M
@1
D=D+A
@R13
M=D
@SP
M=M-1
A=M
D=M
@R13
A=M
M=D
// label IF_FALSE3
(String.String.intValue$IF_FALSE3)
// push local 1
@1
D=M
@1
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// return
@FW__RETURN
0;JMP
// function String.setInt 4
(String.setInt)
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// push argument 0
@2
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// pop pointer 0
@SP
M=M-1
A=M
D=M
@3
M=D
// push this 0
@THIS
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// eq
@SP
M=M-1
A=M
D=M
@SP
M=M-1
A=M
D=D-M
@L_String_453
D;JNE
D=-1
@L_String_454
D;JMP
(L_String_453)
D=0
(L_String_454)
@SP
A=M
M=D
@SP
M=M+1
// if-goto IF_TRUE0
@SP
M=M-1
A=M
D=M
@String.String.setInt$IF_TRUE0
D;JNE
// goto IF_FALSE0
@String.String.setInt$IF_FALSE0
0;JMP
// label IF_TRUE0
(String.String.setInt$IF_TRUE0)
// push constant 19
@19
D=A
@SP
A=M
M=D
@SP
M=M+1
// call Sys.error 1
@1
D=A
@R13
M=D
@Sys.error
D=A
@R14
M=D
@L_String_455
D=A
@FW__CALL
0;JMP
(L_String_455)
// pop temp 0
@SP
M=M-1
A=M
D=M
@5
M=D
// label IF_FALSE0
(String.String.setInt$IF_FALSE0)
// push constant 6
@6
D=A
@SP
A=M
M=D
@SP
M=M+1
// call Array.new 1
@1
D=A
@R13
M=D
@Array.new
D=A
@R14
M=D
@L_String_456
D=A
@FW__CALL
0;JMP
(L_String_456)
// pop local 2
@1
D=M
@2
D=D+A
@R13
M=D
@SP
M=M-1
A=M
D=M
@R13
A=M
M=D
// push argument 1
@2
D=M
@1
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// lt
@SP
M=M-1
A=M
D=M
@SP
M=M-1
A=M
D=D-M
@L_String_457
D;JLE
D=-1
@L_String_458
D;JMP
(L_String_457)
D=0
(L_String_458)
@SP
A=M
M=D
@SP
M=M+1
// if-goto IF_TRUE1
@SP
M=M-1
A=M
D=M
@String.String.setInt$IF_TRUE1
D;JNE
// goto IF_FALSE1
@String.String.setInt$IF_FALSE1
0;JMP
// label IF_TRUE1
(String.String.setInt$IF_TRUE1)
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// not
@SP
M=M-1
A=M
M=!M
@SP
M=M+1
// pop local 3
@1
D=M
@3
D=D+A
@R13
M=D
@SP
M=M-1
A=M
D=M
@R13
A=M
M=D
// push argument 1
@2
D=M
@1
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// neg
@SP
M=M-1
A=M
M=-M
@SP
M=M+1
// pop argument 1
@2
D=M
@1
D=D+A
@R13
M=D
@SP
M=M-1
A=M
D=M
@R13
A=M
M=D
// label IF_FALSE1
(String.String.setInt$IF_FALSE1)
// push argument 1
@2
D=M
@1
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// pop local 1
@1
D=M
@1
D=D+A
@R13
M=D
@SP
M=M-1
A=M
D=M
@R13
A=M
M=D
// label WHILE_EXP0
(String.String.setInt$WHILE_EXP0)
// push local 1
@1
D=M
@1
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// gt
@SP
M=M-1
A=M
D=M
@SP
M=M-1
A=M
D=D-M
@L_String_459
D;JGE
D=-1
@L_String_460
D;JMP
(L_String_459)
D=0
(L_String_460)
@SP
A=M
M=D
@SP
M=M+1
// not
@SP
M=M-1
A=M
M=!M
@SP
M=M+1
// if-goto WHILE_END0
@SP
M=M-1
A=M
D=M
@String.String.setInt$WHILE_END0
D;JNE
// push argument 1
@2
D=M
@1
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// push constant 10
@10
D=A
@SP
A=M
M=D
@SP
M=M+1
// call Math.divide 2
@2
D=A
@R13
M=D
@Math.divide
D=A
@R14
M=D
@L_String_461
D=A
@FW__CALL
0;JMP
(L_String_461)
// pop local 1
@1
D=M
@1
D=D+A
@R13
M=D
@SP
M=M-1
A=M
D=M
@R13
A=M
M=D
// push local 0
@1
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// push local 2
@1
D=M
@2
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// add
@SP
M=M-1
A=M
D=M
@SP
M=M-1
A=M
M=D+M
@SP
M=M+1
// push constant 48
@48
D=A
@SP
A=M
M=D
@SP
M=M+1
// push argument 1
@2
D=M
@1
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// push local 1
@1
D=M
@1
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// push constant 10
@10
D=A
@SP
A=M
M=D
@SP
M=M+1
// call Math.multiply 2
@2
D=A
@R13
M=D
@Math.multiply
D=A
@R14
M=D
@L_String_462
D=A
@FW__CALL
0;JMP
(L_String_462)
// sub
@SP
M=M-1
A=M
D=M
@SP
M=M-1
A=M
M=D-M
M=-M
@SP
M=M+1
// add
@SP
M=M-1
A=M
D=M
@SP
M=M-1
A=M
M=D+M
@SP
M=M+1
// pop temp 0
@SP
M=M-1
A=M
D=M
@5
M=D
// pop pointer 1
@SP
M=M-1
A=M
D=M
@4
M=D
// push temp 0
@5
D=M
@SP
A=M
M=D
@SP
M=M+1
// pop that 0
@4
D=M
@0
D=D+A
@R13
M=D
@SP
M=M-1
A=M
D=M
@R13
A=M
M=D
// push local 0
@1
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// push constant 1
@1
D=A
@SP
A=M
M=D
@SP
M=M+1
// add
@SP
M=M-1
A=M
D=M
@SP
M=M-1
A=M
M=D+M
@SP
M=M+1
// pop local 0
@1
D=M
@0
D=D+A
@R13
M=D
@SP
M=M-1
A=M
D=M
@R13
A=M
M=D
// push local 1
@1
D=M
@1
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// pop argument 1
@2
D=M
@1
D=D+A
@R13
M=D
@SP
M=M-1
A=M
D=M
@R13
A=M
M=D
// goto WHILE_EXP0
@String.String.setInt$WHILE_EXP0
0;JMP
// label WHILE_END0
(String.String.setInt$WHILE_END0)
// push local 3
@1
D=M
@3
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// if-goto IF_TRUE2
@SP
M=M-1
A=M
D=M
@String.String.setInt$IF_TRUE2
D;JNE
// goto IF_FALSE2
@String.String.setInt$IF_FALSE2
0;JMP
// label IF_TRUE2
(String.String.setInt$IF_TRUE2)
// push local 0
@1
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// push local 2
@1
D=M
@2
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// add
@SP
M=M-1
A=M
D=M
@SP
M=M-1
A=M
M=D+M
@SP
M=M+1
// push constant 45
@45
D=A
@SP
A=M
M=D
@SP
M=M+1
// pop temp 0
@SP
M=M-1
A=M
D=M
@5
M=D
// pop pointer 1
@SP
M=M-1
A=M
D=M
@4
M=D
// push temp 0
@5
D=M
@SP
A=M
M=D
@SP
M=M+1
// pop that 0
@4
D=M
@0
D=D+A
@R13
M=D
@SP
M=M-1
A=M
D=M
@R13
A=M
M=D
// push local 0
@1
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// push constant 1
@1
D=A
@SP
A=M
M=D
@SP
M=M+1
// add
@SP
M=M-1
A=M
D=M
@SP
M=M-1
A=M
M=D+M
@SP
M=M+1
// pop local 0
@1
D=M
@0
D=D+A
@R13
M=D
@SP
M=M-1
A=M
D=M
@R13
A=M
M=D
// label IF_FALSE2
(String.String.setInt$IF_FALSE2)
// push this 0
@THIS
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// push local 0
@1
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// lt
@SP
M=M-1
A=M
D=M
@SP
M=M-1
A=M
D=D-M
@L_String_463
D;JLE
D=-1
@L_String_464
D;JMP
(L_String_463)
D=0
(L_String_464)
@SP
A=M
M=D
@SP
M=M+1
// if-goto IF_TRUE3
@SP
M=M-1
A=M
D=M
@String.String.setInt$IF_TRUE3
D;JNE
// goto IF_FALSE3
@String.String.setInt$IF_FALSE3
0;JMP
// label IF_TRUE3
(String.String.setInt$IF_TRUE3)
// push constant 19
@19
D=A
@SP
A=M
M=D
@SP
M=M+1
// call Sys.error 1
@1
D=A
@R13
M=D
@Sys.error
D=A
@R14
M=D
@L_String_465
D=A
@FW__CALL
0;JMP
(L_String_465)
// pop temp 0
@SP
M=M-1
A=M
D=M
@5
M=D
// label IF_FALSE3
(String.String.setInt$IF_FALSE3)
// push local 0
@1
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// eq
@SP
M=M-1
A=M
D=M
@SP
M=M-1
A=M
D=D-M
@L_String_466
D;JNE
D=-1
@L_String_467
D;JMP
(L_String_466)
D=0
(L_String_467)
@SP
A=M
M=D
@SP
M=M+1
// if-goto IF_TRUE4
@SP
M=M-1
A=M
D=M
@String.String.setInt$IF_TRUE4
D;JNE
// goto IF_FALSE4
@String.String.setInt$IF_FALSE4
0;JMP
// label IF_TRUE4
(String.String.setInt$IF_TRUE4)
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// push this 1
@THIS
D=M
@1
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// add
@SP
M=M-1
A=M
D=M
@SP
M=M-1
A=M
M=D+M
@SP
M=M+1
// push constant 48
@48
D=A
@SP
A=M
M=D
@SP
M=M+1
// pop temp 0
@SP
M=M-1
A=M
D=M
@5
M=D
// pop pointer 1
@SP
M=M-1
A=M
D=M
@4
M=D
// push temp 0
@5
D=M
@SP
A=M
M=D
@SP
M=M+1
// pop that 0
@4
D=M
@0
D=D+A
@R13
M=D
@SP
M=M-1
A=M
D=M
@R13
A=M
M=D
// push constant 1
@1
D=A
@SP
A=M
M=D
@SP
M=M+1
// pop this 2
@3
D=M
@2
D=D+A
@R13
M=D
@SP
M=M-1
A=M
D=M
@R13
A=M
M=D
// goto IF_END4
@String.String.setInt$IF_END4
0;JMP
// label IF_FALSE4
(String.String.setInt$IF_FALSE4)
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// pop this 2
@3
D=M
@2
D=D+A
@R13
M=D
@SP
M=M-1
A=M
D=M
@R13
A=M
M=D
// label WHILE_EXP1
(String.String.setInt$WHILE_EXP1)
// push this 2
@THIS
D=M
@2
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// push local 0
@1
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// lt
@SP
M=M-1
A=M
D=M
@SP
M=M-1
A=M
D=D-M
@L_String_468
D;JLE
D=-1
@L_String_469
D;JMP
(L_String_468)
D=0
(L_String_469)
@SP
A=M
M=D
@SP
M=M+1
// not
@SP
M=M-1
A=M
M=!M
@SP
M=M+1
// if-goto WHILE_END1
@SP
M=M-1
A=M
D=M
@String.String.setInt$WHILE_END1
D;JNE
// push this 2
@THIS
D=M
@2
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// push this 1
@THIS
D=M
@1
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// add
@SP
M=M-1
A=M
D=M
@SP
M=M-1
A=M
M=D+M
@SP
M=M+1
// push local 0
@1
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// push this 2
@THIS
D=M
@2
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// push constant 1
@1
D=A
@SP
A=M
M=D
@SP
M=M+1
// add
@SP
M=M-1
A=M
D=M
@SP
M=M-1
A=M
M=D+M
@SP
M=M+1
// sub
@SP
M=M-1
A=M
D=M
@SP
M=M-1
A=M
M=D-M
M=-M
@SP
M=M+1
// push local 2
@1
D=M
@2
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// add
@SP
M=M-1
A=M
D=M
@SP
M=M-1
A=M
M=D+M
@SP
M=M+1
// pop pointer 1
@SP
M=M-1
A=M
D=M
@4
M=D
// push that 0
@THAT
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// pop temp 0
@SP
M=M-1
A=M
D=M
@5
M=D
// pop pointer 1
@SP
M=M-1
A=M
D=M
@4
M=D
// push temp 0
@5
D=M
@SP
A=M
M=D
@SP
M=M+1
// pop that 0
@4
D=M
@0
D=D+A
@R13
M=D
@SP
M=M-1
A=M
D=M
@R13
A=M
M=D
// push this 2
@THIS
D=M
@2
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// push constant 1
@1
D=A
@SP
A=M
M=D
@SP
M=M+1
// add
@SP
M=M-1
A=M
D=M
@SP
M=M-1
A=M
M=D+M
@SP
M=M+1
// pop this 2
@3
D=M
@2
D=D+A
@R13
M=D
@SP
M=M-1
A=M
D=M
@R13
A=M
M=D
// goto WHILE_EXP1
@String.String.setInt$WHILE_EXP1
0;JMP
// label WHILE_END1
(String.String.setInt$WHILE_END1)
// label IF_END4
(String.String.setInt$IF_END4)
// push local 2
@1
D=M
@2
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// call Array.dispose 1
@1
D=A
@R13
M=D
@Array.dispose
D=A
@R14
M=D
@L_String_470
D=A
@FW__CALL
0;JMP
(L_String_470)
// pop temp 0
@SP
M=M-1
A=M
D=M
@5
M=D
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// return
@FW__RETURN
0;JMP
// function String.newLine 0
(String.newLine)
// push constant 128
@128
D=A
@SP
A=M
M=D
@SP
M=M+1
// return
@FW__RETURN
0;JMP
// function String.backSpace 0
(String.backSpace)
// push constant 129
@129
D=A
@SP
A=M
M=D
@SP
M=M+1
// return
@FW__RETURN
0;JMP
// function String.doubleQuote 0
(String.doubleQuote)
// push constant 34
@34
D=A
@SP
A=M
M=D
@SP
M=M+1
// return
@FW__RETURN
0;JMP
// 
// function Sys.init 0
(Sys.init)
// call Memory.init 0
@0
D=A
@R13
M=D
@Memory.init
D=A
@R14
M=D
@L_Sys_471
D=A
@FW__CALL
0;JMP
(L_Sys_471)
// pop temp 0
@SP
M=M-1
A=M
D=M
@5
M=D
// call Math.init 0
@0
D=A
@R13
M=D
@Math.init
D=A
@R14
M=D
@L_Sys_472
D=A
@FW__CALL
0;JMP
(L_Sys_472)
// pop temp 0
@SP
M=M-1
A=M
D=M
@5
M=D
// call Screen.init 0
@0
D=A
@R13
M=D
@Screen.init
D=A
@R14
M=D
@L_Sys_473
D=A
@FW__CALL
0;JMP
(L_Sys_473)
// pop temp 0
@SP
M=M-1
A=M
D=M
@5
M=D
// call Output.init 0
@0
D=A
@R13
M=D
@Output.init
D=A
@R14
M=D
@L_Sys_474
D=A
@FW__CALL
0;JMP
(L_Sys_474)
// pop temp 0
@SP
M=M-1
A=M
D=M
@5
M=D
// call Keyboard.init 0
@0
D=A
@R13
M=D
@Keyboard.init
D=A
@R14
M=D
@L_Sys_475
D=A
@FW__CALL
0;JMP
(L_Sys_475)
// pop temp 0
@SP
M=M-1
A=M
D=M
@5
M=D
// call Main.main 0
@0
D=A
@R13
M=D
@Main.main
D=A
@R14
M=D
@L_Sys_476
D=A
@FW__CALL
0;JMP
(L_Sys_476)
// pop temp 0
@SP
M=M-1
A=M
D=M
@5
M=D
// call Sys.halt 0
@0
D=A
@R13
M=D
@Sys.halt
D=A
@R14
M=D
@L_Sys_477
D=A
@FW__CALL
0;JMP
(L_Sys_477)
// pop temp 0
@SP
M=M-1
A=M
D=M
@5
M=D
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// return
@FW__RETURN
0;JMP
// function Sys.halt 0
(Sys.halt)
// label WHILE_EXP0
(Sys.Sys.halt$WHILE_EXP0)
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// not
@SP
M=M-1
A=M
M=!M
@SP
M=M+1
// not
@SP
M=M-1
A=M
M=!M
@SP
M=M+1
// if-goto WHILE_END0
@SP
M=M-1
A=M
D=M
@Sys.Sys.halt$WHILE_END0
D;JNE
// goto WHILE_EXP0
@Sys.Sys.halt$WHILE_EXP0
0;JMP
// label WHILE_END0
(Sys.Sys.halt$WHILE_END0)
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// return
@FW__RETURN
0;JMP
// function Sys.wait 1
(Sys.wait)
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// push argument 0
@2
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// lt
@SP
M=M-1
A=M
D=M
@SP
M=M-1
A=M
D=D-M
@L_Sys_478
D;JLE
D=-1
@L_Sys_479
D;JMP
(L_Sys_478)
D=0
(L_Sys_479)
@SP
A=M
M=D
@SP
M=M+1
// if-goto IF_TRUE0
@SP
M=M-1
A=M
D=M
@Sys.Sys.wait$IF_TRUE0
D;JNE
// goto IF_FALSE0
@Sys.Sys.wait$IF_FALSE0
0;JMP
// label IF_TRUE0
(Sys.Sys.wait$IF_TRUE0)
// push constant 1
@1
D=A
@SP
A=M
M=D
@SP
M=M+1
// call Sys.error 1
@1
D=A
@R13
M=D
@Sys.error
D=A
@R14
M=D
@L_Sys_480
D=A
@FW__CALL
0;JMP
(L_Sys_480)
// pop temp 0
@SP
M=M-1
A=M
D=M
@5
M=D
// label IF_FALSE0
(Sys.Sys.wait$IF_FALSE0)
// label WHILE_EXP0
(Sys.Sys.wait$WHILE_EXP0)
// push argument 0
@2
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// gt
@SP
M=M-1
A=M
D=M
@SP
M=M-1
A=M
D=D-M
@L_Sys_481
D;JGE
D=-1
@L_Sys_482
D;JMP
(L_Sys_481)
D=0
(L_Sys_482)
@SP
A=M
M=D
@SP
M=M+1
// not
@SP
M=M-1
A=M
M=!M
@SP
M=M+1
// if-goto WHILE_END0
@SP
M=M-1
A=M
D=M
@Sys.Sys.wait$WHILE_END0
D;JNE
// push constant 50
@50
D=A
@SP
A=M
M=D
@SP
M=M+1
// pop local 0
@1
D=M
@0
D=D+A
@R13
M=D
@SP
M=M-1
A=M
D=M
@R13
A=M
M=D
// label WHILE_EXP1
(Sys.Sys.wait$WHILE_EXP1)
// push local 0
@1
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// gt
@SP
M=M-1
A=M
D=M
@SP
M=M-1
A=M
D=D-M
@L_Sys_483
D;JGE
D=-1
@L_Sys_484
D;JMP
(L_Sys_483)
D=0
(L_Sys_484)
@SP
A=M
M=D
@SP
M=M+1
// not
@SP
M=M-1
A=M
M=!M
@SP
M=M+1
// if-goto WHILE_END1
@SP
M=M-1
A=M
D=M
@Sys.Sys.wait$WHILE_END1
D;JNE
// push local 0
@1
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// push constant 1
@1
D=A
@SP
A=M
M=D
@SP
M=M+1
// sub
@SP
M=M-1
A=M
D=M
@SP
M=M-1
A=M
M=D-M
M=-M
@SP
M=M+1
// pop local 0
@1
D=M
@0
D=D+A
@R13
M=D
@SP
M=M-1
A=M
D=M
@R13
A=M
M=D
// goto WHILE_EXP1
@Sys.Sys.wait$WHILE_EXP1
0;JMP
// label WHILE_END1
(Sys.Sys.wait$WHILE_END1)
// push argument 0
@2
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// push constant 1
@1
D=A
@SP
A=M
M=D
@SP
M=M+1
// sub
@SP
M=M-1
A=M
D=M
@SP
M=M-1
A=M
M=D-M
M=-M
@SP
M=M+1
// pop argument 0
@2
D=M
@0
D=D+A
@R13
M=D
@SP
M=M-1
A=M
D=M
@R13
A=M
M=D
// goto WHILE_EXP0
@Sys.Sys.wait$WHILE_EXP0
0;JMP
// label WHILE_END0
(Sys.Sys.wait$WHILE_END0)
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// return
@FW__RETURN
0;JMP
// function Sys.error 0
(Sys.error)
// push constant 69
@69
D=A
@SP
A=M
M=D
@SP
M=M+1
// call Output.printChar 1
@1
D=A
@R13
M=D
@Output.printChar
D=A
@R14
M=D
@L_Sys_485
D=A
@FW__CALL
0;JMP
(L_Sys_485)
// pop temp 0
@SP
M=M-1
A=M
D=M
@5
M=D
// push constant 82
@82
D=A
@SP
A=M
M=D
@SP
M=M+1
// call Output.printChar 1
@1
D=A
@R13
M=D
@Output.printChar
D=A
@R14
M=D
@L_Sys_486
D=A
@FW__CALL
0;JMP
(L_Sys_486)
// pop temp 0
@SP
M=M-1
A=M
D=M
@5
M=D
// push constant 82
@82
D=A
@SP
A=M
M=D
@SP
M=M+1
// call Output.printChar 1
@1
D=A
@R13
M=D
@Output.printChar
D=A
@R14
M=D
@L_Sys_487
D=A
@FW__CALL
0;JMP
(L_Sys_487)
// pop temp 0
@SP
M=M-1
A=M
D=M
@5
M=D
// push argument 0
@2
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// call Output.printInt 1
@1
D=A
@R13
M=D
@Output.printInt
D=A
@R14
M=D
@L_Sys_488
D=A
@FW__CALL
0;JMP
(L_Sys_488)
// pop temp 0
@SP
M=M-1
A=M
D=M
@5
M=D
// call Sys.halt 0
@0
D=A
@R13
M=D
@Sys.halt
D=A
@R14
M=D
@L_Sys_489
D=A
@FW__CALL
0;JMP
(L_Sys_489)
// pop temp 0
@SP
M=M-1
A=M
D=M
@5
M=D
// push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// return
@FW__RETURN
0;JMP
// 