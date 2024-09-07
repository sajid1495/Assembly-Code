.model small
.stack 100h
.data
    A db 5
    B db 5
.code
main proc
    MOV AX, @data
    MOV DS, AX
    
    MOV AH, 1
    INT 21H 
    MOV A, AL 
    SUB A, 30h 
    
    MOV AH, 1
    INT 21H  
    MOV B, AL
    SUB B, 30h 
    
    MOV AL, A
    ADD AL, B 
    
    MOV DL, AL
    ADD DL, 30H
    
    MOV AH, 2
    INT 21H
    
main endp 
end main
