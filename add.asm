;code for determining addition, substraction of two numbers

.model small
.stack 100h
.data
    A db 5
    B db 5
.code
main proc
    MOV AX, @data
    MOV DS, AX
    
    ;taking input of 1st number
    MOV AH, 1
    INT 21H 
    MOV A, AL 
    SUB A, 30h
    
    ;printing space
    MOV DL, 20H
    MOV AH, 2
    INT 21H  
     
    
    ;taking input of 2nd number
    MOV AH, 1
    INT 21H  
    MOV B, AL
    SUB B, 30h 
    
    ;adding numbers
    MOV AL, A
    ADD AL, B 
    MOV BL, AL
    MOV AH, 0
    AAA   
    MOV BH, AH
    
    ;printing newline
    MOV DL, 10
    MOV AH, 2
    INT 21H
    MOV DL, 13
    MOV AH, 2
    INT 21H
    
    ;printing result
    MOV DL, BH  
    ADD DL, 30H
    MOV AH, 2
    INT 21H
    MOV DL, AL  
    ADD DL, 30H
    MOV AH, 2
    INT 21H 
     
    
    
    
main endp 
end main
