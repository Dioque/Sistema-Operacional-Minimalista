#![no_std]   // Sem libstd
#![no_main]  // Ponto de entrada personalizado

use core::panic::PanicInfo;

/// Ponto de entrada do kernel (chamado pelo bootloader)
#[no_mangle]
pub extern "C" fn _start() -> ! {
    // Seu código do kernel começa aqui!
    loop {}
}

/// Handler para panics (obrigatório em `no_std`)
#[panic_handler]
fn panic(_info: &PanicInfo) -> ! {
    loop {}
}