// JS: Date.now() returns milliseconds

///|
fn now_ms() -> Int32 {
  js_date_now()
}

///|
extern "js" fn js_date_now() -> Int32 =
  #| () => Date.now()
