#!/bin/bash

rm -rf tmp/ollama
mkdir -p tmp/ollama
# Download new .tar.zst and extract to tmp/ollama (old pattern)
curl -fL --progress-bar https://ollama.com/download/ollama-linux-amd64.tar.zst | tar --zstd -x -C tmp/ollama

# ollama --version

if [ "$(ollama --version 2>/dev/null)" == "$(tmp/ollama/bin/ollama --version)" ]; then
	echo "ollama is up to date"
	exit 0
else
	echo "upgrading ollama"
fi

sudo systemctl stop ollama

sudo rm -f /usr/bin/ollama
sudo rm -rf /usr/lib/ollama
sudo cp -f tmp/ollama/bin/ollama /usr/bin
sudo cp -r tmp/ollama/lib/ollama /usr/lib/

sudo chmod +x /usr/bin/ollama
sudo systemctl restart ollama

# check if ollama is up to date & running
ollama --version
