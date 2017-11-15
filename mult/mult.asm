// Arman Ashrafian
// Multiplies R0 and R1 and stores the result in R2.

@R2
M=0        

@counter
M=0        // counter = 0

(LOOP)
	@counter
	D=M        // D = counter

	// if (counter > R1) break
	@R1
	D=D-M;
	@END
	D;JGE      

	// else
	@counter
	M=M+1      // counter ++

	@R0
	D=M        // D = R0
	@R2
	M=M+D      // R2 = R2 + R0

	@LOOP
	0;JMP
(END)

// Terminate
@END
0;JMP


