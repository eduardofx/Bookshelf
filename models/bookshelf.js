var knex = require('knex')({
    client : 'pg',
    connection : {
        host : '127.0.0.1',
        user : 'postgres',
        port : '5432',
        password : 'pgsql',
        database : 'bookshelf',
        charset : 'utf8'
    }
});

module.exports = require('bookshelf')(knex);