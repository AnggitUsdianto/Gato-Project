#=====================================================================
#TOOLCHAIN
#=====================================================================
AS = nasm
VM = qemu-system-i386

#=====================================================================
#FLAGS
#=====================================================================
VFLAGS = -drive format=raw,file=os_image.bin

#=====================================================================
#RULES
#=====================================================================
all:
	$(AS) -f bin ../bootloader/boot_stage1.asm -o boot_stage1.bin
	$(AS) -f bin ../bootloader/boot_stage2.asm -o boot_stage2.bin
	$(AS) -f bin ../kernel/kentry.asm -o kentry.bin
	copy /b boot_stage1.bin + boot_stage2.bin + kentry.bin os_image.bin

run:
	$(VM) $(VFLAGS)

clean:
	del *.bin
