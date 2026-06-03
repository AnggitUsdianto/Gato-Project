[BITS 16]
[ORG 0x8000]

stage2_start:
	xor ax, ax
	mov ds, ax
	mov es, ax

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
	je boot_distro
	cmp al, '2'
	je boot_kernel
	cmp al, '3'
	je boot_myKernel

	jmp get_input

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
	jmp prepare_multiboot_and_pm

prepare_multiboot_and_pm:
	mov si, msg_switching
	call print_string
	hlt
	jmp $

print_string:
	lodsb
	or al, al
	jz .done
	mov ah, 0x0E
	int 0x10
	jmp print_string
.done:
	ret

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

times 2048 - ($ - $$) db 0
