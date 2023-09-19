#!/bin/bash
echo "Starting 🍻"

cd ~/android/lineage/
source build/envsetup.sh
croot
brunch jasmine_sprout
ls -alh out/target/product/jasmine_sprout/ | grep .zip
ls -alh out/target/product/jasmine_sprout/ | grep .img

echo "Done 🍻"
