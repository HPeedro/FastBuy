'use strict'

const mongoose = require('mongoose');
const Product = mongoose.model('Product');
const ValidationContract = require('../validators/fluent-validator');

exports.post = (req, res, next) => {
    var product = new Product(req.body);
    product
        .save()
        .then(x => {
            res.status(201).send({
                message: 'produto cadastrado com sucesso'
            });
        }).catch(e => {
            res.status(400).send({
                message: 'Falha ao cadastrar o produto',
                data: e
            });
        });
};
exports.get = (req, res, next) => {
    Product
        .find({
            active: true
        }, /*'title price slug'*/)
        .then(data => {
            res.status(200).send(data);
        }).catch(e => {
            res.status(400).send({
                e
            });
        });
};
exports.getById = (req, res, next) => {
    Product
        .find({
            _id: req.params.id,
            active: true
        })
        .then(data => {
            res.status(200).send(data);
        }).catch(e => {
            res.status(400).send({
                e
            });
        });
};
exports.getByTag = (req, res, next) => {
    Product
        .find({
            tags: req.params.tag,
            active: true
        })
        .then(data => {
            res.status(200).send(data);
        }).catch(e => {
            res.status(400).send({
                e
            });
        });
};
exports.put = (req, res, next) => {
    Product
       .findByIdAndUpdate(req.params.id, {
           $set: {
              title: req.body.title,
              description: req.body.description,
              price: req.body.price
          }
         }).then(x => {
        res.status(200).send({
            message: 'produto a atualizado com sucesso!'
        });
        }).catch(e => {
        res.status(400).send({
            message: 'falha ao atualizar produto',
            data: e
            });
        });
};
exports.delete = (req, res, next) => {
    Product
        .findOneAndRemove(req.body.id)
        .then(x=>{
            res.status(200).send({
                message:'produto removido com sucesso'
            });
        }).catch(e=>{
            res.status(400).send({
                message:'falha ao remover produto',
                data:e
            });
        });
};