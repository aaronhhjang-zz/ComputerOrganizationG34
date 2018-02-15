     		.text
			.global _start

_start:
            MOV R0, #10 //Nth number
            LDR R3, RESULT//initialize R3 to 0
			LDR R7, =TICKETBOOTH
			ADD R7, R7, #40
            MOV R1, #1// R1 = 1
            MOV R2, #1// R2 = 1
	        BL FIB //go to fib
            MOV R3, R2//R3 stores the final result
            B END


FIB:

            STR LR, [R7, #-4]!//create ticket_n to get out of Fib_n. Pre index
            MOV R3, R2//R3 temporarily stores the value of R2
            ADD R2, R1, R2//increment R2
            MOV R1, R3// the previous R2 becomes the current R1
            SUB R0, R0, #1//decrement R0 by 1.
            CMP R0, #1
            BLE LETSGOHOME//if R0 less or equal to 1, let's go home!!
            BL FIB//else, deeper inception ..
            LDR LR, [R7, #4]!//move the value stored in stack to LR in order, Pre index
            BX LR //Use current ticket to get out of current Fib level.

LETSGOHOME:
            BX LR//use current ticket to get out of current Fib level.
END:
            B END

RESULT:      .word 0

TICKETBOOTH:	.word 0,0,0,0,0,0,0,0,0,0

