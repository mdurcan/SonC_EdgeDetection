; checks if nibble value = 1
CheckNibbleVal1:
	PUSH R3
	XOR R3,R3,R3	; R3 = 0000h
	SETBR R3,0		; R3 = 0001h
	XOR R6,R1,R3	; compare 0 if R1 = 0001h
	POP R3
RET