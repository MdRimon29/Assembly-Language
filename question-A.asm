.MODEL SMALL
.STACK 100H

.DATA
    msg_1 DB 'Enter the first capital letter: $'
    msg_2 DB 'Enter the second capital letter: $'
    msg_3 DB 'Enter the third capital letter: $'
    msg_4 DB 'The given capital letters in alphabetical order are: $'
    NEXT DB 0DH, 0AH, "$"

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
    XCHG BL, BH       

    CHECK1:
    
    CMP BL, CL
    JLE CHECK2   
    XCHG BL, CL       

    CHECK2:
    
    CMP BH, CL
    JLE larger 
    XCHG BH, CL       

    larger:
 
    MOV AH, 2
    
    MOV DL, BL        
    INT 21H
    
    MOV DL, BH        
    INT 21H
    
    MOV DL, CL        
    INT 21H
    
    END:
    MOV AH, 4CH
    INT 21H

MAIN ENDP
END MAIN
