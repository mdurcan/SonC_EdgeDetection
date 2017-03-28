; checks if nibble value = 3
CheckNibbleVal3:
	PUSH R3
	INC R3,R3		; R3 = 0003h
	XOR R6,R1,R3	; compare 0 if R1 = 0003h
	POP R3
RET