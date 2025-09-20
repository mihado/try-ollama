#!/bin/bash

rm -rf tmp/ollama
mkdir -p tmp/ollama
curl -fL --progress-bar https://ollama.com/download/ollama-linux-amd64.tgz | tar zx -C tmp/ollama

ollama --version

if [ "$(ollama --version)" == "$(tmp/ollama/bin/ollama --version)" ]; then
	echo "ollama is up to date"
	exit 0
else
	echo "upgrading ollama"
fi

rm -f /usr/bin/ollama
rm -rf /usr/lib/ollama
mkdir /usr/lib/ollama
cp -f tmp/ollama/bin/ollama /usr/bin
cp -r tmp/ollama/lib/ollama /usr/lib/

sudo systemctl stop ollama
sudo chmod +x /usr/bin/ollama
sudo systemctl restart ollama

# check if ollama is up to date & running
ollama --version
