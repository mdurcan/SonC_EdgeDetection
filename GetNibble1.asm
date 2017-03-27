;Gets Nibble 1
GetNibble1:
	XOR R3, R3, R3
	MOVRR R3, R2
	SHRL R3, 12
RET