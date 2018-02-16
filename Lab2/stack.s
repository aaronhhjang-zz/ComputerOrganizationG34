			.text
			.global _start

_start:
//Push 1,5,6 onto the stack and pop them into R0-R2
			LDR R4, =MYSTACK 	//
			ADD R4, R4, #8 // R4 points to the bottom of the stack
			MOV R0, #1		
			BL MYPUSH
			MOV R0, #5
			BL MYPUSH
			MOV R0, #6
			BL MYPUSH
		
			BL MYPOP
			B DONE
MYPUSH: 		
//PUSH{R0}
			STR R0, [R4],#-4
			BX LR



MYPOP: 
//POP {R0 - R2} (Pop 3 times)
//1st pop -> R0
//2nd pop -> R1
//3rd pop -> R2
			LDR R0, [R4, #4]!	//Pop the content of SP into R0, and increment SP pre-index mode
			LDR R1, [R4, #4]!	//Pop the content of SP into R1, and increment SP	
			LDR R2, [R4, #4]!	//Pop the content of SP into R2, and increment SP
			BX LR

DONE: 		B DONE

MYSTACK: 		.word 0, 0, 0












