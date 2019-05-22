# CUSTOM BOOTLOADER
This is a custom bootloader intended to load a kernel (which right now is a custom elf binary). Still in development phase.

## BUILD
To build up the bootloader on your system, just type the bellow given commands

```shell
critical@d3ad:~/CUSTOM_BOOTLOADER$ make clean
make -C bootloader clean
make[1]: Entering directory '/home/critical/CUSTOM_BOOTLOADER/bootloader'
rm ./../build/bootloader/bootloader.bin
make[1]: Leaving directory '/home/critical/CUSTOM_BOOTLOADER/bootloader'
make -C kernel clean
make[1]: Entering directory '/home/critical/CUSTOM_BOOTLOADER/kernel'
rm ./../build/kernel/*
make[1]: Leaving directory '/home/critical/CUSTOM_BOOTLOADER/kernel'

critical@d3ad:~/CUSTOM_BOOTLOADER$ make
make -C ./kernel
make[1]: Entering directory '/home/critical/CUSTOM_BOOTLOADER/kernel'
gcc -m32 -masm=intel -ggdb3 -gdwarf-4 -ffreestanding -nostdlib  -c kernel.c -o ../build/kernel/kernel.o
ld -m elf_i386 -T kernel.lds ../build/kernel/kernel.o -o ../build/kernel/kernel 
make[1]: Leaving directory '/home/critical/CUSTOM_BOOTLOADER/kernel'
make -C bootloader
make[1]: Entering directory '/home/critical/CUSTOM_BOOTLOADER/bootloader'
nasm -f bin bootloader.asm -o ../build/bootloader/bootloader.bin 
make[1]: Leaving directory '/home/critical/CUSTOM_BOOTLOADER/bootloader'

```

## TEST
Now to test the bootloader, emulate the environment using qemu

```shell
critical@d3ad:~/CUSTOM_BOOTLOADER$ make qemu
qemu-system-x86_64 -fda build/bootloader/bootloader.bin 
WARNING: Image format was not specified for 'build/bootloader/bootloader.bin' and probing guessed raw.
         Automatically detecting the format is dangerous for raw images, write operations on block 0 will be restricted.
         Specify the 'raw' format explicitly to remove the restrictions.
qemu-system-x86_64: warning: TCG doesn't support requested feature: CPUID.01H:ECX.vmx [bit 5]

```


##  CREDITS
This project is inspired from the book - "**`Operating Systems: From 0 to 1`**" and a big thanks to the author **`TU, DO HOANG`** for sharing his knowledge in such an easy way. I suggest anyone who's getting started or wants to peek into the internals of how operating systems are built from scratch to go through this book.


Link to his ebook and his repository : https://github.com/tuhdo/os01


<br>

NAME  : **ABHINAV THAKUR** <br>
EMAIL : **compilepeace@gmail.com** 


