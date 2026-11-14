INCLUDE irvine32.inc

.data
    msgMain    BYTE " 1. Estamos en MAIN. Llamando a MetodoPadre", 0
    msgPadre1  BYTE " 2. Entrando a MetodoPadre. Llamando a MetodoHijo", 0
    msgHijo    BYTE " 3. Estamos dentro de MetodoHijo. Ejecutando codigo", 0
    msgPadre2  BYTE " 4. Regresamos a MetodoPadre. Terminando este metodo", 0
    msgFin     BYTE " 5. De vuelta en MAIN. Fin del programa.", 0

.code
main PROC
    ; Imprimimos mensaje inicial
    mov edx, OFFSET msgMain
    call WriteString
    call Crlf

    ; MAIN llama a MetodoPadre
    call MetodoPadre  

    ; Regresamos a MAIN para finalizar
    mov edx, OFFSET msgFin
    call WriteString
    call Crlf

    exit
main ENDP

; ---------------------------------------------------------
MetodoPadre PROC
; ---------------------------------------------------------
    ; Imprimimos primer mensaje del padre
    mov edx, OFFSET msgPadre1
    call WriteString
    call Crlf

    ; AQUI UN METODO LLAMA A OTRO
    call MetodoHijo   

    ; Al terminar el hijo, el programa regresa a esta linea
    mov edx, OFFSET msgPadre2
    call WriteString
    call Crlf

    ret ; Regresa a MAIN
MetodoPadre ENDP

; ---------------------------------------------------------
MetodoHijo PROC
; ---------------------------------------------------------
    ; Imprimimos mensaje del hijo
    mov edx, OFFSET msgHijo
    call WriteString
    call Crlf

    ret ; Regresa a MetodoPadre
MetodoHijo ENDP

END main