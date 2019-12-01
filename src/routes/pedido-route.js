'use strict'

const express = require ('express');
const router = express.Router();
const controller = require('../controllers/pedido-controller');
const dbuser = require('../dbusuario') 


router.post('/:id',controller.post);
router.get('/',controller.get);
router.get('/ped',controller.getById);


module.exports = router;

router.get('/pedido', (req, res, next) => {
    let usuario = req.query;
    console.log(req.query);
            // res.status(200).send(data);
            let user = dbuser.getUsuario();
            res.render('pedido.ejs', {
                 user
            });

});