const express = require('express');
const sqlite3 = require('sqlite3').verbose();
const bodyParser = require('body-parser');

const app = express();
const PORT = process.env.PORT || 3000;

// Middleware
app.use(bodyParser.json());
app.use(express.static('public')); // Para servir o index.html

// Conectar ao banco de dados SQLite
const db = new sqlite3.Database('./database.db', (err) => {
    if (err) {
        console.error(err.message);
    }
    console.log('Conectado ao banco de dados SQLite.');
});

// Criar tabela se não existir
db.run(`CREATE TABLE IF NOT EXISTS tasks (
    id TEXT PRIMARY KEY,
    text TEXT NOT NULL,
    priority TEXT NOT NULL,
    column TEXT NOT NULL
)`);

// Rota para obter todas as tarefas
app.get('/tasks', (req, res) => {
    db.all('SELECT * FROM tasks', [], (err, rows) => {
        if (err) {
            res.status(500).json({ error: err.message });
            return;
        }
        res.json(rows);
    });
});

// Rota para adicionar uma nova tarefa
app.post('/tasks', (req, res) => {
    const { id, text, priority, column } = req.body;
    db.run(`INSERT INTO tasks (id, text, priority, column) VALUES (?, ?, ?, ?)`, [id, text, priority, column], function(err) {
        if (err) {
            res.status(500).json({ error: err.message });
            return;
        }
        res.status(201).json({ id, text, priority, column });
    });
});

// Rota para atualizar uma tarefa
app.put('/tasks/:id', (req, res) => {
    const { id } = req.params;
    const { text, priority, column } = req.body;
    db.run(`UPDATE tasks SET text = ?, priority = ?, column = ? WHERE id = ?`, [text, priority, column, id], function(err) {
        if (err) {
            res.status(500).json({ error: err.message });
            return;
        }
        res.json({ id, text, priority, column });
    });
});

// Rota para deletar uma tarefa
app.delete('/tasks/:id', (req, res) => {
    const { id } = req.params;
    db.run(`DELETE FROM tasks WHERE id = ?`, id, function(err) {
        if (err) {
            res.status(500).json({ error: err.message });
            return;
        }
        res.status(204).send();
    });
});

// Iniciar o servidor
app.listen(PORT, () => {
    console.log(`Servidor rodando na porta ${PORT}`);
});