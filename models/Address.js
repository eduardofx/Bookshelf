var bookshelf = require('./bookshelf');
var Person    = require('./Person');
var Joi       = require('joi');


var Address = bookshelf.Model.extend({
    tableName: 'address',
    schema: {
        number: Number,
        street: String
    },
    // people: function() {
    //     return this.hasMany(Person); 
    //     // return this.belongsToMany(Person); 
    //     // return this.hasOne(Person); 


    //     return this.morphMany(Person, 'addrs'); 
    // }
});

// var Ex = bookshelf.Model.extend({
//     tableName: 'ex',
//     addrs: function() {
//         //  return this.morphTo('addrs', Person, Address); 
//     }
// });

module.exports = Address;