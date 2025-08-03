default: deps

MODELS = \
	devstral:24b \
	gemma3:12b \
	gemma3n:e4b \
	granite3.3:8b \
	magistral:24b \
	mistral-small3.2:24b \
	mxbai-embed-large:latest \
	nomic-embed-text \
	phi4 \
	qwen2.5vl:7b \
	qwen3-coder:30b \
	qwen3:14b

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
