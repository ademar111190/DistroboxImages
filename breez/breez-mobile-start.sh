#!/bin/bash
echo "Starting 🍻"

echo "install go"
wget https://go.dev/dl/go1.21.0.linux-amd64.tar.gz
rm -rf ~/go && tar -C ~ -xzf go1.21.0.linux-amd64.tar.gz
rm go1.21.0.linux-amd64.tar.gz
~/go/bin/go install golang.org/x/mobile/cmd/gomobile@latest
~/go/bin/go install golang.org/x/mobile/cmd/gobind@latest

echo "export PATH=\$PATH:~/go/bin" >> ~/.bashrc

echo "install flutter"
git clone --depth 1 --branch 3.7.12 https://github.com/flutter/flutter.git ~/flutter
~/flutter/bin/flutter precache

echo "export PATH=\$PATH:~/flutter/bin" >> ~/.bashrc

cd
echo "Done 🍻"
