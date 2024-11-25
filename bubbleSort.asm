;code for bubble sort
.model small
.stack 100h
.data
    array dw 5, 3, 8, 1, 4     
    size dw 5                  
.code
main proc
    MOV AX, @data
    MOV DS, AX                 
    
    LEA SI, array              
    MOV CX, size               
    DEC CX                     

outer_loop:
    MOV BX, CX                 
    LEA SI, array              

inner_loop:
    MOV AX, [SI]               
    MOV DX, [SI+2]             
    CMP AX, DX                 ; Compare current and next element
    JLE no_swap                ; If AX <= DX, no swap needed
    XCHG AX, DX                ; Swap AX and DX
    MOV [SI], AX               ; Store AX back to the current position
    MOV [SI+2], DX             ; Store DX to the next position

no_swap:
    ADD SI, 2                  ; Move to the next element
    DEC BX                     ; Decrement inner loop counter
    JNZ inner_loop             ; Repeat inner loop if BX != 0

    DEC CX                     ; Decrement outer loop counter
    JNZ outer_loop             ; Repeat outer loop if CX != 0

    ; Print sorted array
    LEA SI, array              ; Reset SI to the start of the array
    MOV CX, size               ; Load size of the array
print_loop:
    MOV AX, [SI]               ; Load the current element
    CALL print_number          ; Print the number
    CALL print_space           ; Print a space
    ADD SI, 2                  ; Move to the next element
    LOOP print_loop            ; Repeat until CX = 0

    MOV AH, 4Ch                ; Terminate program
    INT 21h

print_number:
    MOV DX, AX
    MOV AH, 02h
    ADD DL, 30h
    INT 21h
    RET

print_space:
    MOV DL, ' '
    MOV AH, 02h
    INT 21h
    RET

main endp
end main
