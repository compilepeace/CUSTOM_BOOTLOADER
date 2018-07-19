
PHDRS
{
    code PT_LOAD FLAGS(0x4 | 0x1);
	headers	PT_PHDR PHDRS FILEHDR; 
}


SECTIONS
{
	. = 0x500;
	.text : { *(.text) } :code
	.data : { *(.data) } 
	.bss  : { *(.bss) }

	/DISCARD/ : { *(.eh_frame) }
}
