# Try Ollama

https://github.com/ollama/ollama/blob/main/docs/faq.md

### Experimental Concurrency Support
```sh
sudo systemctl edit ollama
Environment="OLLAMA_HOST=0.0.0.0"
Environment="OLLAMA_NUM_PARALLEL=3"
Environemnt="OLLAMA_MAX_LOADED_MODELS=3"
Environment="OLLAMA_KEEP_ALIVE=3600"

sudo systemctl daemon-reload
sudo systemctl restart ollama
```
