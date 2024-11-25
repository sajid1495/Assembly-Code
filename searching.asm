; search an element     
.model small
.stack 100h
.data  
    array db 2,3,5,7,8
    element db ?  
    position db 0
    foundstr db 10,13,"Element found at position:","$"
    notfoundstr db 10,13,"Element is not found$"
.code
main proc  
    mov ax, @data
    mov ds, ax   
    
    mov ah, 1
    int 21h              
    mov element, al            
    sub element, 30h
    
    lea si, array
    mov cx, 5
L1: 
    mov al, [si]
    cmp al, element
    je found
    inc si   
    inc position
    loop L1 
    jmp notfound
    
       
found:   
    lea dx, foundstr
    mov ah, 9
    int 21h   
    xor dx,dx
    mov dl,position
    add dl,30h
    mov ah,2
    int 21h
    jmp endproc
    
notfound: 
    lea dx, notfoundstr
    mov ah, 9
    int 21h 
    jmp endproc
    
endproc:  


main endp
end main
