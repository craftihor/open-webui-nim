FROM ghcr.io/open-webui/open-webui:main

USER root

RUN apt-get update && \
    apt-get install -y --no-install-recommends \
    curl jq ffmpeg pandoc git build-essential python3-dev && \
    pip install --no-cache-dir \
    yfinance pandas-datareader numpy-financial \
    plotly kaleido \
    python-pptx pdfplumber python-docx openpyxl \
    beautifulsoup4 lxml && \
    rm -rf /var/lib/apt/lists/*

ENV PORT=8080
ENV DATA_DIR=/app/backend/data
ENV OLLAMA_BASE_URL=""
EXPOSE 8080

HEALTHCHECK CMD curl --silent --fail http://localhost:${PORT:-8080}/health | jq -ne 'input.status == true' || exit 1

CMD ["bash", "start.sh"]
