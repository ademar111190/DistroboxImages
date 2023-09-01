#!/bin/bash
echo "Starting 🍻"

cd
curl -fsSL https://configure.ergodox-ez.com/wally/linux -o wally
curl -fsSL https://raw.githubusercontent.com/zsa/wally/master/dist/linux64/wally.desktop -o wally-app.desktop
curl -fsSL https://github.com/zsa/wally/raw/master/dist/osx/Wally.app/Contents/Resources/Wally.icns -o Wally.icns
chmod +x wally
cd -

sudo groupadd plugdev
sudo usermod -aG plugdev $USER

echo "Done 🍻"
