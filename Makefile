

.PHONY= clean qemu


all: kernel.o bootloader.bin 


bootloader.bin:
	make -C bootloader

kernel.o:
	make -C ./kernel


clean:
	make -C bootloader clean
	make -C kernel clean

qemu:
	qemu-system-x86_64 -fda build/bootloader/bootloader.bin 


