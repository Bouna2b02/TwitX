const express = require('express');
require('./db/mongoose');
const userRouter = require('./routers/user');
const tweetRouter = require('./routers/tweet');
const notificationRouter = require('./routers/notification');
const swaggerJsDoc = require('swagger-jsdoc');
const swaggerUi = require('swagger-ui-express');

const app = express();
const port = process.env.PORT || 3000;

const options = {
    definition: {
        openapi: '3.0.0',
        info: {
            title: 'Twitter API',
            version: '1.0.0',
            description: 'Twitter API',
        },
        servers: [
            {
                url: 'http://localhost:3000',
            },
        ],
    },
    apis: ['./src/routers/*.js'],
};

const specs = swaggerJsDoc(options);
app.use(
    '/api-docs',
    swaggerUi.serve,
    swaggerUi.setup(specs)
);

app.use(express.json());
app.use(userRouter);
app.use(tweetRouter);
app.use(notificationRouter);

app.listen(port, () => {
    console.log('Le serveur est lancé sur le port ' + port);
});
