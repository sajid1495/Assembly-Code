;code for determine avg from a 2D array
.MODEL SMALL
.STACK 100H
.DATA 
    tem DW ?
    dv DB 4 
    x DB ?
    nl DB  10,13,"$"
    col DB ':'
    spc DB ' '
    A DB "TAM",9,8,6,9
      DB "SAM",5,3,8,7
      DB "HAM",6,3,1,9
      DB "DAM",9,8,7,3
       
.CODE
MAIN PROC
    MOV AX,@DATA
    MOV DS,AX   
    
    mov cx,4  
    mov si,3 
    mov di,0
    
    LP: 
    
      mov tem,di 
      mov x,1
      
      Nam:
        cmp x,3
        jg pr
        mov dl,A[di]
        mov ah,2
        int 21h
        inc di
        inc x
        jmp Nam
      
      pr:
      
      mov dl,col
      mov ah,2
      int 21h
      mov dl,spc
      mov ah,2
      int 21h
      
      mov di,tem
      add di,7
      
      
      mov bx,1   
      mov ax,0
      LP2:
        cmp bx,4
        jg done    
        add al,A[si]
        inc bx
        inc si
        jmp LP2
      
      done: 
        div dv 
      
        cmp ah,0
        je pt
        inc al
      pt:
      mov dl,al
      add dl,30h
      mov ah,2
      int 21h
      
      LEA dx,nl
      mov ah,9
      int 21h 
      mov bx,1
     
      add si,3 
      LOOP LP
        
    MAIN ENDP    
END MAIN