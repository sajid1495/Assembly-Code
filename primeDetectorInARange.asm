;code for printing prime or non prime number in a range

.MODEL SMALL
.STACK 100H
.DATA
    T DB 10
    A DB ?
    NL DB 10,13,"$"
    P DB " Is Prime",10,13,"$"
    NP DB " Is Not Prime",10,13,"$"
.CODE
MAIN PROC
    MOV AX,@DATA
    MOV DS,AX       
    MOV AX,2
           
    L:
        CMP AX,9
        JG EXT
        CMP AX,10
        JL Print
        MOV A,AL
        DIV T
        MOV DL,AL
        ADD DL,48
        MOV CH,AH
        MOV AH,2
        INT 21H
        MOV DL,CH
        ADD DL,48
        MOV AH,2
        INT 21H
        MOV AX,0
        MOV AL,A
        JMP EX
    
    Print:
        MOV A,AL
        MOV DL,A
        ADD DL,48
        MOV AH,2
        INT 21H
        MOV AX,0
        MOV AL,A
        JMP EX
    
    EX:
        MOV BX,2
    L1:
        CMP BL,A
        JE L2
        MOV AL,A
        DIV BL
        CMP AH,0
        JE L3
        INC BX
        MOV AX,0
        JMP L1
    L2:
        LEA DX,P
        MOV AH,9
        INT 21H
        MOV AX,0
        MOV AL,A
        INC AX
        MOV A,AL
        JMP L
    L3:
        LEA DX,NP
        MOV AH,9
        INT 21H
        MOV AX,0
        MOV AL,A
        INC AX
        MOV A,AL
        JMP L
    EXT:
        MAIN ENDP
        END MAIN