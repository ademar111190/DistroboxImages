#!/bin/bash
echo "Starting 🍻"

dart format -l 110 .
dart analyze --fatal-infos

echo "Done 🍻"
