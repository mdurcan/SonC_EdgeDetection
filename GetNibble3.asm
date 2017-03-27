;Gets Nibble 3
GetNibble3:
	XOR R3, R3, R3
	MOVRR R3, R2
	SHLL R3, 4
	SHRL R3, 12
RET