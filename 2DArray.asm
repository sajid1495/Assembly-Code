;code for clearing a row and column of an array
.MODEL SMALL
.STACK 100H
.DATA 
    nl DB  10,13,"$"
    A DB 1,2,3,4,5
      DB 1,2,3,3,5
      DB 1,2,3,3,5
      DB 1,2,3,3,5
      DB 1,2,3,3,5
     
   
.CODE
MAIN PROC
;initialize DS
    MOV AX,@DATA
    MOV DS,AX   

     mov si,0
     mov bx,2
     mov cx,5
     
     LP: 
       
       mov A[si][bx],0
       add si,5
       LOOP LP
       
       
     mov si,10
     mov cx,5
     LP3:
     
        mov A[si],0
        inc si
        LOOP LP3
       
       
     mov cx,25
     mov si,0   
     mov bx,1
     
     LP2:
     
     mov dl,A[si]
     add dl,30h
     mov ah,2
     int 21h
     inc si  
     inc bx
     cmp bx,6
     jl nll
    
     LEA dx,nl
     mov ah,9
     int 21h 
     mov bx,1
     
      nll: 
      
      LOOP LP2
        
   
 
    MAIN ENDP    

END MAIN