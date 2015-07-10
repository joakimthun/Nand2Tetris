// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Fill.asm

// Runs an infinite loop that listens to the keyboard input.
// When a key is pressed (any key), the program blackens the screen,
// i.e. writes "black" in every pixel. When no key is pressed, the
// program clears the screen, i.e. writes "white" in every pixel.

(MAINLOOP)
  @color // Reset the color to white 00000000 00000000
  M = 0
  @screenIndex // Reset the screen pointer index to 0
  M = 0

  (RENDERLOOP)
    @SCREEN
    D = A
    @screenIndex // Check what our next memory address will be
    D = D + M

    @KBD
    D = D - A
    @MAINLOOP
    D;JEQ // Restart the loop if we are outside the screens memory space

    @KBD
    D = M
    @DRAW
    D;JEQ // If the value of the keyboards memory sapce is 0 no key is pressed so the color value is correct(0)

    @color
    M = -1 // Some key is pressed so set the color to 11111111 11111111 (all black)

    (DRAW)

    @SCREEN
    D = A

    @screenIndex // Get the memory address we will be writing to
    D = D + M

    @drawPointer // Save that address
    M = D

    @color
    D = M

    @drawPointer
    A = M // Set the address pointer to the value in drawPointer
    M = D // Set the value of that address to the value of the color stored in D

    @screenIndex
    M = M + 1 // index ++

    @RENDERLOOP
    0;JMP
