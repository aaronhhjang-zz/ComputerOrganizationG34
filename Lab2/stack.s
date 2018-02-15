			.text
			.global _start

_start:
//Push 1,5,6 onto the stack and pop them into R0-R2
			LDR R4, =STACK 	//
			ADD R4, R4, #8 // R4 points to the bottom of the stack
			MOV R0, #1		
			BL PUSH
			MOV R0, #5
			BL PUSH
			MOV R0, #6
			BL PUSH
		
			BL POP
			B DONE
PUSH: 		
//PUSH{R0}
			STR R0, [R4],#-4
			BX LR



POP: 
//POP {R0 - R2} (Pop 3 times)
//1st pop -> R0
//2nd pop -> R1
//3rd pop -> R2
			LDR R0, [R4, #4]!	//Pop the content of SP into R0, and increment SP preindex mode
			LDR R1, [R4, #4]!	//Pop the content of SP into R1, and increment SP	
			LDR R2, [R4, #4]!	//Pop the content of SP into R2, and increment SP
			BX LR

DONE: 		B DONE

STACK: 		.word 0, 0, 0












