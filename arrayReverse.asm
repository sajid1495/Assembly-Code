; reverse the array     
.model small
.stack 100h
.data  
    array db 2,3,5,7,8
    length db 0  
.code
main proc  
    mov ax, @data
    mov ds, ax 
    
    lea si, array
    lea di, array[4]
    mov cx, 5
    shr cx, 1
L1: 
    mov al, [si]
    mov bl, [di]
    
    mov [si], bl
    mov [di], al
    inc si
    dec di
    loop L1
    
    mov cx, 5 
    lea si, array   
L2:          
    mov dl, array[si] 
    add dl, 30h
    mov ah, 2
    int 21h
    mov dl, 2ch
    mov ah, 2
    int 21h  
    inc si
    loop L2 
    
main endp
end main