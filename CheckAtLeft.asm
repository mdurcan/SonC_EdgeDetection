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