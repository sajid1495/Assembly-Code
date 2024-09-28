;code for determining a number is even or odd using conditional

.model small
.stack 100h
.data
    A dw 20
    B db 2
    str1 db "Even$"
    str2 db "Odd$"
    
.code
main proc
    MOV AX, @data
    MOV DS, AX    
    
    MOV AX, A
    DIV B
    
    CMP AH, 0
    JE L1
    JMP L2
    
    L1:
    LEA DX, str1
    MOV AH, 9
    INT 21h 
    JMP exitp
    
    L2:
    LEA DX, str2
    MOV AH, 9
    INT 21h
    
    
    exitp:
main endp 
end main
