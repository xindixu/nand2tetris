// drawRectangle.asm
// Draws a filled rectangle at the screen's top left corner.
// The rectangle's width is 16 pixels and its height is RAM[0]
// Usage: put a non-negative number (n) in to RAM[0]

// for(i = 0; i < n; i++)
//  draw 16 black pixels at the beginning of row i
// 
// add = SCREEN
// n = RAM[0]
// i = 0

// LOOP:
//  if i > n, goto END
//  RAM[add] = -1
//  add += 32 // go to next row of the screen 
//  i += 1
//  goto LOOP



// add = SCREEN
@SCREEN
D = A
@add
M = D

// n = RAM[0]
@R0
D = M
@n
M = D

// i = 0
@i
M = 0


(LOOP)
@i
D = M
@n
D = D - M
@END
D;JGT  // if i > n , goto END

//  RAM[add] = -1
@add
A = M
M = -1

// add += 32
@32
D = A
@add
M = M + D

// i += 1
@i
M = M + 1

@LOOP
0;JMP

(END)
@END
0;JMP

