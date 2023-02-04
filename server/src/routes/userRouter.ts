import { Router } from "express";
import UserController from "../controllers/UserController";
import { prisma } from "../lib/prisma" 

const routes = Router();

routes.get('/', (req, res) => {
    return res.send('Oi galera');
});

routes.post('/create', UserController.cadastro)

export default routes;
