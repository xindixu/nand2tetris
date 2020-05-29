// Program: add2
// Computes: RAM[2] = RAM[1] + RAM[0]
// Usage: put values in RAM[0] and RAM[1]
@R0			// A = 0, M = RAM[0]
D = M   // D = RAM[0]

@R1			// A = 1, M = RAM[1]
D = D + M // D = RAM[0] + RAM[1]

@R2      // A = 2, M = RAM[2]
M = D   // RAM[2] = D = RAM[0] + RAM[1]

@R6      // end with infinate loop
0;JMP