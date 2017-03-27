; Sets Nibble 3
SetNibble3:
	;Set  bits
	SHRL R3, 4
	CLRBR R2, 4
	CLRBR R2, 5
	CLRBR R2, 6
	CLRBR R2, 7

	ADD R2, R2, R3

RET