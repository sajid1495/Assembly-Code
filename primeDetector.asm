;code for determining a number prime or not

.model small
.stack 100h
.data
    A dw 120
    B db 2 
    flag db 1
    str1 db "Prime.$"
    str2 db "Not Prime.$"
.code
main proc
    MOV AX, @data
    MOV DS, AX 
    
    MOV DX, A 
    DEC DX
    MOV BL, 2
    
    L1: 
        MOV AX, A
        DIV BL
        CMP AH, 0
        JE L2
        INC BL
        CMP BL,DL
        JL L1
        JMP L3 
     
    L2:  
        LEA DX, str2
        MOV AH, 9
        INT 21h  
        JMP L4        
        
    L3:
        LEA DX, str1
        MOV AH, 9
        INT 21h
        
    L4:
            
    
    
    
main endp 
end main
