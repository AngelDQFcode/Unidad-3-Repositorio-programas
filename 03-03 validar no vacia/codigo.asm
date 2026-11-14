INCLUDE Irvine32.inc

.data
	mensajeEntrada  BYTE "Ingrese un texto: ", 0
	entradaValida   BYTE "Entrada no vacia", 0
	entradaInvalida BYTE "Entrada vacia", 0
	buffer          BYTE 100 DUP(0)

.code 
main PROC
	mov edx, OFFSET mensajeEntrada
	call WriteString

	mov edx, OFFSET buffer
	mov ecx, SIZEOF buffer
	call ReadString          ; Guarda en EAX la longitud de lo que escribio el usuario
	mov ecx, eax             ; Pasa esa longitud a ECX para evaluarla

	call ValidarNoVacia

	test eax, eax
	jz mostrarInvalida

	mov edx, OFFSET entradaValida
	call WriteString
	call crlf
	jmp fin

mostrarInvalida:
	mov edx, OFFSET entradaInvalida
	call WriteString
	call crlf

fin:
	exit
main ENDP

ValidarNoVacia PROC
	cmp ecx, 0
	je esVacia

	mov eax, 1
	ret

esVacia:
	mov eax, 0
	ret
ValidarNoVacia ENDP

END main