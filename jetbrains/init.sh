#!/bin/bash
echo "Starting 🍻"

jetbrains-toolbox
sleep 1m # make sure the first run happened
distrobox-export --app jetbrains-toolbox
echo "You may need to fix the icon path on the file ~/.local/share/applications/<<image name>>-jetbrains-toolbox.desktop"

echo "Done 🍻"
