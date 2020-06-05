// push constant 7
@7
D = A

@SP
A = M
M = D
@SP
M = M + 1

// push constant 8
@8
D = A

@SP
A = M
M = D
@SP
M = M + 1

// add
@SP
M = M - 1
A = M
D = M
@R10
M = D

@SP
M = M - 1
A = M
D = M
@R11
M = D


@R10
D = M
@R11
D = D + M

@SP
A = M
M = D
@SP
M = M + 1

(END)
@END
0;JMP
