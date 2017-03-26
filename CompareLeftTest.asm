;Test, load TestBram1
Main:
	SETBR R0, 6			;Set address = 64
	SETBR R1, 0			;Set Nibble = 1
	CALL CompareLeft	; compare nibble 1, return 0
	NOP
	INC R1,R1			; nibble = 2
	CALL CompareLeft	; compare nibble 2, return not 0
	NOP
	INC R1,R1			; nibble =3
	CALL CompareLeft	; compare nibble 3, return 0
	NOP
	INC R1,R1			; nibble = 4
	CALL CompareLeft	; compare nibble 4, return not 0
	NOP
END

;test functions, return set result
CheckAtLeft:
	SETBR R6,0
RET

GetNibble1:
	XOR R3,R3,R3	; R3 = 0000h
	SETBR R3,0		;0001h
RET
GetNibble2:
	XOR R3,R3,R3	; R3 = 0000h
	SETBR R3,0		;0001h
RET
GetNibble3:
	XOR R3,R3,R3	; R3 = 0000h
	SETBR R3,1		;0002h
RET
GetNibble4:
	XOR R3,R3,R3	; R3 = 0000h
	SETBR R3,1		;0002h
RET


; Compare the Nibble beside the current one
; 0 = same & not 0 = difference
CompareLeft:
	CALL CheckNibbleVal1 ; checks if at nibble value 1
	JZ R6, CompareleftNibble1; compares nibble 1 to left
	
	CALL CheckNibbleVal2 ; checks if at nibble value 2
	JZ R6, CompareleftNibble2; compares nibble 2 to left
	
	CALL CheckNibbleVal3 ; checks if at nibble value 3
	JZ R6, CompareleftNibble3; compares nibble 3 to left
	
	;Compare left of nibble 4
	CALL CheckAtLeft 	; checks if at left most nibble in grid
	JNZ R6, 2			; if at at left, return or continue
	RET
	;continue
	PUSH R0				;push address just for compare
	; get nibble needed for comparing against
	INC R0,R0			; get next address  
	MOVAMEMR R4, @R0	; Ro next address put into R4
	CALL GetNibble1		; get nibble 1 of new address
	MOVRR R4,R3			; moves nibble into R4
	; get what we are checking
	POP R0				; get back address of current 
	CALL GetNibble4		; get Nibble
	JZ R7, CompareL		; go to compare and return

	
	;Compare left of nibble 1
	CompareleftNibble1:
		CALL GetNibble2		; get nibble 2
		MOVRR R4,R3			; moves nibble into R4
		CALL GetNibble1		; get nibble 1
		JZ R7, CompareL		; go to compare and return
	
	
	;Compare left of nibble 2
	CompareleftNibble2:
		CALL GetNibble3		; get nibble 3
		MOVRR R4,R3			; moves nibble into R4
		CALL GetNibble2		; get nibble 2
		JZ R7, CompareL		; go to compare and return
	
	
	;Compare left of nibble 3
	CompareleftNibble3:
		CALL GetNibble4		; get nibble 4
		MOVRR R4,R3			; moves nibble into R4
		CALL GetNibble3		; get nibble 3
		JZ R7, CompareL		; go to compare and return
	
	
	CompareL:
	XOR R6,R4,R3		; compare registors and return
RET


; other functions
CheckNibbleVal1:
	XOR R3,R3,R3	; R3 = 0000h
	SETBR R3,0		; R3 = 0001h
	XOR R6,R1,R3	; compare 0 if R1 = 0001h
RET

CheckNibbleVal2:
	INC R3,R3			; R3 = 0002h
	XOR R6,R1,R3	; compare 0 if R1 = 0002h
RET

CheckNibbleVal3:
	INC R3,R3			; R3 = 0003h
	XOR R6,R1,R3	; compare 0 if R1 = 0003h
RET