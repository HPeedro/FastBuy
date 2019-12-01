'use strict'

const express = require('express');
const router = express.Router();
const controller = require('../controllers/product-controller');

router.post('/',controller.post);
router.get('/',controller.get);
router.get('/id/:id',controller.getById);
router.get('/tags/:tag',controller.getByTag);
router.put('/:id',controller.put);
router.delete('/',controller.delete);

module.exports = router;