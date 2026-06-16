[BITS 32]
[ORG 0x100000]

kentry_start:
	mov edi, 0xB8000
	mov ecx, 2000
	mov ax, 0x0F20

.clear_loop:
	mov [edi], ax
	add edi, 2
	loop .clear_loop

	mov al, 0x0E
	mov dx, 0x3D4
	out dx, al

	mov al, 0x00
	mov dx, 0x3D5
	out dx, al

	mov al, 0x0F
	mov dx, 0x3D4
	out dx, al

	mov al, 0x00
	mov dx, 0x3D5
	out dx, al

	jmp 0x100200

	hlt

times 512 - ($ - $$) db 0
