export class UserController {
    constructor(private userService: any) {}

    async createUser(req: any, res: any) {
        try {
            const userData = req.body;
            const newUser = await this.userService.createUser(userData);
            res.status(201).json(newUser);
        } catch (error) {
            res.status(500).json({ message: 'Erro ao criar usuário', error });
        }
    }

    async getUser(req: any, res: any) {
        try {
            const userId = req.params.id;
            const user = await this.userService.getUser(userId);
            if (user) {
                res.status(200).json(user);
            } else {
                res.status(404).json({ message: 'Usuário não encontrado' });
            }
        } catch (error) {
            res.status(500).json({ message: 'Erro ao obter usuário', error });
        }
    }
}