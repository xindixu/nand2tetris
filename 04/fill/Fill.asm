// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Fill.asm

// Runs an infinite loop that listens to the keyboard input.
// When a key is pressed (any key), the program blackens the screen,
// i.e. writes "black" in every pixel;
// the screen should remain fully black as long as the key is pressed. 
// When no key is pressed, the program clears the screen, i.e. writes
// "white" in every pixel;
// the screen should remain fully clear as long as no key is pressed.

// Put your code here.

// Probe keyboard
// Blacken and whiten the screen
// Address memory requires working with pointer


// LOOP
// if KBD, goto BLACK
// else, goto WHITE
// goto LOOP


(LOOP)
  // Probe keyboard
  @KBD
  D = M

  // No key is pressed
  @WHITE
  D;JEQ

  @BLACK
  0;JMP
  (ENDBLACK)

  (ENDWHITE)
  // goto LOOP
  @LOOP
  0;JMP




//////////////////////
(WHITE)
@R2
M = 1
// Whiten the screen 
// Reinitialize variables
// i = 0, add = screen
@i
M = 0
@SCREEN
D = A
@add
M = D

(WHITELOOP)
// if i > 8191 (end of screen), go to ENDWHITE
// i - 8191 > 0
@i
D = M
@8191
D = D - A
@ENDWHITELOOP
D;JGT

// else whiten screen
@add
A = M
M = 0

// increment
D = 1
@add
M = M + D
@i
M = M + 1

@WHITELOOP
0;JMP
(ENDWHITELOOP)
@ENDWHITE
0;JMP


//////////////////////
(BLACK)
@R2
M = 0
// Blackend Screen
// Reinitialize variables
// i = 0, add = screen
@i
M = 0
@SCREEN
D = A
@add
M = D

(BLACKLOOP)
// if i > 8191 (end of screen), go to ENDBLACK
// i - 8191 > 0
// 256 * 512 / 16 - 1 = 8191
@i
D = M
@8191
D = D - A
@ENDBLACKLOOP
D;JGT

// else blackend screen
@add
A = M
M = -1

// increment
D = 1
@add
M = M + D
@i
M = M + 1

@BLACKLOOP
0;JMP
(ENDBLACKLOOP)
@ENDBLACK
0;JMP