#=====================================================================
#TOOLCHAIN
#=====================================================================
AS = nasm

#=====================================================================
#RULES
#=====================================================================
all:
	$(AS) -f bin ../bootloader/boot_stage1.asm -o boot_stage1.bin
	$(AS) -f bin ../bootloader/boot_stage2.asm -o boot_stage2.bin
	$(AS) -f bin ../kernel/kernel.asm -o kernel.bin
	copy /b boot_stage1.bin + boot_stage2.bin + kernel.bin os_image.bin

run:
	qemu-system-i386 -drive format=raw,file=os_image.bin

clean:
	del *.bin
