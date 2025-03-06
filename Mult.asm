// This file is part of www.nand2tetris.org 
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/4/mult/Mult.asm

// Multiplies R0 and R1 and stores the result in R2.
// (R0, R1, R2 refer to RAM[0], RAM[1], and RAM[2], respectively.)
// The algorithm is based on repetitive addition.

    @R2
    M=0        // Initialize R2 = 0 (result)

    @R0
    D=M        // D = R0 (multiplicand)

    @MULTIPLICAND
    M=D        // Store R0 in MULTIPLICAND

    @R1
    D=M        // D = R1 (multiplier)

    @END
    D;JEQ      // If R1 == 0, go to END (result is already 0)

    @MULTIPLIER
    M=D        // Store R1 in MULTIPLIER

(LOOP)
    @MULTIPLIER
    D=M
    @END
    D;JEQ      // If MULTIPLIER == 0, exit loop

    @MULTIPLICAND
    D=M        // D = MULTIPLICAND (R0)

    @R2
    M=M+D      // R2 = R2 + MULTIPLICAND

    @MULTIPLIER
    M=M-1      // MULTIPLIER -= 1

    @LOOP
    0;JMP      // Repeat loop

(END)
    @END
    0;JMP      // Infinite loop to stop execution
