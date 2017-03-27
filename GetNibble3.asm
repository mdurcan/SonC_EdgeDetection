;Gets Nibble 3
GetNibble3:
	XOR R3, R3, R3
	MOVRR R3, R2
	SHLL R3, 8
	SHRL R3, 12
RET