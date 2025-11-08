#!/bin/bash

# Script para inicializar o banco de dados

# Defina as variáveis de conexão com o banco de dados
DB_HOST="localhost"
DB_PORT="5432"
DB_NAME="your_database_name"
DB_USER="your_username"
DB_PASSWORD="your_password"

# Função para executar comandos SQL
execute_sql() {
    PGPASSWORD=$DB_PASSWORD psql -h $DB_HOST -p $DB_PORT -U $DB_USER -d $DB_NAME -f "$1"
}

# Inicializa o banco de dados
echo "Inicializando o banco de dados..."

# Executa as migrações
echo "Executando migrações..."
execute_sql "./src/db/migrations/001-init.sql"

# Insere dados iniciais
echo "Inserindo dados iniciais..."
execute_sql "./src/db/seeds/seed-data.sql"

echo "Banco de dados inicializado com sucesso!"