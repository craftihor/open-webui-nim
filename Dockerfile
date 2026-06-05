FROM ghcr.io/open-webui/open-webui:main

ENV PORT=8080
ENV DATA_DIR=/app/backend/data
ENV OLLAMA_BASE_URL=""
ENV USE_OLLAMA_DOCKER=false
ENV USE_CUDA_DOCKER=false

EXPOSE 8080

CMD ["bash", "start.sh"]
