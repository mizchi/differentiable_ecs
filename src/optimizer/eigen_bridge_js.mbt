// JS/WASM: use pure MoonBit Jacobi eigendecomposition

///|
fn eigen_decompose(
  mat : Array[Double],
  n : Int32,
) -> (Array[Double], Array[Double]) {
  @linalg.eigen_symmetric(mat, n)
}
