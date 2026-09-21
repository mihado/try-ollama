default: deps

MODELS = \
	gemma4:e4b \
	medgemma1.5:4b \
	muse-glimmer:30b \
	mxbai-embed-large:latest \
	nomic-embed-text \
	ornith-1.5:9b \
	qwen3.5:9b \
	qwen3-embedding:0.6b \
	qwen3-embedding:4b \
	qwen3-embedding:8b \
	dengcao/Qwen3-Reranker-8B:Q5_K_M

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
