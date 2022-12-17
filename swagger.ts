import swaggerAutogen from "swagger-autogen";

const doc = {
    info: {
        title: 'NodeJS-Mysql test for Lattice',
        description: 'NodeJS-Mysql test for Lattice',
    },
    host: process.env.HOST_URL || 'localhost:5000',
    schemes: ['http', 'https']
}

const outputFile = './swagger-output.json'
const endpointsFiles = ['./src/index.ts']

swaggerAutogen()(outputFile, endpointsFiles, doc);

