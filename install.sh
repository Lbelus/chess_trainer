#!/bin/bash

set -e

echo "Updating package list..."
sudo apt-get update

echo "Installing dependencies: stockfish and zip..."
sudo apt-get install -y stockfish zip jq

echo "Installing Nibbler (Rooklift engine visualizer)..."
curl -fsSL https://raw.githubusercontent.com/rooklift/nibbler/master/files/scripts/install.sh | bash

mkdir -p ~/.nibbler
CONFIG="$HOME/.nibbler/engines.json"

if [ ! -f "$CONFIG" ]; then
  echo '[{"name": "Stockfish", "path": "/usr/games/stockfish", "args": []}]' > "$CONFIG"
  echo "Created Nibbler config with Stockfish."
else
  echo "File exists. Please edit it manually to avoid corrupting the JSON."
fi


# if running from novnc2 then exec with /opt/nibble/nibble --no-sandbox
