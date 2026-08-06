#!/bin/bash

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
if ! grep -q "$SCRIPT_DIR" ~/.bashrc; then
  echo "export PATH=\"\$PATH:$SCRIPT_DIR\"" >> ~/.bashrc
fi

if ! grep -q "$SCRIPT_DIR" ~/.zshrc; then
  echo "export PATH=\"\$PATH:$SCRIPT_DIR\"" >> ~/.zshrc
fi

echo "[IDENTITY]"
echo "User: $(whoami)"
echo "Hostname: $(hostname)"
echo "Current directory: $(pwd)"
echo ""

echo "[SYSTEM]"
echo "OS: $(grep PRETTY_NAME /etc/os-release | cut -d= -f2 | tr -d '"')"
echo "Kernel: $(uname -r)"
echo "Architecture: $(uname -m)"
echo "Uptime: $(uptime -p)"
echo ""

echo "[CPU]"
echo "Model: $(lscpu | grep 'Model name' | cut -d: -f2 | xargs)"
echo "Cores: $(nproc)"
echo ""

echo "[MEMORY]"
free -h | awk '/^Mem:/ { print "RAM: " $3 " used of " $2 " (free: " $4 ")" }'
free -h | awk '/^Swap:/ { print "Swap: " $3 " used of " $2 }'
echo ""

echo "[DISK]"
df -h --output=target,size,used,avail,pcent | sed '1d' | while read -r target size used avail pcent; do
  echo "Mount: $target | Size: $size | Used: $used | Available: $avail | Use: $pcent"
done
echo ""

echo "[NETWORK]"
ip -brief addr show

echo "Default route:"
ip route | grep default || echo "No default route found"
echo""

echo "[TOP PROCESSES]"
ps -eo pid,comm,%cpu --sort=-%cpu | head -n 6
echo ""

echo "[LOGINS]"
who | head -n 5
echo ""

echo "[SHELL ENVIRONMENT]"
echo "Shell: $SHELL"
echo "TERM: $TERM"
echo "EDITOR: ${EDITOR:-not set}"

echo ""
echo "-Snapshot Complete."
