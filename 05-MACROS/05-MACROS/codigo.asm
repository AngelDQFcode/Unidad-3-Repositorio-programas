.386
.model flat, stdcall
.stack 4096
ExitProcess PROTO, dwExitCode:DWORD

INCLUDE irvine32.inc
mostrarmensaje MACRO texto
mov edx, OFFSET texto 
call WriteString
call crlf

  mov al, factor1      
    mov bl, factor2      
    mul bl               
    mov resultado, ax
ENDM

.data
 mensajeBienvenida BYTE "Bienvenido al programa", 0
msgResultado      BYTE "El resultado de la multiplicacion es: ", 0
    MensajeFin        BYTE "Hasta luego", 0
    
     numA              BYTE 6     
     numB               BYTE 7     
     res                DW ?

      
	ENDM


.code
main PROC
    
    MostrarMensaje mensajeBienvenida

    MULTIPLICAR numA, numB, res

    mov edx, OFFSET msgResultado
    call WriteString

    mov ax, res
    call WriteDec
    call crlf

    MostrarMensaje MensajeFin

    exit                
main ENDP
END main