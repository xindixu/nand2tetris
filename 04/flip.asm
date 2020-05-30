// Program: Flip.asm
// flips the vales of RAM[0] and RAM[1]

// temp = R1
// R1 = R0
// R0 = temp

@R1    // A = 1
D = M  // D = RAM[1]
@temp  // point to register temp, A = temp, M = RAM[temp]
M = D  // temp = D = RAM[1]

@R0
D = M  // M = RAM[0]
@R1
M = D  // M = RAM[1] = D = RAM[0]

@temp
D = M  // M = temp
@R0
M = D  // M = RAM[0] = D = temp

(END)
@END
0;JMP
