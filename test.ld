ENTRY(main)

SECTIONS
{
	. = 0x401000;
	.text : { *(.text) }
	. = 0x402000;
	.data : { *(.data) }
	. = 0x403000;
	.bss : { *(.bss) }
}
