#!/bin/bash
echo "Starting 🍻"

echo "*********"
echo "MAKE SURE SESLINUX IS PERMISSIVE"
echo "check it with 'sestatus' and if not permissive run 'sudo setenforce 0' on host machine"
echo "*********"

echo "Setting users"
sudo usermod -a -G render,video $LOGNAME

echo "Editing bash file"
echo "export PATH=\${PATH}:/opt/rocm-5.7.1/bin" >> ~/.bashrc
source ~/.bashrc

echo "execstack"
sudo execstack -c /opt/rocm/lib/*.so
sudo execstack -c /opt/rocm/lib/*.so.*

cd
git clone https://github.com/AUTOMATIC1111/stable-diffusion-webui
cd stable-diffusion-webui
git checkout 4afaaf8a020c1df457bcf7250cb1c7f609699fa7
python3 -m venv venv
source venv/bin/activate
python3 -m pip install --upgrade pip wheel
./webui.sh --precision full --no-half
cd

echo "Done 🍻"
