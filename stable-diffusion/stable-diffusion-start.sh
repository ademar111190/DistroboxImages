#!/bin/bash
echo "Starting 🍻"

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
