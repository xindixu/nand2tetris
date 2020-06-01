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
  (ENDCHANGELOOP)

  // goto LOOP
  @LOOP
  0;JMP

///////////////

(WHITE)
@fill
M = 0
@CHANGE
0;JMP

(BLACK)
@fill
M = -1

@CHANGE
0;JMP

///////////////
(CHANGE)
@i
M = 0
@SCREEN
D = A
@add
M = D

  (CHANGELOOP)
  // if i > 8191 (end of screen), go to ENDBLACK
  // i - 8191 > 0
  // 256 * 512 / 16 - 1 = 8191
  @i
  D = M
  @8191
  D = D - A
  @ENDCHANGELOOP
  D;JGT

  // else fill screen
  @fill
  D = M
  @add
  A = M
  M = D

  // increment
  @add
  M = M + 1
  @i
  M = M + 1

  @CHANGELOOP
  0;JMP