[BITS 16]
[ORG 0x7C00]

start:
	cli
	xor ax, ax
	mov ds, ax
	mov es, ax
	mov ss, ax
	mov sp, 0x7C00
	sti

	mov [BOOT_DRIVE], dl

load_stage2:
	mov bx, 0x8000

	mov ah, 0x02
	mov al, 4
	mov ch, 0
	mov dh, 0
	mov cl, 2
	mov dl, [BOOT_DRIVE]
	
	int 0x13
	jc disk_error

	jmp 0x0000:0x8000

disk_error:
	mov si, msg_error
	call print_error
	jmp $

print_error:
	lodsb
	or al, al
	jz .done
	mov ah, 0x0E
	int 0x10
	jmp print_error
.done:
	ret

BOOT_DRIVE db 0
msg_error db "Disk Error!", 13, 10, 0
	
times 446 - ($ - $$) db 0
times 64 db 0
db 0x55
db 0xAA
