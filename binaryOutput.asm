;code for printing an inputed binary number

.model small
.stack 100h
.data
    CT db 0
.code
main proc
    MOV AX, @data
    MOV DS, AX 
    
    XOR BX, BX
    
    L1:
        MOV AH, 1
        INT 21H 
        CMP AL, 0Dh
        JE L2
        AND AL, 0Fh 
        SHL BX, 1
        OR BL, AL
        JMP L1
    L2: 
        SHL BX, 1
        JC L3
        JNC L4
    L3:
        MOV DL, 1 
        ADD DL, 30h
        MOV AH, 2
        INT 21H
        INC CT
        CMP CT, 16
        JE L5
        JMP L2 
    L4:
        MOV DL, 0  
        ADD DL, 30h
        MOV AH, 2
        INT 21H 
        INC CT
        CMP CT, 16
        JE L5
        JMP L2
    L5:
      
    
main endp 
end main
