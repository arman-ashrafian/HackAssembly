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