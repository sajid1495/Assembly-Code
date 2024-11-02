;code for checking if an expression is correctly bracketed

.model small
.stack 100h
.data
    VL db 10,13,"Correctly bracketed$"
    INV db 10,13,"Not correctly bracketed$"
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
        JE L6   ;if enter then terminate the input
        CMP AL, '('
        JE L2
        CMP AL, '{'
        JE L2
        CMP AL, '['
        JE L2
        CMP AL, ')'
        JE L3
        CMP AL, '}'
        JE L4
        CMP AL, ']'
        JE L5
        JMP L1
    L2: 
        MOV AH, 0
        PUSH AX  
        JMP L1
    L3:
       POP AX
       CMP AX, '('
       JE L1
       JMP L8
    L4:
       POP AX
       CMP AX, '{'
       JE L1
       JMP L8 
    L5:
       POP AX
       CMP AX, '['
       JE L1
       JMP L8
    L6:
       POP AX
       CMP AX,'@'
       JE L7
       JMP L8
    L7:
       LEA DX, VL
       MOV AH, 9
       INT 21H 
       JMP L9   
    
    L8:
       LEA DX, INV
       MOV AH, 9
       INT 21H 
    L9:
    
    
main endp 
end main 
