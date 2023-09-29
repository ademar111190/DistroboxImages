#!/bin/bash
echo "Starting 🍻"

echo "Building the core ❤️‍🔥"
cd libs/sdk-core
make init x86_64-unknown-linux-gnu android
cd - 

echo "Building the bindings 🌉"
cd libs/sdk-bindings
make init bindings-android android
cd -

echo "Building the flutter 🦋"
cd libs/sdk-flutter
make init flutter_rust_bridge android
cd -

echo "Running the CLI 🖥"
cd tools/sdk-cli
cargo run
cd -

echo "Done 🍻"
