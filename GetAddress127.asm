GetAddress127:			; 127h = 0000 0001 0010 0111
	XOR R0,R0,R0		; Clear R0
	SETBR R0, 0			; 
	SETBR R0, 1			; 
	SETBR R0, 2			; 
	SETBR R0, 5			; 
	SETBR R0, 8			; R0 = 0127h
RET