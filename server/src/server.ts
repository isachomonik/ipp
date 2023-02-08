import express, {Express, Request, Response} from 'express';
import userRouter from './routes/userRouter'

const app: Express = express();
const port = 3000;


app.use(express.json()) // Transformar em JSON
app.use('/users', userRouter)

app.get('/', (req: Request, res: Response) => {
    res.send('Running bb');
});

app.listen(port, () => {
    console.log(`[Server]: I am running at http://localhost:${port}`)
});