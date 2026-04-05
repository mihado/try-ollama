default: deps

MODELS = \
	bge-m3:latest \
	deepseek-ocr \
	gemma3:12b \
	gemma4:26b \
	gemma4:31b \
	gemma4:e4b \
	glm-ocr \
	mxbai-embed-large:latest \
	nomic-embed-text \
	qwen3.5:9b

deps:
	@for model in $(MODELS); do \
		echo "Pulling $$model..."; \
		ollama pull $$model; \
	done

upgrade-ollama:
	./upgrade-ollama.sh

upgrade-webui:
	docker pull ghcr.io/open-webui/open-webui:main
	docker compose stop
	docker compose up -d
