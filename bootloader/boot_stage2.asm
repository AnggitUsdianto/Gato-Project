[BITS 16]
[ORG 0x8000]

stage2_start:
	mov [boot_drive], dl
	
	xor ax, ax
	mov ds, ax
	mov es, ax
	mov ss, ax
	mov sp, 0x7C00

	mov si, msg_header
	call print_string
	mov si, msg_option1
	call print_string
	mov si, msg_option2
	call print_string
	mov si, msg_option3
	call print_string
	mov si, msg_prompt
	call print_string

get_input:
	mov ah, 0x00
	int 0x16

	cmp al, '1'
	je .input_valid
	cmp al, '2'
	je .input_valid
	cmp al, '3'
	je .input_valid

	jmp get_input

.input_valid
	mov ah, 0x0E
	int 0x10
	
	cmp al, '1'
	je boot_distro
	cmp al, '2'
	je boot_kernel
	cmp al, '3'
	je boot_myKernel

boot_distro:
	mov si, msg_boot_distro
	call print_string
	jmp prepare_multiboot_and_pm

boot_kernel:
	mov si, msg_boot_kernel
	call print_string
	jmp prepare_multiboot_and_pm

boot_myKernel:
	mov si, msg_boot_myKernel
	call print_string

	mov ax, 0x0000
	mov ds, ax
	mov es, ax
	mov bx, 0x9000

	mov ah, 0x02
	mov al, 1
	mov ch, 0
	mov cl, 6
	mov dh, 0
	mov dl, [boot_drive]
	
	int 0x13
	jc disk_error

	jmp prepare_multiboot_and_pm

disk_error:
	mov si, msg_error
	call print_string
	hlt
	jmp $	

prepare_multiboot_and_pm:
	mov si, msg_switching
	call print_string

	cli
	in al, 0x92
	or al, 2
	out 0x92, al
	lgdt[gdt_descriptor]

	mov eax, cr0
	or eax, 1
	mov cr0, eax
	jmp 0x08:init_pm

print_string:
	lodsb
	or al, al
	jz .done
	mov ah, 0x0E
	int 0x10
	jmp print_string
.done:
	ret

[BITS 32]
init_pm:
	mov ax, 0x10
	mov ds, ax
	mov es, ax
	mov fs, ax
	mov gs, ax
	mov ss, ax

	mov esp, 0x90000

	mov esi, 0x9000
	mov edi, 0x100000
	mov ecx, 128
	rep movsb

	mov ebx, 0x100000
	jmp ebx
	hlt

boot_drive db 0
;--teks menu--
msg_header	 db "=======================================", 13, 10
			   db "          MULTIBOOT BOOTLOADER         ", 13, 10
			   db "=======================================", 13, 10, 0
msg_option1	db "1. Distro", 13, 10, 0
msg_option2	db "2. Kernel", 13, 10, 0
msg_option3	db "3. MyKernel", 13, 10, 0
msg_prompt	 db 13, 10, "Pilih OS untuk di-boot (1-3): ", 0

msg_boot_distro	db 13, 10, "Loading distro components...", 13, 10, 0
msg_boot_kernel	db 13, 10, "Loading kernel...", 13, 10, 0
msg_boot_myKernel	db 13, 10, "Preparing MyKernel...", 13, 10, 0
msg_switching		db "Entering Protected Mode...", 13, 10, 0
msg_error			db 13, 10, "DISK READ ERROR!", 13, 10, 0

;--- GDT (Global Descriptor Table) ---
gdt_start:

gdt_null:
	dd 0x0
	dd 0x0

gdt_code:
	dw 0xFFFF
	dw 0x0
	db 0x0
	db 10011010b
	db 11001111b
	db 0x0

gdt_data:
	dw 0xFFFF
	dw 0x0
	db 0x0
	db 10010010b
	db 11001111b
	db 0x0

gdt_end:

gdt_descriptor:
	dw gdt_end - gdt_start - 1
	dd gdt_start
	
times 2048 - ($ - $$) db 0
