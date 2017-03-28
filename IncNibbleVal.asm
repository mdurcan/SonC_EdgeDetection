; Increments Nibble Value
IncNibbleVal:
	;Increments nibble value when moving through nibble 1-4
	XOR R4, R4, R4
	SETBR R4, 2
	XOR R6, R1, R4
	JNZ R6, 4		; If nibble is not 4, increment
	; Otherwise set nibble value back to 0
	CLRBR R1, 2
	SETBR R1, 0
	RET
	INC R1, R1
RET