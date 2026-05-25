## Agents runtime

O propósito é criar imagens docker que funcionem como agentes de desenvolvimento provendo ambiente de execução, skills e ferramentas para agentes de codificação.
Inicialmente será suportado somente o Pi Agent.

### Ferramentas de plataforma (OS)
- git
- gh cli
- maven
- jdk


### Ferramentas para o agente:
- Caveman: Objetivo é reduzir a quantidade de token gerados pelo agente ao longo da execução de uma tarefa.
- MCP Code Intelligence: Fornece informações sobre o código para o agente. Homemade
- Graphfy?

## Fluxo de execução:

1. A imagem base deve ter o setup do ambiente completo;
2. Entrypoint que recebe a tarefa a ser executada;
3. O container termina quando a tarefa é completamente concluída;

## Agent Manager
Responsável por fazer o dispach das tarefas para os agentes. 
