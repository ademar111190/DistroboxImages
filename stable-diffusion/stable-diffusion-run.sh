#!/bin/bash
echo "Starting 🍻"

cd ~/stable-diffusion-webui
source venv/bin/activate
./webui.sh --precision full --no-half --upcast-sampling

cd
echo "Done 🍻"
