# Agent runtime: Java 17 + Maven + Pi CLI + gh CLI
FROM eclipse-temurin:17-jdk

# Tudo em uma layer para minimizar tamanho
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
        curl \
        git \
        unzip \
        ca-certificates \
        maven \
        gh \
        gnupg && \
    rm -rf /var/lib/apt/lists/*

# Pi CLI — tenta pip, fallback para curl
RUN pip install pi-coding-agent 2>/dev/null && \
    ln -sf $(which pi) /usr/local/bin/pi 2>/dev/null; \
    if ! command -v pi &>/dev/null; then \
        curl -fsSL https://get.pi.dev 2>/dev/null | bash && \
        mv /root/.local/bin/pi /usr/local/bin/pi 2>/dev/null || true; \
    fi; \
    # Verifica se pi está disponível (não bloqueia o build se não estiver)
    command -v pi || echo "WARN: pi CLI not installed — agent will need it at runtime"

WORKDIR /workspace
