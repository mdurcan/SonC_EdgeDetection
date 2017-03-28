CompareAbove:
	PUSH R0
	XOR R5, R5, R5
	SETBR R5, 3			; R5 = 0004d
	ADD R0, R0, R5		; R0 = R0 + 4
	MOVAMEMR R4, @R5	; R4 holds contents of memory address 4 above current address
	POP R0				; Get current memory address back from stack
	
	CALL CheckNibbleVal1 		; checks if at nibble value 1
	JZ R6, CompareNibbleAbove1 	; compares nibble above current
	
	CALL CheckNibbleVal2 		; checks if at nibble value 2
	JZ R6, CompareNibbleAbove2	; compares nibble above current
	
	CALL CheckNibbleVal3 		; checks if at nibble value 3
	JZ R6, CompareNibbleAbove3	; compares nibble above current
	
	JZ R7, CompareNibbleAbove4	; If all three checks above fail we are at nibble 4
	
	CompareNibbleAbove1:
		CALL GetNibble1	`		; Isolating nibble 1 in R3 (current memory address)
		SHRL R4, 12				; Isolating nibble 1 in R4
		JZ R7, Compare
	
	CompareNibbleAbove2:
		CALL GetNibble2			;Isolating nibble 2 in R3 (current memory address)
		SHLL R4, 4
		SHRL R4, 12				; Isolating nibble 2 in R4
		JZ R7, Compare
		
	CompareNibbleAbove3:
		CALL GetNibble3			;Isolating nibble 3 in R3 (current memory address)
		SHLL R4, 8
		SHRL R4, 12				; Isolating nibble 3 in R4
		JZ R7, Compare
		
	CompareNibbleAbove4:
		CALL GetNibble4			;Isolating nibble 4 in R3 (current memory address)
		SHLL R4, 12
		SHRL R4, 12				; Isolating nibble 4 in R4
		JZ R7, Compare
		
	Compare:
	XOR R6, R3, R4				; R6 will be 0 if the two nibbles are the same
RET