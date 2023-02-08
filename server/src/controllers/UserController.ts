import { date, z } from "zod";
import cpfValidator from 'cpf'
import { Request, Response } from "express";
import { prisma } from "../lib/prisma";

export default {
  async showCadastro(req: Request, res: Response) {
    res.render;
  },

  async showUsers(req: Request, res: Response) {

  },

  async cadastro(req: Request, res: Response) {
    const createUser = z.object({
      nome: z.string(),
      cpf: z.string(),
    });

    
    let { nome, cpf } = createUser.parse(req.body);
    
    console.log(cpf)
    
    if(cpfValidator.isValid(cpf)){
        cpf = cpfValidator.format(cpf)
            
    await prisma.membro.create({
      data: {
        nome,
        cpf,
      },
    });

    console.log(cpf)
    } else {
        console.log('CPF não é valido')
    }
  },
};
