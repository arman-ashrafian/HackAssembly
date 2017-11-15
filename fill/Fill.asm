// Arman Ashrafian

// Runs an infinite loop that listens to the keyboard input.
// When a key is pressed (any key), the program blackens the screen,
// i.e. writes "black" in every pixel;
// the screen should remain fully black as long as the key is pressed. 
// When no key is pressed, the program clears the screen, i.e. writes
// "white" in every pixel;
// the screen should remain fully clear as long as no key is pressed.

// Put your code here.
(LOOP)
    @SCREEN
    D=A
    @R0
    M=D // store screen location counter in R0

    (SCREENLOOP)
        @KBD
        D=M // set D=keyboard input

        @WHITE
        D;JEQ // jmp to white if no key was pressed (D=0)

        (BLACK) // else, color screen black
        @R0
        A=M
        M=-1 // set screen to black
        @END
        0;JEQ // goto END

        (WHITE)
        @R0
        A=M
        M=0 // set screen to white

        (END)
        @R0
        M=M+1
        D=M
        @KBD
        D=D-A
        @SCREENLOOP
        D;JNE
        @LOOP
        D;JEQ
    @R0
    D=M
    @KBD
    D=D-A
    @SCREENLOOP
    D;JNE
    @LOOP
    D;JEQ
@LOOP
0;JEQ // infinite loop