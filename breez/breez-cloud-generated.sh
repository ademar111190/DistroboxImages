#!/bin/bash
echo "Starting 🍻"

echo "Removing old generated files 👴"
cd libs/sdk-core
rm src/bridge_generated.io.rs
rm src/bridge_generated.rs
cd -
cd libs/sdk-flutter
rm ios/Classes/bridge_generated.h
rm lib/bridge_generated.dart
cd -

echo "Cleaning bindings cargo 🌉"
cd libs/sdk-bindings
cargo clean
cd -

echo "Making flutter rust bridge 🦋"
cd libs/sdk-flutter
make flutter_rust_bridge
cd -

echo "Done 🍻"
