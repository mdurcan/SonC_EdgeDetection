; Sets Nibble 4
SetNibble4:
	;Call Set Nibble Results
	;Shifts nibble 4 back into place and returns it to data set
	CLRBR R2, 0	
	CLRBR R2, 1
	CLRBR R2, 2
	CLRBR R2, 3
	
	ADD R2, R2, R3
RET