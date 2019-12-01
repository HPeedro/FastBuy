'use strict';

const mongoose = require('mongoose');
const Schema = mongoose.Schema;
const schema = new  Schema({
    title:{
        type:String,
        required:true,
    },
    description:{
        type:String,
        required:true
    },
    price:{
        type:Number,
        required:true
    },
    url:{
        type:String,
        required:true
    },
    active:{
        type:Boolean,
        default:true
    },
    tags:[{
        type:String,
        default:["GAME","XBOX","PS4","PC"]
    }]
});
module.exports = mongoose.model('Product',schema);