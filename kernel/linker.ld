ENTRY(_start)

SECTIONS {
    . = 0x8000;

    .text : {
        *(.text .text.*)
    }

    /DISCARD/ : {
        *(.eh_frame)
        *(.note .note.*)
    }
}