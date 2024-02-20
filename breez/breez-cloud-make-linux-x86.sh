#!/bin/bash
echo "Starting 🍻"

echo "Building the core ❤️‍🔥"
cd libs/sdk-core
make x86_64-unknown-linux-gnu
cd - 

echo "Running the CLI 🖥"
cd tools/sdk-cli
cargo run
cd -

echo "Done 🍻"
