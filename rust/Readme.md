# Prebuilt Rust toolchain

This repository provides a prebuilt stable Rust toolchain. This toolchain also includes:
- Support for the `armv7-linux-androideabi` cross compilation target.
- The `bindgen` utility used to generate Rust FFI bindings.

## Updating

Run `./update.sh $host_target` where `$host_target` is `x86_64-unknown-linux-gnu` or `x86_64-apple-darwin`.

Note that you need to run `./install.sh` on the same host architecture as your target.
