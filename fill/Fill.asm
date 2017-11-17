// Arman Ashrafian

// Runs an infinite loop that listens to the keyboard input.
// When a key is pressed (any key), the program blackens the screen,
// i.e. writes "black" in every pixel;
// the screen should remain fully black as long as the key is pressed. 
// When no key is pressed, the program clears the screen, i.e. writes
// "white" in every pixel;
// the screen should remain fully clear as long as no key is pressed.

(LOOP)
    @SCREEN
    D=A
    @R0
    M=D // Store pixel counter at R0

    // Draw Loop
    (DRAW)
        @KBD
        D=M // set D = keydown?

        @WHITE
        D;JEQ // if( D = 0 ): jump to WHITE

        (BLACK) // else: color BLACK
        @R0
        A=M  // go to current pixel
        M=-1 // set pixel to black
        @END
        0;JMP // goto END

        (WHITE)
        @R0
        A=M
        M=0 // set screen to white

        (END)
        // increment pixel position
        @R0
        M=M+1
        D=M

        @KBD
        D=D-A

        @DRAW
        D;JNE
        @LOOP
        D;JEQ
    @R0
    D=M
    @KBD
    D=D-A
    @DRAW
    D;JNE
    @LOOP
    D;JEQ
@LOOP
0;JEQ // infinite loop