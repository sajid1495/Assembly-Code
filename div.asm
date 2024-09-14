;;code for determining devision of two numbers

.model small
.stack 100h
.data
    A dw ?
    B db ?
.code
main proc
    MOV AX, @data
    MOV DS, AX 
    
    ;taking input of 1st number
    MOV AH, 1
    INT 21H
    MOV AH, 0 
    MOV A, AX 
    SUB A, 30H
    
    ;printing space
    MOV DL, 20H
    MOV AH, 2
    INT 21H
    
    ;taking input of 2nd number
    MOV AH, 1
    INT 21H  
    MOV B, AL 
    SUB B, 30H 
      
    ;deviding numbers  
    MOV AX, A
    DIV B
    MOV BL, AL
    MOV BH, AH  
    
    ;printing space
    MOV DL, 10
    MOV AH, 2
    INT 21H 
    MOV DL, 13
    MOV AH, 2
    INT 21H
    
    ;printing quotient
    MOV DL, BL
    ADD DL, 30H
    MOV AH, 2
    INT 21H
    
    ;printing space
    MOV DL, 20H
    MOV AH, 2
    INT 21H
    
    ;printing reminder
    MOV DL, BH
    ADD DL, 30H
    MOV AH, 2
    INT 21H
    
main endp 
end main
