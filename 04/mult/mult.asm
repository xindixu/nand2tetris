// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Mult.asm

// Multiplies R0 and R1 and stores the result in R2.
// (R0, R1, R2 refer to RAM[0], RAM[1], and RAM[2], respectively.)

// Put your code here.

// i = 0
// n = 4
// while(i < n){
//   mult = mult + inc
//   i ++ 
// }

// n = R0
// inc = R1
// i = 0
// R2 = 0

// LOOP:
// if i >= n, goto END
// mult = mult + inc
// i = i + 1
// goto LOOP

@R0
D = M
@n
M = D

@R1
D = M
@inc
M = D

@R2
M = 0
@i
M = 0

(LOOP)
// if i > n, goto END
// i > n => i - n > 0
@i
D = M
@n
D = D - M
@END
D;JGE

// mult = mult + inc
@inc
D = M
@R2
M = D + M 

// i = i + 1
@i
M = M + 1

@LOOP
0;JMP

(END)
@END
0;JMP