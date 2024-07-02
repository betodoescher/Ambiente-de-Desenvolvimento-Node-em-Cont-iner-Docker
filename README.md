# Ambiente de Desenvolvimento em Contêiner Docker

Este repositório contém a configuração para um ambiente de desenvolvimento utilizando Docker e Docker Compose. Este ambiente inclui várias ferramentas e configurações essenciais para o desenvolvimento de microserviços.

## Índice

- [Requisitos](#requisitos)
- [Instalação](#instalação)
- [Configuração](#configuração)
- [Uso](#uso)
- [Volumes](#volumes)
- [Portas](#portas)
- [SSH e Credenciais](#ssh-e-credenciais)
- [Remoção de Configurações do Contêiner no VSCode](#remoção-de-configurações-do-contêiner-no-vscode)
- [Contribuição](#contribuição)
- [Licença](#licença)

## Requisitos

- Docker: [Instalar Docker](https://docs.docker.com/get-docker/)
- Docker Compose: [Instalar Docker Compose](https://docs.docker.com/compose/install/)

## Instalação

1. Clone este repositório:
    ```bash
    git clone https://github.com/seu-usuario/seu-repositorio.git
    cd seu-repositorio
    ```

2. Construa e inicie os contêineres:
    ```bash
    docker-compose up --build
    ```

## Configuração

### Variáveis de Ambiente

Certifique-se de definir as seguintes variáveis de ambiente no seu arquivo `.env` ou diretamente no `docker-compose.yml`:

- `AWS_ACCESS_KEY_ID`
- `AWS_SECRET_ACCESS_KEY`
- `AWS_DEFAULT_REGION`

## Uso

Para iniciar o ambiente de desenvolvimento, execute:

```bash
docker-compose up
