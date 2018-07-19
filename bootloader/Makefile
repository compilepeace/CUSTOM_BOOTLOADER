
SOURCE=bootloader.asm
BUILD_DIR= ./../build/bootloader

.PHONY= clean 

all: $(BUILD_DIR)/bootloader.bin


$(BUILD_DIR)/bootloader.bin: $(SOURCE)
	nasm -f bin $< -o $@ 


qemu:
	qemu-system-x86_64 -fda $(BUILD_DIR)/bootloader.bin 


clean: 
	rm $(BUILD_DIR)/bootloader.bin
