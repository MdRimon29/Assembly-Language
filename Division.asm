.MODEL SMALL
.STACK 100H
.CODE
MAIN PROC
    
                                ;AX=DIVIDEND
                                ;DIVISOR =ANY RESISTOR
                                ;RESULT =AL
                                ;REMAINDER =AH                              
                                
                                
     MOV AH,1
     INT 21H            ;DIVIDEND
     MOV BH,AL
     SUB BH,48
     
     
     MOV AH,1
     INT 21H    ;DIVISOR
     MOV BL,AL
     SUB BL,48
     MOV CL,BH
     MOV CH,00
     MOV AX,CX
     
     
     DIV BL
     ;AAD
         
     Mov ch,al 
     Mov cl,ah
     add ch,48
     mov ah,2
     mov dl,ch
     int 21h    
         
     
     add cl,48
     mov ah,2
     mov dl,cl
     int 21h
     
     
    MOV AH,4CH
    INT 21H
    MAIN ENDP
END MAIN