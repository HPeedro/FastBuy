'use strict'

const express = require('express');
const bodyparser = require('body-parser');
const mongoose = require('mongoose');
const app = express();
const router = express.Router();

mongoose.connect('mongodb+srv://pedro:pedro@pucc01-httmr.mongodb.net/baltaio?retryWrites=true&w=majority');
const Product = require('./models/product');
const Pedido = require('./models/pedido');
const User = require('./models/user');
//carrega as rotas
const apiTeste = require('./routes/index-route');
const productsRoute = require('./routes/product-route');
const userRoute = require('./routes/user-route');
const pedidoRoute = require('./routes/pedido-route');

app.use(express.static('./src/public/'));
app.set('views', './src/public/views');
app.set('view engine', 'ejs');
//res.render('index');
app.use(bodyparser.json());
app.use(bodyparser.urlencoded({
    extended: false
}));

app.use('/', apiTeste);
app.use('/products', productsRoute);
app.use('/user', userRoute);
app.use('/pedido',pedidoRoute);
module.exports = app;