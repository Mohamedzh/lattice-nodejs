import express, { json, urlencoded } from 'express';
import helmet from 'helmet'
import patientRouter from './routes/patient'
import hospitalRouter from './routes/hospital'
import swaggerUi from 'swagger-ui-express'
import * as swaggerFile from '../swagger-output.json';

const app = express();
app.use(helmet())
app.use(urlencoded({ extended: false }));
app.use(json());
app.use('/patient', patientRouter)
app.use('/hospital', hospitalRouter)
app.use('/', swaggerUi.serve, swaggerUi.setup(swaggerFile));


app.listen(5000, () => {
    return console.log(`Express is listening on 5000`);
});