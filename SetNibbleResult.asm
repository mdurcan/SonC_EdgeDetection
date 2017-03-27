SetNibbleResult:
	JZ R6, 6
	;Set White if values are not the same
	CLRBR R3, 0
	SETBR R3, 1
	SETBR R3, 2
	CLRBR R3, 3
	RET
	;Set Black if values are the same
	SETBR R3, 0
	SETBR R3, 1
	CLRBR R3, 2
	CLRBR R3, 3
RET