.MODEL SMALL
.STACK 100H
.DATA
    MSG DB "Result: $"
.CODE
MAIN PROC
   
    MOV AX, @DATA
    MOV DS, AX              
    
    MOV AH, 1
    INT 21H
    MOV BL,AL 
    SUB BL,48  
    
    mov ah,2
    mov dl,0dh
    int 21h
    mov dl,0ah
    int 21h
    
    MOV AH, 1
    INT 21H
    SUB AL,48
               
              
    ; Multiply AL and BL
    MUL BL
        AAM
    ; Store the result in AX
   ; MOV RESULT, AX

   

    ; Display the result value  
    MOV CX,AX 
    
    ADD CH,48
    ADD CL,48 
    
    mov ah,2
    mov dl,0dh
    int 21h
    mov dl,0ah
    int 21h
    
    
    ; Display the result message
    MOV AH, 09h
    LEA DX, MSG
    INT 21h
    
    MOV AH, 2       ; DOS function to print a character
    MOV DL, CH        
    INT 21h    
    MOV DL, CL        
    INT 21h

    ; Terminate the program
    MOV AH, 4Ch       ; DOS function to exit the program
    INT 21h

MAIN ENDP
END MAIN