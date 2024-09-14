;;code for multiplication of two numbers

.model small
.stack 100h
.data
    A db 3
    B db 2
.code 
main proc
    MOV AX,@DATA
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
    
    
    ;multiplying numbers            
    MOV AL, A
    MUL B
    MOV BX, AX
       
    ;printing newline
    MOV DL, 10
    MOV AH, 2
    INT 21H
    MOV DL, 13
    MOV AH, 2
    INT 21H   
    
    ;printing result  
    mov DX, BX
    add DX, 30H
    mov AH, 2
    INT 21H     