; Sets Nibble 1
SetNibble1:
	;Set bits
	SHRL R3, 12
	CLRBR R2, 0	
	CLRBR R2, 1
	CLRBR R2, 2
	CLRBR R2, 3
	ADD R2, R2, R3
RET