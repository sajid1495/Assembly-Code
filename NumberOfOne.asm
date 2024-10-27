;code for determining number of 1 present in a binary number

.model small
.stack 100h
.data
    A db 10101010b
    B db 0
    C db 0
.code
main proc
    MOV AX, @data
    MOV DS, AX
    
    MOV AL, A
    L1:
        SHL AL, 1
        JC L2 
        INC C
        CMP C, 8
        JL L1
        JE L3  
        
    L2:
        INC B
        JMP L1  
    
    L3:
        MOV DL, B  
        ADD DL, 30H
        MOV AH, 2
        INT 21H
      
    
main endp 
end main
