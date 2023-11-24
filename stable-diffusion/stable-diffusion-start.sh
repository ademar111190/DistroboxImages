#!/bin/bash
echo "Starting 🍻"

cd
git clone https://github.com/AUTOMATIC1111/stable-diffusion-webui
cd stable-diffusion-webui
git checkout 4afaaf8a020c1df457bcf7250cb1c7f609699fa7
python3 -m pip install --upgrade pip wheel setuptools
pip install deps
pip install torch
pip3 install --pre torch torchvision torchaudio --extra-index-url https://download.pytorch.org/whl/nightly/rocm5.2/
pip install git+https://github.com/facebookresearch/xformers.git@main#egg=xformers
cd

echo "Download pix2pix"
curl -fsSL http://instruct-pix2pix.eecs.berkeley.edu/instruct-pix2pix-00-22000.ckpt -o ~/stable-diffusion-webui/models/Stable-diffusion/instruct-pix2pix-00-22000.ckpt

echo "Done 🍻"
