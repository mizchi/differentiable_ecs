# Changelog

## 0.2.2

- Import `moonbitlang/core/cmp` explicitly in the optimizer.
- Migrate the module and all six examples to current MoonBit manifests and
  `Int32` syntax, with local example dependencies resolved through workspaces.
- Add a deterministic optimization convergence test for JS, native and Wasm.
- Link Accelerate for native library tests and include the allocation header
  in the LAPACK C bridge.
- Replace deprecated publication excludes with `.moonignore` and reference
  the existing README in package metadata.
