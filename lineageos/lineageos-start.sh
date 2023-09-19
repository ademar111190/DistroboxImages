#!/bin/bash
echo "Starting 🍻"

echo "making folders 📂"
cd
mkdir -p ~/bin
mkdir -p ~/android/lineage

echo "linking python to python3 🐍"
sudo ln -s /usr/bin/python3 /usr/bin/python

echo "initializing git lfs 🔷"
git lfs install
ccache -M 100G

echo "cloning lineage os 🧬"
cd ~/android/lineage
repo init -u https://github.com/LineageOS/android.git -b lineage-18.1 --git-lfs
repo sync

echo "prepare code for MI A2 📱"
source build/envsetup.sh
cd ~/android/lineage/device/xiaomi/jasmine_sprout
./extract-files.sh
cd ~/android/lineage
breakfast jasmine_sprout

cd
echo "Done 🍻"
