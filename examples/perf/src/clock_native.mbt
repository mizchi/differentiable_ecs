// Native: use C clock via stub

///|
fn now_ms() -> Int32 {
  clock_ms_native()
}

///|
extern "C" fn clock_ms_native() -> Int32 = "clock_ms_native"
