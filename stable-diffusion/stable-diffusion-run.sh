#!/bin/bash
echo "Starting 🍻"

cd ~/stable-diffusion-webui
export PYTORCH_CUDA_ALLOC_CONF=garbage_collection_threshold:0.6,max_split_size_mb:128
./webui.sh --precision full --no-half \
    --disable-model-loading-ram-optimization # Fix https://github.com/AUTOMATIC1111/stable-diffusion-webui/issues/13087#issuecomment-1710361268
    # --xformers # --upcast-sampling

cd
echo "Done 🍻"
