default: deps

MODELS = \
	bge-m3:latest \
	devstral:24b \
	embeddinggemma:latest \
	gemma3:12b \
	gemma3n:e4b \
	granite3.3:8b \
	magistral:24b \
	mistral-small3.2:24b \
	mxbai-embed-large:latest \
	nomic-embed-text \
	phi4 \
	qwen3-vl:8b \
	qwen3-coder:30b \
	qwen3:14b \
	qwen3:30b

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
