[BITS 32]

global_start:
_start:
	mov edx, 0xB8000
	mov al, 'X'
	mov ah, 0x0F
	mov [edx], ax

hang:
	jmp hang

times 512 - ($ - $$) db 0
