; checks if nibble value = 2
CheckNibbleVal2:
	INC R3,R3		; R3 = 0002h
	XOR R6,R1,R3	; compare 0 if R1 = 0002h
RET