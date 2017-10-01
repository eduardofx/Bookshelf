var express = require('express');
var router = express.Router();
var Person = require('./../models/Person');


  
/* GET home page. */
router.get('/', function(req, res, next) {
  Person
    //.forge({id:2})-- retorna somente 1 registro
    //.query({ where: {id: 1} })
    //.query('where', 'id', '=', '1')
    //.query(function(qb) {qb.where('id','=','1')})
    .collection() //retorna varios
    .fetch()
    .then(function(people){
        
        if(!people){
          return res.status(404).json({ code: 404, data: {} });
        }
       
        res.status(200).json({ code: 200, data: people});

      })
    .catch(function(err){
        return res
               .status(500)
               .json({
                  code: 500,
                  data: {}
               });
    });
});


// insert
router.post('/', function(req, res, next){

  Person.validateIfNameExists(req.body.name)
        .then(function(result){
          console.log('resultado: ', result);
        });

  Person
    .forge(req.body)
    .save()
    .then(function(person){
        return res 
                .status(200)
                .json({
                  code: 200,
                  data: person
                })
    }).catch(function(err){
       return res
              .status(500)
              .json({
                code: 500,
                data : err
              });
    })
});


//update
router.put('/:id', function(req, res, next){
  Person
    .forge({ id: req.params.id })
    .fetch()
    .then(function(person){

        if(!person){
          return res.status(404).json({ code: 404, data: {} });
        }
        
        person
              .save({
                  name : req.body.name || person.get('name'), 
                  age : req.body.age || person.get('age'), 
                  idtipousuario : req.body.idtipousuario || person.get('idtipousuario'), 
              })
              .then(function(person){
                  return res 
                  .status(200)
                  .json({
                    code: 200,
                    data: person
                  })
              })
              .catch(function(err){
                return res
                  .status(500)
                  .json({
                    code: 500,
                    data : err
                  });
              })
    }).catch(function(err){
       return res
              .status(500)
              .json({
                code: 500,
                data : err
              });
    })
});


//apagar
router.delete('/:id', function(req, res, next){
  Person
    .forge({ id: req.params.id })
    .fetch()
    .then(function(person){

        if(!person){
          return res.status(404).json({ code: 404, data: {} });
        }
        
        person
              .destroy()
              .then(function(person){
                  return res 
                  .status(204)
                  .json({
                    code: 204,
                    data: person
                  })
              })
              .catch(function(err){
                return res
                  .status(500)
                  .json({
                    code: 500,
                    data : err
                  });
              })
    }).catch(function(err){
       return res
              .status(500)
              .json({
                code: 500,
                data : err
              });
    })
});

module.exports = router;
