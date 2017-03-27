; Sets Nibble 2
SetNibble2:
	;Set  bits
	SHRL R3, 8
	CLRBR R2, 8
	CLRBR R2, 9
	CLRBR R2, 10
	CLRBR R2, 11

	ADD R2, R2, R3

RET