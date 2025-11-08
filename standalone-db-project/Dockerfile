FROM node:14

# Define o diretório de trabalho
WORKDIR /usr/src/app

# Copia os arquivos de configuração do projeto
COPY package*.json ./
COPY tsconfig.json ./
COPY config/ ./config/

# Instala as dependências do projeto
RUN npm install

# Copia o código-fonte para o contêiner
COPY src/ ./src/
COPY scripts/ ./scripts/

# Expõe a porta que a aplicação irá rodar
EXPOSE 3000

# Comando para iniciar a aplicação
CMD ["npm", "start"]