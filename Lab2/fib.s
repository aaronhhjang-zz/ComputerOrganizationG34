     		.text
			.global _start

_start:
            MOV R0, #10 // compute the Nth number of the Fib
            LDR R3, RESULT// initialize R3 to 0, which later on stores the Nth Fib number
			LDR R7, =TICKETBOOTH // R7 points to the first address of ticketbooth, 
			ADD R7, R7, #40	// R7 points to the bottom of the ticketbooth as we start storing tickets from the bottom going up just like stacks
            MOV R1, #1// R1 = 1 // 0, 1, 1, 2, 5... here R1 is the firsts 1
            MOV R2, #1// R2 = 1 // R2 is the second 1
	        BL FIB //go to fib
            MOV R3, R2//R3 stores the final result
            B END


FIB:

            STR LR, [R7, #-4]!//create current ticket to get out of the Fib we just entered via Pre index.
            MOV R3, R2//R3 temporarily stores the value of R2
            ADD R2, R1, R2//increment R2, which becomes the next Fib number
            MOV R1, R3// the previous R2 becomes the current R1
            SUB R0, R0, #1//decrement R0 by 1.
            CMP R0, #1
            BLE LETSGOHOME//if R0 less or equal to 1, let's go home!!
            BL FIB// otherwise, enter deeper Fib layers ..
            LDR LR, [R7, #4]!// the first time we run this line is when we just got out from the deepest Fib. Now load the second last ticket, Pre index.
            BX LR //Use current ticket to get out of current Fib level.

LETSGOHOME:
            BX LR// use the last ticket we created to get out of the Deepest Fib level, which is the one from which we entered letsgohome.
END:
            B END

RESULT:      .word 0

TICKETBOOTH:	.word 0,0,0,0,0,0,0,0,0,0  // reserved 10 space for potentially 10 tickets, potentially getting the 10th Fib number.

