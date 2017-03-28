CompareAbove:
	MOVAMEMR R3, @R0 	; Get contents of current address block, put into R3
	PUSH R0
	XOR R5, R5, R5
	SETBR R5, 3			; R5 = 0004d
	ADD R0, R0, R5		; R0 = R0 + 4
	MOVAMEMR R4, @R5	; R4 holds contents of memory address 4 above current address
	POP R0				; Get current memory address back from stack
	
	CALL CheckNibbleVal1 ; checks if at nibble value 1
	JZ R6, CompareleftNibble1; compares nibble 1 to left
	
	CALL CheckNibbleVal2 ; checks if at nibble value 2
	JZ R6, CompareleftNibble2; compares nibble 2 to left
	
	CALL CheckNibbleVal3 ; checks if at nibble value 3
	JZ R6, CompareleftNibble3; compares nibble 3 to left
	