;code for finding maximum and minimum element of an array
.model small
.stack 100h
.data
    a db 5,8,1,6,9,4,1
    max db ?
    min db ?
    mxm db "Max = $"
    mnm db "Min = $"
    nl db 0ah,0dh,'$' 
    
.code
main proc
    mov ax,@data
    mov ds,ax
    
    xor bx,bx
    mov al,[a+bx]
    mov max,al
    mov al,[a+bx]
    mov min,al    
    
    l:
    cmp bx,7
    je pnt
    mov al,max
    cmp al,[a+bx]
    jl mx
    mov al,min
    cmp al,[a+bx]
    jg mn
    inc bx
    jmp l  
    
    mx:
    mov al,[a+bx]
    mov max,al 
    jmp l  
    
    mn:
    mov al,[a+bx]
    mov min,al
    jmp l
    
    pnt:
    lea dx, mxm
    mov ah,9
    int 21h
    
    xor dx,dx
    mov dl,max
    add dl,30h
    mov ah,2
    int 21h
    
    lea dx,nl
    mov ah,9
    int 21h
    
    lea dx, mnm
    mov ah,9
    int 21h
    
    
    
    xor dx,dx
    mov dl,min
    add dl,30h
    mov ah,2
    int 21h 
    
main endp
end main