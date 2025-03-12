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
	./upgrade-ollama.sh

upgrade-webui:
	docker pull ghcr.io/open-webui/open-webui:main
	docker compose stop
	docker compose up -d
