; this checks if a left of grid
Main:
	SETBR R0,6
	SETBR R0,0
	CALL CheckAtLeft ;R6 = not 0
END

;Main:
;	SETBR R0,6
;	ADDI R0,R0,7
;	CALL CheckAtLeft ;R6 = 0
;END

CheckAtLeft:
	PUSH R0 			; push R0 
	CALL GetAddress64
	ADDI R0,R0, 3 		;sets to R0 = 0067h
	MOVRR R3,R0			; moves to R3
	POP R0				; gets back the address
	; first compare, 0067h
	XOR R6,R0,R3		; if 0067h
	JZ R6, result
	; check 0071h
	ADDI R3,R3, 4 		;sets to R0 = 0071h
	XOR R6,R0,R3		; if 0071h
	JZ R6, result
	; check 0075h
	ADDI R3,R3, 4 		;sets to R0 = 0075h
	XOR R6,R0,R3		; if 0075h
	JZ R6, result
	; check 0079h
	ADDI R3,R3, 4 		;sets to R0 = 0079h
	XOR R6,R0,R3		; if 0079h
	JZ R6, result
	; check 0083h
	ADDI R3,R3, 4 		;sets to R0 = 0083h
	XOR R6,R0,R3		; if 0083h
	JZ R6, result
	; check 0087h
	ADDI R3,R3, 4 		;sets to R0 = 0087h
	XOR R6,R0,R3		; if 0087h
	JZ R6, result
	; check 0091h
	ADDI R3,R3, 4 		;sets to R0 = 0091h
	XOR R6,R0,R3		; if 0091h
	JZ R6, result
	; check 0095h
	ADDI R3,R3, 4 		;sets to R0 = 0095h
	XOR R6,R0,R3		; if 0095h
	JZ R6, result
	; check 0099h
	ADDI R3,R3, 4 		;sets to R0 = 0099h
	XOR R6,R0,R3		; if 0099h
	JZ R6, result
	; check 0103h
	ADDI R3,R3, 4 		;sets to R0 = 0103h
	XOR R6,R0,R3		; if 0103h
	JZ R6, result
	; check 0107h
	ADDI R3,R3, 4 		;sets to R0 = 0107h
	XOR R6,R0,R3		; if 0107h
	JZ R6, result
	; check 0111h
	ADDI R3,R3, 4 		;sets to R0 = 0111h
	XOR R6,R0,R3		; if 0111h
	JZ R6, result
	; check 0115h
	ADDI R3,R3, 4 		;sets to R0 = 0115h
	XOR R6,R0,R3		; if 0115h
	JZ R6, result
	; check 0119h
	ADDI R3,R3, 4 		;sets to R0 = 0119h
	XOR R6,R0,R3		; if 0119h
	JZ R6, result
	; check 0123h
	ADDI R3,R3, 4 		;sets to R0 = 0123h
	XOR R6,R0,R3		; if 0123h
	JZ R6, result
	; check 0127h
	ADDI R3,R3, 4 		;sets to R0 = 0127h
	XOR R6,R0,R3		; if 0127h
	JZ R6, result
RET
	result:
RET

GetAddress64:
	XOR R0,R0,R0		; clear address
	SETBR R0, 6			;Set address = 64
RET