# Standalone Database Project

Este projeto é uma aplicação independente que gerencia um banco de dados. Ele inclui funcionalidades para criar, ler e manipular dados de usuários, além de scripts para inicialização e configuração do banco de dados.

## Estrutura do Projeto

- **src/**: Contém o código-fonte da aplicação.
  - **index.ts**: Ponto de entrada da aplicação.
  - **db/**: Gerencia a conexão com o banco de dados.
    - **client.ts**: Classe para gerenciar a conexão com o banco de dados.
    - **migrations/**: Scripts SQL para migrações do banco de dados.
      - **001-init.sql**: Script para inicialização do banco de dados.
    - **seeds/**: Scripts SQL para inserção de dados iniciais.
      - **seed-data.sql**: Dados iniciais para o banco de dados.
  - **models/**: Define os modelos de dados.
    - **user.ts**: Modelo de usuário.
  - **controllers/**: Gerencia a lógica de negócios.
    - **userController.ts**: Controlador para operações de usuário.
  - **utils/**: Funções utilitárias.
    - **logger.ts**: Função para registro de logs.

- **scripts/**: Scripts auxiliares.
  - **init-db.sh**: Script para inicialização do banco de dados.

- **config/**: Configurações do projeto.
  - **default.json**: Configurações padrão, incluindo informações de conexão com o banco de dados.

- **Dockerfile**: Instruções para construir a imagem Docker do projeto.

- **docker-compose.yml**: Define os serviços e configurações para execução em Docker.

- **package.json**: Configuração do npm, incluindo dependências e scripts.

- **tsconfig.json**: Configuração do TypeScript.

## Como Executar

1. Clone o repositório.
2. Instale as dependências com `npm install`.
3. Execute o script de inicialização do banco de dados com `bash scripts/init-db.sh`.
4. Inicie a aplicação com `npm start`.

## Contribuição

Sinta-se à vontade para contribuir com melhorias ou correções. Abra um pull request ou um issue para discutir mudanças.

## Licença

Este projeto está licenciado sob a MIT License. Veja o arquivo LICENSE para mais detalhes.