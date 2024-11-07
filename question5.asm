.model small
.stack 100h 
.data
m1 db 'Enter three numbers: $'
m2 db 'The largest number is $'
.code
main proc
    mov ax,@data
    mov ds,ax
    
    mov ah,9
    lea dx,m1
    int 21h
    
    mov ah,1 
    int 21h
    mov bl,al
    
    ;while taking input one has to press space between two numbers 
    mov dl,0dh
    int 21h
    
    mov ah,1 
    int 21h
    mov bh,al
     
    mov dl,0dh
    int 21h 
    
    mov ah,1 
    int 21h
    mov cl,al
     
    
    mov ah,2
    mov dl,0dh
    int 21h
    mov dl,0ah
    int 21h
    
    mov ah,9
    lea dx,m2
    int 21h 
    
    cmp bl, bh       ; Compare first and second number
    jg  first_is_greater_second   ; Jump if first is greater than second
    
    cmp bl, cl       ; Compare first and third number
    jl  second_is_middle  ; If first < third, then second is middle if it’s greater than first
    cmp cl, bh       ; Otherwise check if third < second
    jge third_is_middle   ; Jump if third is middle value

first_is_greater_second: 
    cmp bl, cl       ; If first > second, check with third
    jl  third_is_middle   ; Jump if third < first
    cmp cl, bh       ; Check if third < second
    jge third_is_middle   ; If true, third is middle

second_is_middle:
    mov ah,2
    mov dl,bh
    int 21h
    jmp exit

third_is_middle:
    mov ah,2
    mov dl,cl
    int 21h
    jmp exit
    
    exit:
    mov ah,4ch
    int 21h
    main endp
end main