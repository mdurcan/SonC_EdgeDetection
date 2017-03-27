; Increments Nibble Value
IncNibbleVal:
	XOR R4, R4, R4
	SETBR R4, 2
	XOR R6, R1, R4
	JZ R6, 4
	CLRBR R1, 2
	SETBR R1, 0
	RET
	INC R1, R1
RET