// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/6/add/Add.asm

// Computes R0 = 2 + 3  (R0 refers to RAM[0])
@2
D=A
@x
M=D
@POOP
D;JLT
@3
D=A
@y
M=D
(POOP)
(HALT)
@HALT
D;JMP


