;Test, load TestBram1
Main:
	CALL GetAddress64
	CALL IncNibbleVal
	MOVAMEMR R2,@R0 
	CALL CompareLeft	; compare nibble 1, return 0
	CALL SetNibbleResult
	CALL SetNibble1
	CALL IncNibbleVal			; nibble = 2
	CALL CompareLeft	; compare nibble 2, return not 0
	CALL SetNibbleResult
	CALL SetNibble2
	CALL IncNibbleVal			; nibble =3
	CALL CompareLeft	; compare nibble 3, return 0
	CALL SetNibbleResult
	CALL SetNibble3
	CALL IncNibbleVal			; nibble = 4
	CALL CompareLeft	; compare nibble 4, return not 0
	CALL SetNibbleResult
	CALL SetNibble4
	MOVBAMEM @R0, R2
END


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
	PUSH R2
	; get nibble needed for comparing against
	INC R0,R0			; get next address  
	MOVAMEMR R4, @R0	; Ro next address put into R4
	CALL GetNibble1		; get nibble 1 of new address
	MOVRR R4,R3			; moves nibble into R4
	; get what we are checking
	POP R2
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

SetNibbleResult:
	JZ R6, 6
	;Set White
	CLRBR R3, 0
	SETBR R3, 1
	SETBR R3, 2
	CLRBR R3, 3
	RET
	;Set Black
	CLRBR R3, 0
	CLRBR R3, 1
	CLRBR R3, 2
	CLRBR R3, 3
RET

GetAddress64:
	XOR R0,R0,R0		; clear address
	SETBR R0, 6			;Set address = 64
RET

IncNibbleVal:
	XOR R4, R4, R4
	SETBR R4, 2
	XOR R6, R1, R4
	JNZ R6, 4
	CLRBR R1, 2
	SETBR R1, 0
	RET
	INC R1, R1
RET

CheckAtLeft:
	PUSH R0 			; push R0 
	CALL GetAddress64
	ADDI R0,R0, 3 		;sets to R0 = 67d
	MOVRR R3,R0			; moves to R3
	POP R0				; gets back the address
	; first compare, 67d
	XOR R6,R0,R3		; if 67d
	JZ R6, result
	; check 71d
	ADDI R3,R3, 4 		;sets to R0 = 71d
	XOR R6,R0,R3		; if 71d
	JZ R6, result
	; check 75d
	ADDI R3,R3, 4 		;sets to R0 = 75d
	XOR R6,R0,R3		; if 75d
	JZ R6, result
	; check 79d
	ADDI R3,R3, 4 		;sets to R0 = 79d
	XOR R6,R0,R3		; if 79d
	JZ R6, result
	; check 83d
	ADDI R3,R3, 4 		;sets to R0 = 83d
	XOR R6,R0,R3		; if 83d
	JZ R6, result
	; check 87d
	ADDI R3,R3, 4 		;sets to R0 = 87d
	XOR R6,R0,R3		; if 87d
	JZ R6, result
	; check 91d
	ADDI R3,R3, 4 		;sets to R0 = 91d
	XOR R6,R0,R3		; if 91d
	JZ R6, result
	; check 95d
	ADDI R3,R3, 4 		;sets to R0 = 95d
	XOR R6,R0,R3		; if 95d
	JZ R6, result
	; check 99d
	ADDI R3,R3, 4 		;sets to R0 = 99d
	XOR R6,R0,R3		; if 99d
	JZ R6, result
	; check 0103d
	ADDI R3,R3, 4 		;sets to R0 = 0103d
	XOR R6,R0,R3		; if 0103d
	JZ R6, result
	; check 0107d
	ADDI R3,R3, 4 		;sets to R0 = 0107d
	XOR R6,R0,R3		; if 0107d
	JZ R6, result
	; check 0111d
	ADDI R3,R3, 4 		;sets to R0 = 0111d
	XOR R6,R0,R3		; if 0111d
	JZ R6, result
	; check 0115d
	ADDI R3,R3, 4 		;sets to R0 = 0115d
	XOR R6,R0,R3		; if 0115d
	JZ R6, result
	; check 0119d
	ADDI R3,R3, 4 		;sets to R0 = 0119d
	XOR R6,R0,R3		; if 0119d
	JZ R6, result
	; check 0123d
	ADDI R3,R3, 4 		;sets to R0 = 0123d
	XOR R6,R0,R3		; if 0123d
	JZ R6, result
	; check 0127d
	ADDI R3,R3, 4 		;sets to R0 = 0127d
	XOR R6,R0,R3		; if 0127d
	JZ R6, result
RET
	result:
RET

GetNibble4:
	XOR R3, R3, R3
	MOVRR R3, R2
	SHLL R3, 12
	SHRL R3, 12
RET

GetNibble3:
	XOR R3, R3, R3
	MOVRR R3, R2
	SHLL R3, 8
	SHRL R3, 12
RET

GetNibble2:
	XOR R3, R3, R3
	MOVRR R3, R2
	SHLL R3, 4
	SHRL R3, 12
RET

GetNibble1:
	XOR R3, R3, R3
	MOVRR R3, R2
	SHRL R3, 12
RET

SetNibble4:
	;Set bits
	CLRBR R2, 0	
	CLRBR R2, 1
	CLRBR R2, 2
	CLRBR R2, 3
	ADD R2, R2, R3
RET

SetNibble3:
	;Set  bits
	SHLL R3, 4
	CLRBR R2, 4
	CLRBR R2, 5
	CLRBR R2, 6
	CLRBR R2, 7

	ADD R2, R2, R3

RET

SetNibble2:
	;Set  bits
	SHLL R3, 8
	CLRBR R2, 8
	CLRBR R2, 9
	CLRBR R2, 10
	CLRBR R2, 11

	ADD R2, R2, R3

RET

SetNibble1:
	;Set bits
	SHLL R3, 12
	CLRBR R2, 12
	CLRBR R2, 13
	CLRBR R2, 14
	CLRBR R2, 15

	ADD R2, R2, R3

RET