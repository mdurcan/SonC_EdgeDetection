; Sets Nibble 3
SetNibble3:
	;Call Set Nibble Result
	;Shifts nibble 3 back into place and returns it to data set
	SHRL R3, 4
	CLRBR R2, 8
	CLRBR R2, 9
	CLRBR R2, 10
	CLRBR R2, 11
	ADD R2, R2, R3

RET