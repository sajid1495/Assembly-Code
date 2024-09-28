;code for case convirsion using conditional

.model small
.stack 100h
.data
    str1 db "Enter Character: $"
    str2 db 10,13,"Uppercase $"
    str3 db 10,13,"Lowercae $"
    str4 db 10,13,"Invalid $" 
    
.code
main proc
    MOV AX, @data
    MOV DS, AX    
    
    ;printing str1
    LEA DX, str1
    MOV AH, 9
    INT 21h

    ;taking input
    MOV AH, 1
    INT 21H
    MOV BL, AL     
      
    CMP BL, 65
    JL exitp
    CMP BL, 90
    JG L1
    
    ADD BL, 32
    MOV DL, BL
    MOV AH, 2
    INT 21h
    JMP exitp
    
    L1:
        CMP BL, 97
        JL exitp
        CMP BL, 122
        JG exitp
        
        SUB BL, 32
        MOV DL, BL
        MOV AH, 2
        INT 21h 
    
    
    exitp:
        
    
main endp 
end main
