// Computes: if R0 > 0
//              R1 = 1
//           else
//              R1 = 0
@R0
D = M

@POSITIVE
D;JGT  // if D > 0, goto 8

@R1
M = 0  // R1 = 0
@R10
0;JMP  // infinite loop to stop program

(POSITIVE)
@R1
M = 1

(END)
@END
0;JMP  // infinite loop to stop program