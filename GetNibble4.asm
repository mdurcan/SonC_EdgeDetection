;Gets Nibble 4
GetNibble4:
	;Isolates nibble 4 from data set
	XOR R3, R3, R3
	MOVRR R3, R2
	SHRL R3, 12
RET