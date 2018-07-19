
BUILD_DIR= ./../build/kernel
FLAGS_COMPILE+= -m32 -masm=intel -ggdb3 -gdwarf-4 -ffreestanding -nostdlib 


.PHONY= clean
all: $(BUILD_DIR)/kernel


$(BUILD_DIR)/kernel: $(BUILD_DIR)/kernel.o
	ld -m elf_i386 -T kernel.lds $< -o $@ 

$(BUILD_DIR)/kernel.o: kernel.c
	gcc $(FLAGS_COMPILE) -c $< -o $@


clean:
	rm $(BUILD_DIR)/*
