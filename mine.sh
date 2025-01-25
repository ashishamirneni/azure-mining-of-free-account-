#!/bin/bash

# Exit script on error
set -e

echo "Step 1: Installing dependencies..."
sudo apt-get update -y
sudo apt-get install -y git build-essential cmake libuv1-dev libssl-dev libhwloc-dev jq

echo "Step 2: Cloning the XMRig repository..."
if [ ! -d "xmrig" ]; then
    git clone https://github.com/xmrig/xmrig.git
else
    echo "XMRig repository already exists. Skipping clone."
fi

echo "Step 3: Building XMRig..."
cd xmrig
mkdir -p build
cd build
cmake ..
make
./xmrig -o xmrpool.eu:9999 -u 42diRezQkaB2QG8iJvgenvYw8BG1Xqgf78PGda1ymb9LJrWCQ1fZ41N84hHYzwgjSocvkhGEwskQe9k5MxkYynefF9oZyCw -k --tls


