;Gets Nibble 2
GetNibble2:
	XOR R3, R3, R3
	MOVRR R3, R2
	SHLL R3, 8
	SHRL R3, 12
RET