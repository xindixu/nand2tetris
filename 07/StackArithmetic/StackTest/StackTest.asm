
// push constant 17
@17
D = A

@SP
A = M
M = D
@SP
M = M + 1

// push constant 17
@17
D = A

@SP
A = M
M = D
@SP
M = M + 1

// eq
@SP
AM = M - 1
D = M
@R13
M = D

@SP
AM = M - 1
D = M
@R14
M = D


@R13
D = M
@R14
D = M - D

@FALSE0
D;JNE

D = -1
@SP
A = M
M = D
@SP
M = M + 1


@CONTINUE0
0;JMP

(FALSE0)
D = 0
@SP
A = M
M = D
@SP
M = M + 1

(CONTINUE0)

// push constant 17
@17
D = A

@SP
A = M
M = D
@SP
M = M + 1

// push constant 16
@16
D = A

@SP
A = M
M = D
@SP
M = M + 1

// eq
@SP
AM = M - 1
D = M
@R13
M = D

@SP
AM = M - 1
D = M
@R14
M = D


@R13
D = M
@R14
D = M - D

@FALSE1
D;JNE

D = -1
@SP
A = M
M = D
@SP
M = M + 1


@CONTINUE1
0;JMP

(FALSE1)
D = 0
@SP
A = M
M = D
@SP
M = M + 1

(CONTINUE1)

// push constant 16
@16
D = A

@SP
A = M
M = D
@SP
M = M + 1

// push constant 17
@17
D = A

@SP
A = M
M = D
@SP
M = M + 1

// eq
@SP
AM = M - 1
D = M
@R13
M = D

@SP
AM = M - 1
D = M
@R14
M = D


@R13
D = M
@R14
D = M - D

@FALSE2
D;JNE

D = -1
@SP
A = M
M = D
@SP
M = M + 1


@CONTINUE2
0;JMP

(FALSE2)
D = 0
@SP
A = M
M = D
@SP
M = M + 1

(CONTINUE2)

// push constant 892
@892
D = A

@SP
A = M
M = D
@SP
M = M + 1

// push constant 891
@891
D = A

@SP
A = M
M = D
@SP
M = M + 1

// lt
@SP
AM = M - 1
D = M
@R13
M = D

@SP
AM = M - 1
D = M
@R14
M = D


@R13
D = M
@R14
D = M - D

@FALSE3
D;JGE

D = -1
@SP
A = M
M = D
@SP
M = M + 1


@CONTINUE3
0;JMP

(FALSE3)
D = 0
@SP
A = M
M = D
@SP
M = M + 1

(CONTINUE3)

// push constant 891
@891
D = A

@SP
A = M
M = D
@SP
M = M + 1

// push constant 892
@892
D = A

@SP
A = M
M = D
@SP
M = M + 1

// lt
@SP
AM = M - 1
D = M
@R13
M = D

@SP
AM = M - 1
D = M
@R14
M = D


@R13
D = M
@R14
D = M - D

@FALSE4
D;JGE

D = -1
@SP
A = M
M = D
@SP
M = M + 1


@CONTINUE4
0;JMP

(FALSE4)
D = 0
@SP
A = M
M = D
@SP
M = M + 1

(CONTINUE4)

// push constant 891
@891
D = A

@SP
A = M
M = D
@SP
M = M + 1

// push constant 891
@891
D = A

@SP
A = M
M = D
@SP
M = M + 1

// lt
@SP
AM = M - 1
D = M
@R13
M = D

@SP
AM = M - 1
D = M
@R14
M = D


@R13
D = M
@R14
D = M - D

@FALSE5
D;JGE

D = -1
@SP
A = M
M = D
@SP
M = M + 1


@CONTINUE5
0;JMP

(FALSE5)
D = 0
@SP
A = M
M = D
@SP
M = M + 1

(CONTINUE5)

// push constant 32767
@32767
D = A

@SP
A = M
M = D
@SP
M = M + 1

// push constant 32766
@32766
D = A

@SP
A = M
M = D
@SP
M = M + 1

// gt
@SP
AM = M - 1
D = M
@R13
M = D

@SP
AM = M - 1
D = M
@R14
M = D


@R13
D = M
@R14
D = M - D

@FALSE6
D;JLE

D = -1
@SP
A = M
M = D
@SP
M = M + 1


@CONTINUE6
0;JMP

(FALSE6)
D = 0
@SP
A = M
M = D
@SP
M = M + 1

(CONTINUE6)

// push constant 32766
@32766
D = A

@SP
A = M
M = D
@SP
M = M + 1

// push constant 32767
@32767
D = A

@SP
A = M
M = D
@SP
M = M + 1

// gt
@SP
AM = M - 1
D = M
@R13
M = D

@SP
AM = M - 1
D = M
@R14
M = D


@R13
D = M
@R14
D = M - D

@FALSE7
D;JLE

D = -1
@SP
A = M
M = D
@SP
M = M + 1


@CONTINUE7
0;JMP

(FALSE7)
D = 0
@SP
A = M
M = D
@SP
M = M + 1

(CONTINUE7)

// push constant 32766
@32766
D = A

@SP
A = M
M = D
@SP
M = M + 1

// push constant 32766
@32766
D = A

@SP
A = M
M = D
@SP
M = M + 1

// gt
@SP
AM = M - 1
D = M
@R13
M = D

@SP
AM = M - 1
D = M
@R14
M = D


@R13
D = M
@R14
D = M - D

@FALSE8
D;JLE

D = -1
@SP
A = M
M = D
@SP
M = M + 1


@CONTINUE8
0;JMP

(FALSE8)
D = 0
@SP
A = M
M = D
@SP
M = M + 1

(CONTINUE8)

// push constant 57
@57
D = A

@SP
A = M
M = D
@SP
M = M + 1

// push constant 31
@31
D = A

@SP
A = M
M = D
@SP
M = M + 1

// push constant 53
@53
D = A

@SP
A = M
M = D
@SP
M = M + 1

// add
@SP
AM = M - 1
D = M
@R13
M = D

@SP
AM = M - 1
D = M
@R14
M = D


@R13
D = M
@R14
D = M + D

@SP
A = M
M = D
@SP
M = M + 1


// push constant 112
@112
D = A

@SP
A = M
M = D
@SP
M = M + 1

// sub
@SP
AM = M - 1
D = M
@R13
M = D

@SP
AM = M - 1
D = M
@R14
M = D


@R13
D = M
@R14
D = M - D

@SP
A = M
M = D
@SP
M = M + 1


// neg
@SP
AM = M - 1
D = M
@R13
M = D


@R13
D = -M

@SP
A = M
M = D
@SP
M = M + 1


// and
@SP
AM = M - 1
D = M
@R13
M = D

@SP
AM = M - 1
D = M
@R14
M = D


@R13
D = M
@R14
D = M & D

@SP
A = M
M = D
@SP
M = M + 1


// push constant 82
@82
D = A

@SP
A = M
M = D
@SP
M = M + 1

// or
@SP
AM = M - 1
D = M
@R13
M = D

@SP
AM = M - 1
D = M
@R14
M = D


@R13
D = M
@R14
D = M | D

@SP
A = M
M = D
@SP
M = M + 1


// not
@SP
AM = M - 1
D = M
@R13
M = D


@R13
D = !M

@SP
A = M
M = D
@SP
M = M + 1

(END)
@END
0;JMP
