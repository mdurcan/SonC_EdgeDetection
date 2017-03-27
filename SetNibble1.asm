; Sets Nibble 1
SetNibble1:
	;Call Set Nibble Result
	;Shifts nibble 1 back into place and returns it to data set
	SHLL R3, 12
	CLRBR R2, 12
	CLRBR R2, 13
	CLRBR R2, 14
	CLRBR R2, 15

	ADD R2, R2, R3

RET