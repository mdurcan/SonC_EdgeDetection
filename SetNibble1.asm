; Sets Nibble 1
SetNibble1:
	;Set bits
	SHLL R3, 12
	CLRBR R2, 12
	CLRBR R2, 13
	CLRBR R2, 14
	CLRBR R2, 15

	ADD R2, R2, R3

RET