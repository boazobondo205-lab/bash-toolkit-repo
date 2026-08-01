#!/bin/bash

host=$1
ports="22 80 443 21 3306"

if [ $# -eq 0 ]; then
  echo "No host"
  exit 1
else
echo "HOST: $host"
fi

for port in $ports; do
  echo "Checking port: $port"
done

