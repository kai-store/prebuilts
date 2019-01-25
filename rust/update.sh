#!/bin/bash

# Parameter is the host default.
# eg: x86_64-unknown-linux-gnu or x86_64-apple-darwin

set -x

# Remove the old toolchain.
git rm -r $1

# Installs the stable version of the Rust compiler locally.

export CARGO_HOME=`pwd`/$1/cargo
export RUSTUP_HOME=`pwd`/$1/rustup
export PATH=`pwd`/$1/cargo/bin:$PATH

curl https://sh.rustup.rs -sSf | sh -s -- -y --no-modify-path --default-host $1

# We are targeting the stable releases.
rustup default stable

# Add the cross compilation target.
rustup target add armv7-linux-androideabi

# Remove the docs to save some space.
rm -rf $RUSTUP_HOME/toolchains/stable-$1/share

# Compile and install bindgen with the newly installed rustc.
cargo install -f bindgen

# Only add the executable, but not the whole cargo registry!
rm -rf $1/cargo/registry
rm -rf $1/rustup/tmp
rm $1/cargo/.crates.toml

# Track the newly installed toolchain.
git add $1
