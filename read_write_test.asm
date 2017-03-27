; Test reading and writing from BRAM
XOR R0, R0, R0 			; Clear R0
XOR R1, R1, R1 			; Clear R1
SETBR R0, 2
SETBR R0, 5
SETBR R0, 6				; R0 = 0064h
SETBR R1, 1
SETBR R1, 4
SETBR R1, 6
SETBR R1, 8
SETBR R1, 9
SETBR R1, 12			; R1 = 1352h
MOVBAMEM @R0, R1
MOVAMEMR R2, @R0		; Move contents of address 0064h to R2