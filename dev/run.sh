#!/bin/bash

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
if ! grep -q "SCRIPT_DIR" ~/.bashrc; then
  echo "export PATH=\"\$PATH:$SCRIPT_DIR\"" >> ~/.bashrc
  echo "Added run.sh to PATH. Run: source ~/.bashrc (or restart your terminal)"
fi

file=$1
output=""
if [[ $file == *.c ]]; then
  gcc "$file" -o output

  if [ $? -eq 0 ]; then
    ./output
  else
    echo "Compilation failed"
  fi

elif [[ $file == *.cpp ]]; then
  g++ "file" -o output

  if [ $? -eq 0 ]; then
    ./output
  else
    echo "Compilation failed"
  fi

else
  echo "Unsupported file type: $file"
fi
