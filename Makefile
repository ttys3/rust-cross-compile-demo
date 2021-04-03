.PHONY: all build run release static clean test darwin windows

all: darwin

run:
	cargo run

release:
	cargo build --release

#darwin: export PKG_CONFIG_ALL_STATIC=1
darwin: export CC=o64-clang
darwin: export CXX=o64-clang++
darwin: export LIBZ_SYS_STATIC=1
darwin:
	PATH=/usr/local/darwin-ndk-x86_64/bin:$$PATH \
		 cargo build --target=x86_64-apple-darwin --release --verbose 2>&1 | tee build.log

windows:
	cargo build --release --target x86_64-pc-windows-gnu

static:
	cargo build --release --target x86_64-unknown-linux-musl

clean:
	cargo clean

test:
	cargo test

deps/archlinux:
	sudo pacman -S musl

deps/ubuntu:
	sudo apt install -y musl-tools

deps/fedora:
	sudo dnf install -y musl-gcc
