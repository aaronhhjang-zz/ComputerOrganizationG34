// Subroutine provided to compute the max of two numbers and returns the result

	.text
	.global MAX_2

MAX_2:	
		CMP R0, R1
		BXGE LR
		MOV R0,R1
		BX LR
		.end