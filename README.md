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
```

### Para acessar o contêiner em execução:

```bash
docker exec -it nome-do-servico-dev-environment bash
```

## Volumes

Os volumes são utilizados para persistir dados e compartilhar arquivos entre o host e o contêiner. Neste repositório, configuramos um volume chamado develop para armazenar os microserviços:

```bash
volumes:
  - ./develop:/root/develop
```

## Portas

As portas configuradas para serem expostas estão definidas no arquivo docker-compose.yml. Por exemplo:

```bash
volumes:
  - "3000:3000"
  - "3200:3200"
```

## SSH e Credenciais

As chaves SSH e configurações relacionadas são geradas e configuradas automaticamente durante a construção do contêiner. Veja o Dockerfile para mais detalhes.


## Contribuição

Contribuições são bem-vindas! Sinta-se à vontade para abrir um problema ou enviar um pull request.

## Licença

Este projeto está licenciado sob a licença MIT. Consulte o arquivo LICENSE para obter mais informações.

```bash
Certifique-se de substituir `nome-do-servico-dev-environment` pelo nome real do seu serviço definido no `docker-compose.yml`.
```