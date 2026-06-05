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
	copy /b boot_stage1.bin + boot_stage2.bin bootloader.bin

run:
	qemu-system-i386 -drive format=raw,file=bootloader.bin

clean:
	del *.bin
