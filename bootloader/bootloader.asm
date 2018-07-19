;###################################################################################################
;
;	Author  : Abhinav Thakur
;	Email   : compilepeace@gmail.com
; 	
;	bootloader.asm : A simple bootloader program
;
;###################################################################################################


org 0x7c00			; Load stuff at offset 0x7c00
bits 16				; 16-bit mode


start:
	mov bx, 0x0                 ; dx acts as a counter to print message string
	mov si, message             ; si acts as a marker


	; Print a WELCOME message
	call print_char			


halt:
	cli				; clear IF 
	hlt				; Stop execution	



message: db "H3ll0 Critical, bootloader is active", 0xa, 0xd, 0x0
msg_len	equ $-message



;-------------------------------------------- PROCEDURES --------------------------------------------

print_char:
    mov al, [si]            ; charecer to be printed
    or  al, al              ; check if al is NULL '0x0'
    jz  halt                ; stop execution if ZF is set
    call service_putchar    ; otherwise print the charecter and
    inc si                  ; increment SI to next charecter
    jmp print_char          ; jump to start to print next charecter 


service_putchar:
    mov ah, 0xe         ; write a charecter in TTY mode
    mov bl, 0xff        ; charecter color
    int 0x10            ; video interrupt 
	ret
	
;----------------------------------------------------------------------------------------------------


; clearing out the unused space from the first sector (512 bytes) to zeroes leaving last 2 bytes 
; which are to be set to 0xAA55 (in little endian byte order), bellow
; '$'  - Represents the address of the instruction in which it is used
; '$$' - Represents the address where the code starts (originates).
times   510 - ($-$$)    db 0x0
dw  0xAA55          ; Boot Signature/Magic Bytes (checked by BIOS and marked as bootable)

