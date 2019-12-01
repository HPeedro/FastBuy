'use strict';

const mongoose = require('mongoose');
const Schema = mongoose.Schema;
const schema = new  Schema({
    createDate:{
        type:Date,
        required:true,
        default:Date.now
    },
    status:{
        type:String,
        required:true,
        enum:['created','done'],
        default:'created'
    },
    customer:{
        type:mongoose.Schema.Types.ObjectId,
        ref:'User',
        required:true
    },
    items:[{
        quantity:{
            type:Number,
            require:true,
            default:1
        },
        product:{
            type:mongoose.Schema.Types.ObjectId,
            ref:'Product',
            required:true
        }

    }]
    
});
module.exports = mongoose.model('Pedido',schema);