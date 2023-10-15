#!/bin/bash
echo "Starting 🍻"

cd ~/stable-diffusion-webui
source venv/bin/activate
TORCH_COMMAND='pip install torch torchvision --extra-index-url https://download.pytorch.org/whl/rocm5.1.1' \
    python launch.py --precision full --no-half --upcast-sampling --skip-torch-cuda-test
./webui.sh --precision full --no-half --upcast-sampling --skip-torch-cuda-test

cd
echo "Done 🍻"
