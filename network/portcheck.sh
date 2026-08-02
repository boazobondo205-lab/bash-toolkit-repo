#!/bin/bash

host=$1

if [ -n "scan" ]; then
  ports="$scan"
else
  ports="22 80 443 21 3306"
fi

open_count=0

if [ $# -eq 0 ]; then
  echo "No host"
  exit 1
else
  echo "HOST: $host"
fi

for port in $ports; do
  echo "Checking port: $port"
  result=$(nc -z -w1 $host $port 2>&1)
  echo "$result"
  if nc -z -w1 "$host" "$port" 2>/dev/null; then
    echo "Port $port is OPEN"
    open_count=$((open_count +1))
    echo "$port: $open_count"
  else
    echo "Port $port is CLOSED"
  fi
done
echo "$open_count ports are open"
