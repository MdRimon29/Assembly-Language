.MODEL SMALL
.STACK 100H

.DATA
    msg_1 DB 'Enter the first capital letter: $'
    msg_2 DB 'Enter the second capital letter: $'
    msg_3 DB 'Enter the third capital letter: $'
    msg_4 DB 'The given capital letters in alphabetical order are: $'
    NEXT DB 0DH, 0AH, "$"
    TEMP DB ?

.CODE
MAIN PROC
    MOV AX, @DATA
    MOV DS, AX 
    
    MOV AH, 9
    LEA DX, NEXT
    INT 21H
    
    LEA DX, msg_1
    MOV AH, 9
    INT 21H
    MOV AH, 1
    INT 21H
    MOV BL, AL 

    MOV AH, 9
    LEA DX, NEXT
    INT 21H
    
    LEA DX, msg_2
    MOV AH, 9
    INT 21H
    MOV AH, 1
    INT 21H
    MOV BH, AL 

    
    MOV AH, 9
    LEA DX, NEXT
    INT 21H
    
    
    LEA DX, msg_3
    MOV AH, 9
    INT 21H
    MOV AH, 1
    INT 21H
    MOV CL, AL 

    
    MOV AH, 9
    LEA DX, NEXT
    INT 21H
    LEA DX, msg_4
    INT 21H

    CMP BL, BH
    JLE CHECK1
    MOV TEMP, BL
    MOV BL, BH
    MOV BH, TEMP

    CHECK1:
    CMP BL, CL
    JLE CHECK2
    MOV TEMP, BL
    MOV BL, CL
    MOV CL, TEMP

    CHECK2:
    CMP BH, CL
    JLE DISPLAY
    MOV TEMP, BH
    MOV BH, CL
    MOV CL, TEMP

    DISPLAY:
    MOV AH, 2
    MOV DL, BL
    INT 21H
    
    MOV DL, BH
    INT 21H
    
    MOV DL, CL
    INT 21H

    MOV AH, 4CH
    INT 21H

MAIN ENDP
END MAIN
