#!/bin/bash
echo "Starting 🍻"

echo "install flutter"
git clone --depth 1 --branch 3.13.4 https://github.com/flutter/flutter.git ~/flutter
~/flutter/bin/flutter precache

echo "export PATH=\$PATH:~/flutter/bin" >> ~/.bashrc

cd
echo "Done 🍻"
cd