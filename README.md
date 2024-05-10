# Try Ollama

```sh
sudo systemctl edit ollama
Environment="OLLAMA_HOST=0.0.0.0"
Environment="OLLAMA_NUM_PARALLEL=3"
Environemnt="OLLAMA_MAX_LOADED_MODELS=3"

sudo systemctl daemon-reload
sudo systemctl restart ollama
```
