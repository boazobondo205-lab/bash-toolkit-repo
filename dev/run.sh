#!/bin/bash

file=$1
output=""
if [[ $file == *.c ]]; then
  gcc "$file" -o output
  if [ &? -eq 0 ]; then
    ./output
  else
    echo "Compilation failed"
  fi
else
  echo "Unsupported file type: $file"
fi
