import { date, z } from 'zod'
import { Request, Response} from 'express';
import { prisma } from "../lib/prisma" 


export default {
    async showCadastro(req: Request, res: Response) {
        res.render
    },

    async showUsers(req: Request, res: Response) {
        
    },

   async cadastro(req: Request, res: Response) {

        
       
       const createUser = z.object({
           nome: z.string(),
           cpf: z.string(),
           
        });
        
        const { nome, cpf } = createUser.parse(req.body)

        await prisma.membro.create({
            data: {
                nome,
                cpf,
                
            }
            
            
        })

        
   },
}