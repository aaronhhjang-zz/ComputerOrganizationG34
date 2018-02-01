			.text
			.global _start

_start:		
			LDR R4, =N			//R4 points to N, which holds the number of elements
			LDR R1, [R4]		//R1 holds the number of signal(content of memory address 'N')
			LDR R7, [R4]		//R7 also holds the number of signal (to be used as a shift counter for SHIFT_COUNT)
			ADD R3, R4, #4 		//R3 points to the first signal
			LDR R0, [R3] 		//R0 holds the first signal in the list
			LDR R9, =AVG		//R9 points to the AVG
			LDR R10, [R9]		//initialize average to 0
			LDR R2, [R9]		//initialize R2 to 0
			
SUM_LOOP:	
			SUBS R1, R1, #1		//decrement the loop counter
			BLT SHIFT_COUNT		//end loop if counter has reached negative
			ADD R10, R10, R0	//add the current signal to R10 which holds the current sum
			ADD R3, R3, #4		//R3 points to he next signal
			LDR R0, [R3]		//update R0 with the next signal value
			B SUM_LOOP			//back to the top of the loop


SHIFT_COUNT:	
			LSR R7, R7, #1		//shift right
			ADDS R2, R2, #1 	//increment the shift counter
			CMP R7, #1			//check if LSB is 1
			BEQ SUM_DONE		//if equal to 0, do not increment couner and proceed
			B SHIFT_COUNT		//go back to SHIFT_COUNT
				


SUM_DONE:
			LSR R10, R10, R2	//R10 holds the new shifted (/N) value		
			B AVG_DONE


AVG_DONE:	
			LDR R4, =N			//R4 points to the N location
			LDR R1, [R4]		//R1 holds the number of signal
			ADD R3, R4, #4 		//R3 points to the first signal
			B SUB_LOOP


SUB_LOOP:	
			SUBS R1, R1, #1		//decrement the loop counter
			BLT DONE			//end loop if counter has reached -
			LDR R2, [R3]		//R2 holds the value of R3
			SUBS R2, R2, R10	//R2 - R10 = R2
			STR R2, [R3]		//put back the value as the content of R3
			ADD R3, R3, #4		//R3 points to the next signal 
			B SUB_LOOP			//repeat SUB_LOOP

DONE: 		B DONE				//infinite loop!



AVG:		.word 0				//memory assigneed for the average
N:			.word 8				//number of entries in the list
SIGNAL:		.word 5, 5, 5, 5	// the list data of signals
			.word 5, 5, 5, 5
