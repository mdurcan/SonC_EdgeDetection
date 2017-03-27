;Gets Nibble 4
GetNibble4:
	XOR R3, R3, R3
	MOVRR R3, R2
	SHLL R3, 12
	SHRL R3, 12
RET