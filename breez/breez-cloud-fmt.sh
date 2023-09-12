#!/bin/bash
echo "Starting 🍻"

echo "Formatting the core ❤️‍🔥"
cd libs/sdk-core
cargo fmt
cargo clippy
cargo clippy --tests
cd - 

echo "Formatting the bindings 🌉"
cd libs/sdk-bindings
cargo fmt
cargo clippy
cargo clippy --tests
cd -

echo "Formatting the CLI 🖥"
cd tools/sdk-cli
cargo fmt
cargo clippy
cargo clippy --tests
cd -

echo "Done 🍻"
