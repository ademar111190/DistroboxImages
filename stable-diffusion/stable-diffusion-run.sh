#!/bin/bash
echo "Starting 🍻"

cd ~/stable-diffusion-webui
source venv/bin/activate
# export HSA_OVERRIDE_GFX_VERSION=10.3.0
./webui.sh --precision full --no-half --upcast-sampling --xformers

cd
echo "Done 🍻"
