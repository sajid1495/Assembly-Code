;;code for printing strings

.model small
.stack 100h
.data
    A db "Hello",10,13,"World$"
    B db 10,13,41h,42h,43h,44h,24h
.code
main proc
    MOV AX, @data
    MOV DS, AX
    
    LEA DX, A
    MOV AH, 9
    INT 21H
    
    LEA DX, B
    MOV AH, 9
    INT 21H
    
main endp 
end main
