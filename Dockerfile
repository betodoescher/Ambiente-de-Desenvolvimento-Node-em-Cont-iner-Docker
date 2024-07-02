# Usar a imagem base do Ubuntu
FROM ubuntu:latest

# Definir o mantenedor da imagem
LABEL maintainer="Beto Doescher <betodoescher@gmail.com>"

# Definir o diretório de trabalho
WORKDIR /root

# Atualizar o sistema e instalar pacotes essenciais
RUN apt-get update && apt-get upgrade -y && \
    apt-get install -y build-essential curl git zsh wget unzip python3-pip snapd && \
    apt-get clean

# Instalar e configurar o Zsh e o Oh My Zsh
RUN sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" && \
    git clone https://github.com/zsh-users/zsh-autosuggestions.git /root/.oh-my-zsh/custom/plugins/zsh-autosuggestions && \
    sed -i 's/plugins=(git)/plugins=(git zsh-autosuggestions)/' /root/.zshrc

# Instalar o NVM, Node.js e definir o Node.js 16 como a versão padrão
RUN curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.0/install.sh | bash && \
    /bin/bash -c "source /root/.nvm/nvm.sh && nvm install 16 && nvm use 16 --default"

# Instalar Yarn e Serverless Framework
RUN /bin/bash -c "source /root/.nvm/nvm.sh && npm install -g yarn serverless"

# Configurar o Git
RUN git config --global user.name "Beto Doescher" && \
    git config --global user.email "betodoescher@gmail.com"

# Instalar o AWS CLI
RUN curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip" && \
    unzip awscliv2.zip && \
    ./aws/install && \
    rm -rf awscliv2.zip aws

# Configurar credenciais do AWS CLI usando variáveis de ambiente
RUN mkdir -p /root/.aws
COPY configure-aws.sh /usr/local/bin/configure-aws.sh
RUN chmod +x /usr/local/bin/configure-aws.sh

# Executar o script de configuração do AWS CLI
RUN /usr/local/bin/configure-aws.sh

# Instalar o Terraform e Terragrunt
RUN curl -LO "https://releases.hashicorp.com/terraform/0.15.5/terraform_0.15.5_linux_amd64.zip" && \
    unzip terraform_0.15.5_linux_amd64.zip && \
    mv terraform /usr/local/bin/ && \
    rm terraform_0.15.5_linux_amd64.zip && \
    curl -LO "https://github.com/gruntwork-io/terragrunt/releases/latest/download/terragrunt_linux_amd64" && \
    chmod +x terragrunt_linux_amd64 && \
    mv terragrunt_linux_amd64 /usr/local/bin/terragrunt


# Criar diretório para o volume
RUN mkdir -p /root/develop

# Gerar chave SSH, adicionar ao agente SSH e configurar ~/.ssh/config
RUN ssh-keygen -t rsa -C "betodoescher@gmail.com" -b 4096 -f /root/.ssh/id_rsa_github && \
    eval $(ssh-agent -s) && \
    ssh-add /root/.ssh/id_rsa_github && \
    touch /root/.ssh/config && \
    echo 'Host github.com\n  HostName github.com\n  PreferredAuthentications publickey\n  IdentityFile /root/.ssh/id_rsa_github' >> /root/.ssh/config

# Definir o shell padrão para Zsh
CMD [ "zsh" ]
