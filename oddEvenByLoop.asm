;code for implimenting loop

.model small
.stack 100h
.data
    str1 db " is odd.",10,13,"$"
    str2 db " is even.",10,13,"$"
    A dw 1
    B db 2
    
.code
main proc
    MOV AX, @data                                                                            
    MOV DS, AX
    
    
    L1: 
        MOV DX, A
        ADD DX, 30H
        MOV AH, 2
        INT 21H
        
        MOV AX, A
        DIV B
        CMP AH, 0
        JE L2
        JG L3
       
    L2:
        LEA DX, str2
        MOV AH, 9
        INT 21H
        INC A
        CMP A, 10
        JL L1              
    
    L3:
        LEA DX, str1
        MOV AH, 9
        INT 21H 
        INC A
        CMP A, 10
        JL L1 
      
    
    
main endp 
end main
