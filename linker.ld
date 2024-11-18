OUTPUT_FORMAT(elf32-i386)
ENTRY(main)
SECTIONS
{
    . = 0x100000; /* Carregar o kernel no endereço 1 MB */
    .text : {
        *(.text)
    }
    .data : {
        *(.data)
    }
    .bss : {
        *(.bss)
    }
}
