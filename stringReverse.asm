;code for reversely print a string

.model small
.stack 100h
.data
    space db 10,13,"$"
.code
main proc
    MOV AX, @data
    MOV DS, AX 
    
    MOV AX, '@'
    PUSH AX 
    
    L1:
        MOV AH, 1
        INT 21H 
        CMP AL, 0Dh  ;compare if the input is enter
        JE L3   ;if enter then terminate the input
        MOV AH, 0
        PUSH AX
        JMP L1
        
     L2:
        POP BX
        CMP BX, '@'
        JE L4
        MOV DX, BX
        MOV AH, 2
        INT 21H  
        JMP L2
     L3:
        LEA DX, space
        MOV AH, 9
        INT 21H
        JMP L2
     L4:
    
    
main endp 
end main 
