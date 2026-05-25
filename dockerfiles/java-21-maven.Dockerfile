# Agent runtime: Java 21 + Maven + Pi CLI + gh CLI
FROM eclipse-temurin:21-jdk

RUN apt-get update && \
    apt-get install -y --no-install-recommends \
        curl \
        git \
        unzip \
        ca-certificates \
        maven \
        gh \
        nodejs \
        npm \
        gnupg && \
    rm -rf /var/lib/apt/lists/*

## Criando um usuário não-root para execução
RUN useradd -m -s /bin/bash agent

## Definindo o usuário como padrão
USER agent


## Instalando o Pi CLI
RUN curl -fsSL https://pi.dev/install.sh | sh

# Adicionando no path
ENV PATH="/home/agent/.local/bin:$PATH"

WORKDIR /workspace
