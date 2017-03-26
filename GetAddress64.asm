;puts address 64 into address reg
GetAddress64:
	XOR R0,R0,R0		; clear address
	SETBR R0, 6			;Set address = 64
RET