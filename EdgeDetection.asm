; Assembly file to perform edge detection
; Aoife McDonagh	13411348
; Tara Bourke
; Martin Durcan

main: 
	CALL GetAddress64
	XOR R1, R1, R1			
	CALL IncNibbleVal		; Set nibble value to 1 at start of image
	CALL CheckAtEnd
	JZ R6, 3
	CALL processNibble
	CALL main 				; go back to beginning
	finished:
END


processNibble:
	MOVAMEMR R2, @R0 
	
	CALL CompareAbove
	CALL CompareLeft
	CALL SetNibbleResult	; Set result of edge detection, store in R3
	CALL SetNibble1			; Store result of edge detection in R2
	CALL IncNibbleVal		; nibble = 2
	
	CALL CompareAbove
	CALL CompareLeft
	CALL SetNibbleResult
	CALL SetNibble2
	CALL IncNibbleVal		; nibble = 3
	
	CALL CompareAbove
	CALL CompareLeft
	CALL SetNibbleResult
	CALL SetNibble3
	CALL IncNibbleVal		; nibble = 4
	
	CALL CompareAbove
	CALL CompareLeft
	CALL SetNibbleResult
	CALL SetNibble4
	
	MOVBAMEM @R0, R2		; Move results of edge detection (R2) back to original memory location
RET


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;; Comparisons ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


CompareAbove:
	PUSH R0
	XOR R5, R5, R5
	SETBR R5, 2					; R5 = 0004d
	ADD R0, R0, R5				; R0 = R0 + 4
	MOVAMEMR R4, @R5			; R4 holds contents of memory address 4 above current address
	POP R0						; Get current memory address back from stack
	
	CALL CheckNibbleVal1 		; checks if at nibble value 1
	JZ R6, CompareNibbleAbove1 	; compares nibble above current
	
	CALL CheckNibbleVal2 		; checks if at nibble value 2
	JZ R6, CompareNibbleAbove2	; compares nibble above current
	
	CALL CheckNibbleVal3 		; checks if at nibble value 3
	JZ R6, CompareNibbleAbove3	; compares nibble above current
	
	JZ R7, CompareNibbleAbove4	; If all three checks above fail we are at nibble 4
	
	CompareNibbleAbove1:
		CALL GetNibble1			; Isolating nibble 1 in R3 (current memory address)
		SHRL R4, 12				; Isolating nibble 1 in R4 (memory address above current)
		JZ R7, Compare
	
	CompareNibbleAbove2:
		CALL GetNibble2			; Isolating nibble 2 in R3 (current memory address)
		SHLL R4, 4
		SHRL R4, 12				; Isolating nibble 2 in R4 (memory address above current)
		JZ R7, Compare
		
	CompareNibbleAbove3:
		CALL GetNibble3			; Isolating nibble 3 in R3 (current memory address)
		SHLL R4, 8 
		SHRL R4, 12				; Isolating nibble 3 in R4 (memory address above current)
		JZ R7, Compare
		
	CompareNibbleAbove4:
		CALL GetNibble4			; Isolating nibble 4 in R3 (current memory address)
		SHLL R4, 12
		SHRL R4, 12				; Isolating nibble 4 in R4 (memory address above current)
		JZ R7, Compare
		
	Compare:
	XOR R6, R3, R4				; R6 will be 0 if the two nibbles are the same
RET


CompareLeft:
	PUSH R6
	CALL CheckNibbleVal1 		; checks if at nibble value 1
	JZ R6, CompareLeftNibble1	; compares nibble 1 to left
	
	CALL CheckNibbleVal2 		; checks if at nibble value 2
	JZ R6, CompareLeftNibble2	; compares nibble 2 to left
	
	CALL CheckNibbleVal3 		; checks if at nibble value 3
	JZ R6, CompareLeftNibble3	; compares nibble 3 to left
	
	JZ R7, CompareLeftNibble4 	; compares nibble 4 to left if not at left-most position in grid

	CompareLeftNibble1:			; Compare left of nibble 1
		CALL GetNibble2			; get nibble 2
		MOVRR R4,R3				; moves nibble into R4
		CALL GetNibble1			; get nibble 1
		JZ R7, CompareL			; go to compare and return
	
	CompareLeftNibble2:			; Compare left of nibble 2
		CALL GetNibble3			; get nibble 3
		MOVRR R4,R3				; moves nibble into R4
		CALL GetNibble2			; get nibble 2
		JZ R7, CompareL			; go to compare and return

	CompareLeftNibble3:			; Compare left of nibble 3
		CALL GetNibble4			; get nibble 4
		MOVRR R4,R3				; moves nibble into R4
		CALL GetNibble3			; get nibble 3
		JZ R7, CompareL			; go to compare and return
	
	CompareLeftNibble4:			; Compare left of nibble 4
		CALL CheckAtLeft 		; checks if at left most nibble in LED grid
		JNZ R6, 2				; Continue if not at left-most position in LED grid
		RET						; If at left position, return
		PUSH R0					; push address just for compare
		PUSH R2
		INC R0,R0				; get next address  
		MOVAMEMR R2, @R0		; R0 next address put into R4
		CALL GetNibble1			; get nibble 1 of new address
		MOVRR R4,R3				; moves nibble into R4
		POP R2
		POP R0					; get back current memory address
		CALL GetNibble4			; get Nibble
		JZ R7, CompareL			; go to compare and return
	
	CompareL:
	POP R6
	XOR R4,R4,R3				; compare registors and return
	ADD R6,R6,R4
