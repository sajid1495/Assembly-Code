;code for case conversion

.model small
.stack 100h
.data
    str1 db "Enter Uppercae Character: $"
    str2 db 10,13,"Lowercae Character Is: $"
    str3 db 10,13,"Enter Lowercae Character: $"
    str4 db 10,13,"Uppercae Character Is: $" 
    
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
      
    ;printing str2
    LEA DX, str2
    MOV AH, 9
    INT 21h
                  
    ;printing lowercase letter
    ADD BL,32
    MOV DL, BL   
    MOV AH, 2 
    INT 21h
    
    ;printing str3
    LEA DX, str3
    MOV AH, 9
    INT 21h
    
    ;taking input
    MOV AH, 1
    INT 21H
    MOV BL, AL     
    
    ;printing str4
    LEA DX, str4
    MOV AH, 9
    INT 21h
    
    ;printing uppercase letter 
    SUB BL,32
    MOV DL, BL   
    MOV AH, 2 
    INT 21h  
    
main endp 
end main
