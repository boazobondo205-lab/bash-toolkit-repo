#!/bin/bash

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
if ! grep -q "SCRIPT_DIR" ~/.bashrc; then
  echo "export PATH=\"\$PATH:$SCRIPT_DIR\"" >> ~/.bashrc
  echo "Added run.sh to PATH. Run: source ~/.bashrc (or restart your terminal)"
fi

file=$1
base="${file%.*}"

if [[ $file == *.c ]]; then
  echo "DEBUG: file=[$file] base=[$base]"
  gcc "$file" -o "$base"

  if [ $? -eq 0 ]; then
    ./"$base"
  else
    echo "Compilation failed"
  fi

elif [[ $file == *.cpp ]]; then
  echo "DEBUG: file=[$file] base=[$base]"
  g++ "$file" -o "$base"

  if [ $? -eq 0 ]; then
    ./"$base"
  else
    echo "Compilation failed"
  fi

else
  echo "Unsupported file type: $file"
fi