RET


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;; Functions ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


GetAddress64: 			; puts address 64 into R0
	XOR R0,R0,R0		; clear address
	SETBR R0, 6			; Set address = 64
RET
CheckAtEnd:				; 127h = 0000 0001 0010 0111
	PUSH R5
	XOR R5,R5,R5		; Clear R0
	SETBR R5, 0			; 
	SETBR R5, 1			; 
	SETBR R5, 2			; 
	SETBR R5, 5			; 
	SETBR R5, 8			; R0 = 0127h
	XOR R6, R5, R0		; If current address is 127 then we are finished, R6 will be 0000h
	POP R5
RET


IncNibbleVal:			; Increments Nibble Value
	;Increments nibble value when moving through nibble 1-4
	XOR R4, R4, R4
	SETBR R4, 2
	XOR R6, R1, R4
	JNZ R6, 4		; If nibble is not 4, increment
	; Otherwise set nibble value back to 0
	CLRBR R1, 2
	SETBR R1, 0
	RET
	INC R1, R1
RET


SetNibbleResult:
	JZ R6, 6		;Set White if values are not the same
	CLRBR R3, 0
	SETBR R3, 1
	SETBR R3, 2
	CLRBR R3, 3
	RET
	SETBR R3, 0		;Set Black if values are the same
	SETBR R3, 1
	CLRBR R3, 2
	CLRBR R3, 3
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


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;; Checking Nibbles ;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
CheckNibbleVal1:	; Check if at nibble 1
	PUSH R3
	XOR R3,R3,R3	; R3 = 0000h
	SETBR R3,0		; R3 = 0001h
	XOR R6,R1,R3	; compare 0 if R1 = 0001h
	POP R3
RET
CheckNibbleVal2:	; Check if at nibble 2
	PUSH R3
	INC R3,R3		; R3 = 0002h
	XOR R6,R1,R3	; compare 0 if R1 = 0002h
	POP R3
RET
CheckNibbleVal3:	; Check if at nibble 3
	PUSH R3
	INC R3,R3		; R3 = 0003h
	XOR R6,R1,R3	; compare 0 if R1 = 0003h
	POP R3
RET


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;; Getting Nibbles ;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
GetNibble1:			; Isolate nibble 1 and put in R3
	XOR R3, R3, R3
	MOVRR R3, R2
	SHRL R3, 12
RET
GetNibble2:			; Isolate nibble 2 and put in R3
	XOR R3, R3, R3
	MOVRR R3, R2
	SHLL R3, 4
	SHRL R3, 12
RET
GetNibble3:			; Isolate nibble 3 and put in R3
	XOR R3, R3, R3
	MOVRR R3, R2
	SHLL R3, 8
	SHRL R3, 12
RET
GetNibble4:			; Isolate nibble 3 and put in R3
	XOR R3, R3, R3
	MOVRR R3, R2
	SHLL R3, 12
	SHRL R3, 12
RET


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;; Setting Nibbles ;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
SetNibble1: 	; Puts result of edge detection in nibble 1 into R2
	SHLL R3, 12
	CLRBR R2, 12
	CLRBR R2, 13
	CLRBR R2, 14
	CLRBR R2, 15
	ADD R2, R2, R3
RET
SetNibble2:		; Puts result of edge detection in nibble 2 into R2
	SHRL R3, 8
	CLRBR R2, 8
	CLRBR R2, 9
	CLRBR R2, 10
	CLRBR R2, 11
	ADD R2, R2, R3
RET
SetNibble3:		; Puts result of edge detection in nibble 3 into R2
	SHRL R3, 4
	CLRBR R2, 4
	CLRBR R2, 5
	CLRBR R2, 6
	CLRBR R2, 7
	ADD R2, R2, R3
RET
SetNibble4:		; Puts result of edge detection in nibble 4 into R2
	CLRBR R2, 0	
	CLRBR R2, 1
	CLRBR R2, 2
	CLRBR R2, 3
	ADD R2, R2, R3
RET
