				.text
				.global _start

_start:
				MOV R0, #0			//R0 holds the "boolean" sorted,#0 means False
				
WHILE:
				LDR R1, N			//R1 holds the length of array A
				LDR R2, =ARRAY		//R2 Holds the address of the first element		
				CMP R0, #0			//check if the array is sorted ([R0]-0)
				MOV R0, #1			//set the "boolean" sorted to true 
				BEQ FOR_SETUP		//while not sorted, go to WHILE
				B DONE				//while sorted, DONE
				
FOR_SETUP:			
				// If enter FOR_SETUP from WHILE --> R1 = #N , R2 stores the address of the first element. 
				LDR R4, [R2],#4 	//load current element into R4 and, by post-index syntax, R2 stores the address of the next element
				LDR R5, [R2]		//load the next element into R5																									
				CMP R4, R5			//check if R4 is greater than R5		
				BGT SWAP			//If yes, enter SWAP
				// Else enter FOR_LOOP automatically
				
FOR_LOOP:				
				//ADD R2, R2, #4	//R2 points to the next element
				SUB R1, R1, #1		//Decrement the count. (need to loop FOR_SETUP for #N-1 times)	
				CMP R1, #1			//Check if the count
				BEQ WHILE			//Enter WHILE if the count is 1
				B FOR_SETUP			//Enter FOR_SETUP if the count is greater than 1 (if not 1).
				
SWAP:				
				STR R4, [R2],#-4	//Store the previous element into the later element's address
				STR R5, [R2],#4		//Store	the later element into the previous	element's address 
				MOV R0, #0			//set sorted to false
				B FOR_LOOP					
DONE:			
				B DONE				//infinite loop!
				
N:				.word	15	//number of elements in array
ARRAY:			.word  6, 2, 7, 5, 6, 3, 2, 1, 9, 10, 85, 99, 100, 0, -1
