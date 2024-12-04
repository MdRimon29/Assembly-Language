.MODEL SMALL 
.STACK 100H

.DATA 
    CR EQU 0DH 
    LF EQU 0AH 
    M1 DB CR,LF,'ENTER A HEXA DIGIT :','$' 
    M2 DB CR,LF,'IN DECIMAL IT IS :' 
    C1 DB ?,'$' 
    M3 DB CR,LF,'DO YOU WANT TO DO IT AGAIN ?Y/N','$'  
    M4 DB CR,LF,'ILLEGAL CHARACTER - ENTER 0..9OR A..F :','$'  
    M5 DB CR,LF,'IN DECIMAL IT IS :1' 
    C2 DB ?,'$'      
    M6 DB CR,LF,'ERROR!!! THREE TIMES!!! $' 
 DB 'ILLEGAL CHAR !','$' 

.CODE 
    MAIN PROC 
     MOV AX,@DATA 
     MOV DS,AX 
   START: 
     MOV AH,9 
     LEA DX,M1 
     INT 21H 
     
   NEW:
     MOV AH,1 
     INT 21H 
     
     
     CMP AL,'0' 
     JL ILLEGAL 
     CMP AL,'9' 
     JG ILLEGAL 
      
     MOV C1,AL 
     MOV AH,9 
     LEA DX,M2 
     INT 21H 
     
   MSG:
     MOV AH,9  
     LEA DX,M3 
     INT 21H 
     
     MOV AH,1 
     INT 21H 
     CMP AL,'Y' 
     JE START 
     CMP AL,'y' 
     JE START 
     JMP END 
     
   ILLEGAL:
     CMP AL,'A' 
     JL ILLEGAL_1 
     CMP AL,'F' 
     JG ILLEGAL_1
     SUB AL,11H 
     MOV C2,AL 
     
     MOV AH,9 
     LEA DX,M5 
     INT 21H 
     
     JMP MSG 
     
   ILLEGAL_1:
     MOV AH,9 
     LEA DX,M4 
     INT 21H
     INC BL 
     CMP BL,3 
     JE END_1  
     JMP NEW 
     
   END_1: 
    MOV AH,9 
    LEA DX,M6 
    INT 21H  
     
   END:
     MOV AH,4CH 
     INT 21H 
    MAIN ENDP 
    END MAIN