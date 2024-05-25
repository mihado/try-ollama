default: deps

deps:
	ollama pull codegemma
	ollama pull codellama
	ollama pull gemma:7b
	ollama pull llama3
	ollama pull llava
	ollama pull moondream
	ollama pull phi3
	ollama pull qwen:4b
	ollama pull wizardlm2


upgrade:
	ollama --version
	sudo systemctl stop ollama
	sudo curl -L https://ollama.com/download/ollama-linux-amd64 -o /usr/local/bin/ollama
	sudo chmod +x /usr/local/bin/ollama
	sudo systemctl restart ollama
	ollama --version
