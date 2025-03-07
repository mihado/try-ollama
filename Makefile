default: deps

deps:
	ollama pull aya-expanse:8b
	ollama pull deepseek-r1:14b
	ollama pull llama3.1
	ollama pull llama3.2
	ollama pull llama3.2-vision
	ollama pull moondream
	ollama pull nomic-embed-text
	ollama pull phi4
	ollama pull qwen2.5:14b
	ollama pull qwen2.5-coder:14b
	ollama pull qwen2.5-coder:7b-instruct
	ollama pull qwen2.5-coder:7b-base
	ollama pull yi:6b

upgrade-ollama:
	rm -rf tmp/ollama
	mkdir -p tmp/ollama
	curl -fsSL https://ollama.com/download/ollama-linux-amd64.tgz | tar zx -C tmp/ollama
	rm -f /usr/bin/ollama
	rm -rf /usr/lib/ollama
	mkdir /usr/lib/ollama
	cp -f tmp/ollama/bin/ollama /usr/bin
	cp -r tmp/ollama/lib/ollama /usr/lib/
	sudo systemctl stop ollama
	sudo chmod +x /usr/bin/ollama
	sudo systemctl restart ollama
	ollama --version

upgrade-webui:
	docker pull ghcr.io/open-webui/open-webui:main
	docker compose stop
	docker compose up -d
