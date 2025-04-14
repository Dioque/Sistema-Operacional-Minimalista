



e meu kernel

#![no_std]
#![no_main]

mod lib {
    pub mod soma;
}

use core::panic::PanicInfo;
use lib::soma::soma;

const VGA_BUFFER: *mut u8 = 0xb8000 as *mut u8;

#[no_mangle]
pub extern "C" fn _start() -> ! {
    let resultado = soma(42, 27);

    write_str("Resultado: ");
    write_number(resultado);

    loop {}
}

fn write_str(s: &str) {
    let mut offset = 0;
    for byte in s.bytes() {
        unsafe {
            *VGA_BUFFER.offset(offset) = byte;
            *VGA_BUFFER.offset(offset + 1) = 0x0F;
        }
        offset += 2;
    }
}

fn write_number(mut n: u64) {
    let mut digits = [0u8; 20];
    let mut i = 0;

    if n == 0 {
        digits[0] = b'0';
        i = 1;
    } else {
        while n > 0 {
            digits[i] = b'0' + (n % 10) as u8;
            n /= 10;
            i += 1;
        }
    }

   
    for j in (0..i).rev() {
        unsafe {
            let offset = (12 + i - j - 1) * 2;
            *VGA_BUFFER.offset(offset as isize) = digits[j];
            *VGA_BUFFER.offset((offset + 1) as isize) = 0x0F;
        }
    }
}

#[panic_handler]
fn panic(_info: &PanicInfo) -> ! {
    loop {}
}
