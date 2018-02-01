				.text
				.global _start

_start:			LDR R4, = RESULT	//R4 points to the result location
				LDR R2, [R4,#4]		//R2 holds the number of elements in the list
				ADD R3, R4, #8		//R3 points to the first number
				LDR R0, [R3]		//R0 holds the first number in the list

MAX_LOOP:		SUBS R2, R2, #1		// decrements the loop counter
				BEQ MAX_DONE		// end loop if counter has reached 0 and go to MAX_DONE
				ADD R3, R3, #4		// R3 points to the next number in the list
				LDR R1, [R3]		// R1 holds the next number in the list
				CMP R0, R1			// check if it is greater than maximum
				BGE MAX_LOOP		// if no, branch back to the max_loop
				MOV R0, R1			// if yes, update the current max
				B MAX_LOOP			// brach back to the max_loop

MAX_DONE: 		STR R0, MAX 		// store the maximum value found by MAX_LOOP
				// re-initialize
				LDR R2, [R4,#4]		// R2 holds the number of elements in the list
				ADD R3, R4, #8		// R3 points to the first number
				LDR R0, [R3]		// R0 holds the first number in the list
				B MIN_LOOP 			// branch to MIN_LOOP

MIN_LOOP: 		SUBS R2, R2, #1		// decrements the loop counter
				BEQ MIN_DONE		// end loop if counter has reached 0 and go to MIN_DONE
				ADD R3, R3, #4		// R3 points to the next number in the list
				LDR R1, [R3]		// R1 holds the next number in the list
				CMP R0, R1			// check if it is less than minimum
				BLT MIN_LOOP		// if no, branch back to the min_loop
				MOV R0, R1			// if yes, update the current min
				B MIN_LOOP			// brach back to the min_loop\


MIN_DONE:		LDR R1, MAX			// R1 holds the maximum value, R0 holds the minimum value
				SUBS R0, R1, R0		// R0 holds the value R1-R0
				LSR R0, R0, #2		// R0 holds the new-shifted (/2) value
				STR R0, RESULT		// store stddev into RESULT

DONE:			B DONE				// infinite loop!

RESULT: 		.word	0			// memory assigned for result location
N:				.word	7			// number of entries in the list
NUMBERS:		.word	4, 5, 3, 6	// the list data
				.word	1, 8, 2
MAX:			.word 	0			// memory that holds the maximum (could have also left it in a register)