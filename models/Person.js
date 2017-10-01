var bookshelf = require('./bookshelf');
var Joi = require('joi');
var Promise = require('bluebird');

var Person = bookshelf.Model.extend({
    tableName : 'person',
    /*schema : {
        name : String,
        age : Number
    }*/
    //https://github.com/hapijs/joi/blob/v11.1.1/API.md
    //name: Joi.string().required()
    //name: Joi.string().regex()
    //name: Joi.string().min(1).max(50).alphnum().required() -- pode colocar várias validações
    //name: Joi.string().dafault('DUDU').required() -- caso for requerido e vier vazio
    schema : {
        name : Joi.string().required(),
        age : Joi.number().integer(),
        idtipousuario : Number
    },
     adddres: function() {
         // Relacionamento
         
         return this.belongsTo(Address); 
         //return this.belongsToMany(Address); 
         //retun this.belongsTo(Address);
         // return this.morphOne(Address, 'addrs');
    },

    initialize : function(){
        this.on('saving', this.validateTosave);
    },
    validateTosave: function(){
        console.log('salvando..');
    }
},{
    validateIfNameExists: Promise.method(function(name){
        return new this({
            name : name
        })
        .fetch()
        .tap(function(result){
            if(!result){
                throw new Error('nome invalido');
                //throw new NotFoundError()
                //throw new NotRowsUpdatedError()
                //throw new NotRowsDeletedError
            }

            console.log('resultado validacao: ', result);
        });
    })
});

module.exports = Person;