LOCAL_PATH:= $(call my-dir)
GONK_DIR:= $(abspath $(LOCAL_PATH)/../../)
RUST_TOOLCHAIN:= $(GONK_DIR)/prebuilts/rust

# Choose the Rust toolchain for the current host.
ifeq ($(HOST_OS),darwin)
RUST_HOST:=x86_64-apple-darwin
else
RUST_HOST:=x86_64-unknown-linux-gnu
endif

CARGO_HOME:= $(RUST_TOOLCHAIN)/$(RUST_HOST)/cargo
RUSTUP_HOME=$(RUST_TOOLCHAIN)/$(RUST_HOST)/rustup

include $(CLEAR_VARS)

.PHONY: rust-toolchain
rust-toolchain:
	@echo "rust-toolchain Gonk dir is $(GONK_DIR)"
	@echo "CARGO_HOME is $(CARGO_HOME)"
	@echo "RUSTUP_HOME is $(RUSTUP_HOME)"
	export PATH=$(CARGO_HOME)/bin:${PATH} && \
	export CARGO_HOME=$(CARGO_HOME) && \
	export RUSTUP_HOME=$(RUSTUP_HOME) && \
	which rustc && rustc --version
