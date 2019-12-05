'use strict'

const express = require ('express');
const router = express.Router();
const controller = require('../controllers/user-controller');

router.post('/',controller.post);
router.get('/',controller.get);
router.get('/login',controller.doLogin);
//router.post('/login',controller.doLogin);
router.get('/cpf/:cpf',controller.getByCpf);

module.exports = router;
