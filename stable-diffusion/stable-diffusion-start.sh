#!/bin/bash
echo "Starting 🍻"

cd
git clone https://github.com/AUTOMATIC1111/stable-diffusion-webui
cd stable-diffusion-webui
python3 -m venv venv
source venv/bin/activate
python3 -m pip install --upgrade pip wheel

cd
echo "Done 🍻"
