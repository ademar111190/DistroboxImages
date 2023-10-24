#!/bin/bash
echo "Starting 🍻"

echo "export ANDROID_HOME=\"/home/ademar/Box/jetbrains/Android/Sdk\"" >> ~/.bashrc
echo "export ANDROID_NDK_HOME=\"/home/ademar/Box/jetbrains/Android/Sdk/ndk/25.2.9519653\"" >> ~/.bashrc
echo "export JAVA_HOME=\"/home/ademar/Box/jetbrains/.local/share/JetBrains/Toolbox/apps/android-studio/jbr\"" >> ~/.bashrc
echo "export PATH=\$PATH:\"\$JAVA_HOME/bin\"" >> ~/.bashrc
echo "export PATH=\$PATH:\"/home/ademar/Box/jetbrains/Android/Sdk/platform-tools\"" >> ~/.bashrc
echo "export PATH=\$PATH:\"/home/ademar/Box/jetbrains/Android/Sdk/emulator\"" >> ~/.bashrc
echo "export PATH=\$PATH:\"/home/ademar/Box/jetbrains/Android/Sdk/cmdline-tools/latest/bin\"" >> ~/.bashrc

echo "install rust"
curl https://sh.rustup.rs -sSf | sh

echo "install flutter"
git clone --depth 1 --branch 3.7.12 https://github.com/flutter/flutter.git ~/flutter
~/flutter/bin/flutter precache

echo "install react native deps"
curl -sSLO https://github.com/pinterest/ktlint/releases/download/1.0.1/ktlint && chmod a+x ktlint && sudo mv ktlint /usr/local/bin/
curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh
/home/linuxbrew/.linuxbrew/bin/./brew install swiftformat
npm cache clear --force
curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list
sudo apt-get update
sudo apt-get install yarn -y
sudo yarn global add tslint typescript --global
cargo install breez-sdk-rn-generator --git https://github.com/breez/breez-sdk-rn-generator

echo "exporting paths"
echo "export PATH=\$PATH:~/flutter/bin" >> ~/.bashrc
echo "export PATH=\$PATH:/home/linuxbrew/.linuxbrew/bin" >> ~/.bashrc

cd
echo "Done 🍻"
