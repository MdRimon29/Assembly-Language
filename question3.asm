.MODEL SMALL
.STACK 100H

.DATA
    msg_1 DB 'Enter the first capital letter : $';message 1
    msg_2 DB 'Enter the second capital letter : $';message 2
    msg_3 DB 'The given capital letters in alphabetical order are : $';message

    NEXT DB 0DH,0AH,"$"

.CODE
    MAIN PROC
        MOV AX, @DATA
        MOV DS, AX 
        
        MOV AH, 9 
        LEA DX, NEXT 
        INT 21H
        
        LEA DX, msg_1 
        INT 21H
        
        MOV AH, 1 
        INT 21H 
        
        MOV BL, AL 
        
        MOV AH, 9 
        
        LEA DX, NEXT 
        INT 21H
        
        LEA DX, msg_2 
        INT 21H
        
        MOV AH, 1 
        INT 21H 
        
        MOV BH, AL 
        
        MOV AH, 9 
        
        LEA DX, NEXT 
        INT 21H
        
        LEA DX, msg_3 
        INT 21H
        
        MOV AH, 2 
        
        CMP BL, BH
        
        JAE Larger_
            MOV DL, BH
            INT 21H
            
            MOV DL, BL
            INT 21H
            
            JMP _END
            
        
        Larger_:
            MOV DL, BL
            INT 21H
            
            MOV DL, BH
            INT 21H
            
        
        _END:
        
        MOV AH, 4CH 
        INT 21H
     MAIN ENDP
    END MAIN