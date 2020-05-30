// Program: sum1ToN.asm
// Computes RAM[1] = 1+2+3+...+n
// Usage: put a number (n) to RAM[0]

// ----------------
// while i < n:
//  sum = sum + i
//  i ++

// ----------------
// n = R0
// i = 1
// sum = 0

// Loop: 
// if i > n goto STOP
// sum = sum + i
// i = i + 1

// STOP:
// R1 = sum

@R0
D = M
@n
M = D // n = RAM[0]
@i
M = 1 // i = 1
@sum
M = 0 // sum = 0

(LOOP)
@i
D = M
@n
D = D - M
@STOP
D;JGT  // if i > n, goto STOP

@sum
D = M 
@i
D = D + M // D = sum + 1
@sum
M = D // M = D = sum + 1

@i
M = M + 1 // i = i + 1

@LOOP
0;JMP

(STOP)
@sum
D = M
@R1
M = D // RAM[1] = sum

(END)
@END
0;JMP