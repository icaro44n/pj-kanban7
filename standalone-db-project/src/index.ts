import { DatabaseClient } from './db/client';
import { UserController } from './controllers/userController';
import { log } from './utils/logger';

async function main() {
    const dbClient = new DatabaseClient();
    
    try {
        await dbClient.connect();
        log('Conexão com o banco de dados estabelecida.');

        const userController = new UserController();
        // Aqui você pode adicionar chamadas para métodos do userController, como:
        // await userController.createUser({ name: 'Exemplo', email: 'exemplo@dominio.com' });

    } catch (error) {
        log('Erro ao conectar ao banco de dados: ' + error.message);
    } finally {
        await dbClient.disconnect();
        log('Conexão com o banco de dados encerrada.');
    }
}

main();