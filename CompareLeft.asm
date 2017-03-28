; Compare the Nibble beside the current one
; 0 = same & not 0 = difference
CompareLeft:
	CALL CheckNibbleVal1 ; checks if at nibble value 1
	JZ R6, CompareleftNibble1; compares nibble 1 to left
	
	CALL CheckNibbleVal2 ; checks if at nibble value 2
	JZ R6, CompareleftNibble2; compares nibble 2 to left
	
	CALL CheckNibbleVal3 ; checks if at nibble value 3
	JZ R6, CompareleftNibble3; compares nibble 3 to left
	
	;Compare left of nibble 4
	CALL CheckAtLeft 	; checks if at left most nibble in grid
	JNZ R6, 2			; if at at left, return or continue
	RET
	;continue
	PUSH R0				;push address just for compare
	PUSH R2
	; get nibble needed for comparing against
	INC R0,R0			; get next address  
	MOVAMEMR R2, @R0	; Ro next address put into R4
	CALL GetNibble1		; get nibble 1 of new address
	MOVRR R4,R3			; moves nibble into R4
	; get what we are checking
	POP R2
	POP R0				; get back address of current 
	CALL GetNibble4		; get Nibble
	JZ R7, CompareL		; go to compare and return

	
	;Compare left of nibble 1
	CompareleftNibble1:
		CALL GetNibble2		; get nibble 2
		MOVRR R4,R3			; moves nibble into R4
		CALL GetNibble1		; get nibble 1
		JZ R7, CompareL		; go to compare and return
	
	
	;Compare left of nibble 2
	CompareleftNibble2:
		CALL GetNibble3		; get nibble 3
		MOVRR R4,R3			; moves nibble into R4
		CALL GetNibble2		; get nibble 2
		JZ R7, CompareL		; go to compare and return
	
	
	;Compare left of nibble 3
	CompareleftNibble3:
		CALL GetNibble4		; get nibble 4
		MOVRR R4,R3			; moves nibble into R4
		CALL GetNibble3		; get nibble 3
		JZ R7, CompareL		; go to compare and return
	
	
	CompareL:
	XOR R6,R4,R3		; compare registors and return
RET