// Program: fillArray.asm
// Usage: put address of arr at RAM[0] and length of the arr at RAM[1]

// arr: array address, n: length of array
@R0
D = M
@arr
M = D

@R1
D = M
@n 
M = D

// i = 0
@i
M = 0

(LOOP)
// if i == n, goto END
@i
D = M
@n
D = M - D; 
@END
D;JEQ  // if D == 0, jump to END

// get address of an element in arr
// A = arr + i
@arr
D = M
@i
A = D + M  // D = RAM[arr] + RAM[i] = array address + i
M = -1   // M = RAM[A] = -1

// i ++
@i
M = M + 1

@LOOP
0;JMP

(END)
@END
0;JMP