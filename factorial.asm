.model small
.stack 100h 

.data    
    n dw 5
    result dw ?
    
.code

main proc
    mov ax,@data
    mov ds,ax
    
    call fact 
             
    mov result, AX
    mov dx,ax  
    mov ah,2
    add dx,30h
    int 21h  
    
    jmp exit
    
main endp 


fact proc  
    mov cx,n
    mov ax,1
    l1: 
    mul cx
    loop l1
    ret 
        
fact endp
        
    
exit:
   
        
end main