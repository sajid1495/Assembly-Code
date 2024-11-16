.model small
.stack 100h
.data
    array db 1, 2, 3, 4, 5
    arr_size db 5
    comma db ',', ' $'
    newline db 0dh, 0ah, '$'
    
.code
main proc
    mov ax, @data
    mov ds, ax
    
    mov cl, arr_size
    dec cl 
    
print_loop:
    mov bx, offset array
    add bl, cl
    mov al, [bx]
    add al, 30h
    mov dl, al
    mov ah, 02h
    int 21h
    cmp cl, 0
    je skip_comma
    lea dx, comma
    mov ah, 09h
    int 21h
skip_comma:
    dec cl
    cmp cl, -1
    jne print_loop
    lea dx, newline
    mov ah, 09h
    int 21h
    mov ah, 4ch
    int 21h
main endp
end main