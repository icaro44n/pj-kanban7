class User {
    id: number;
    name: string;
    email: string;

    constructor(id: number, name: string, email: string) {
        this.id = id;
        this.name = name;
        this.email = email;
    }

    // Método para atualizar o nome do usuário
    updateName(newName: string) {
        this.name = newName;
    }

    // Método para atualizar o email do usuário
    updateEmail(newEmail: string) {
        this.email = newEmail;
    }

    // Método para converter o usuário em um objeto simples
    toJSON() {
        return {
            id: this.id,
            name: this.name,
            email: this.email
        };
    }
}

export default User;