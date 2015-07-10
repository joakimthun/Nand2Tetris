// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Mult.asm

// Multiplies R0 and R1 and stores the result in R2.
// (R0, R1, R2 refer to RAM[0], RAM[1], and RAM[2], respectively.)

@i
M = 0 // Initialize i to 0

@R2
M = 0 // Initialize R2 to 0

(LOOP)
  @i
  D = M
  @R1
  D = D - M
  @END
  D;JEQ // Jump to END if i - R1 == 0

  @R0
  D = M
  @R2
  M = M + D // Add the multiplicand to R2

  @i
  M = M + 1 // i++

  @LOOP
  0;JMP // Jump to the start of the loop

(END)
  @END
  0;JMP // Infinite loop
