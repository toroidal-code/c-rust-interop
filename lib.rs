#![crate_type = "staticlib"]
#![allow(ctypes)]

extern crate libc;

use std::f32::consts::PI;
use std::c_str::CString;

#[no_mangle]
pub extern fn add(x:uint, y:uint) -> uint {
	x + y
}

#[no_mangle]
pub extern fn calculate() -> f32 {
	PI
}

#[no_mangle]
pub extern fn my_puts(s : *const libc::c_char) {
	unsafe {
		let c_str = CString::new(s, false);
		println!("{}", c_str.as_str().unwrap());
	}
}