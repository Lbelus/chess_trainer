# -al/bin/bash

wget -q -O - https://dl.google.com/linux/linux_signing_key.pub | apt-key add -

set -e

apt-get update
apt-get install -y stockfish zip curl

curl -fsSL https://raw.githubusercontent.com/rooklift/nibbler/master/files/scripts/install.sh | bash

mkdir -p /root/.nibbler
CONFIG="/root/.nibbler/engines.json"
if [ ! -f "$CONFIG" ]; then
  echo '[{"name": "Stockfish", "path": "/usr/games/stockfish", "args": []}]' > "$CONFIG"
fi

exec /opt/nibbler/nibbler --no-sandbox
