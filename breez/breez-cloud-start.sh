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

echo "export PATH=\$PATH:~/flutter/bin" >> ~/.bashrc

cd
echo "Done 🍻"
