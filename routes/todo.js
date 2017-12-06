const express = require('express');
const knex  = require('../db/knex');
const indicative = require('indicative');
const router = express.Router();




const todoRules = {
  title: 'required',
  description: 'required',
  priority: 'required'
};


const todoRulesMessage = {
  'title.required': 'Title is required',
  'description.required': 'Description is required',
  'priority.required': 'Priority is required'
};

router.get('/', (req, res) => {
  knex('todo')
    .select()
    .then(todos => {
      res.render('app/index', {todos: todos});
    });
});

router.get('/new', (req, res) => {
  res.render('app/new');
});

router.post('/', (req, res) => {

  const todo = {
    title: req.body.todo,
    description: req.body.description,
    priority: req.body.priority,
    createdAt: new Date()
  };

  indicative
    .validate(todo, todoRules, todoRulesMessage)
    .then(() => {
      knex('todo')
        .insert(todo, 'id')
        .then(ids => {
          const id = ids[0];
          res.redirect(`/todo/${id}`);
        });
    })
    .catch( (errors) => {
      res.render('app/new', {errors: errors});
    });
});


router.get('/:id', (req, res) => {
  const id = req.params.id;
  if (typeof id != 'undefined') {
    knex('todo')
      .select()
      .where('id', id)
      .first()
      .then(todo => {
        res.render('app/single', todo);
      });
  } else {
    res.status(500);
    res.render('error', {
      message: 'Invalid id'
    });
  }
});

router.get('/:id/edit', (req, res) => {
  const id = req.params.id;
  if (typeof id != 'undefined') {
    knex('todo')
      .select()
      .where('id', id)
      .first()
      .then(todo => {
        res.render('app/edit', todo);
      });
  } else {
    res.status(500);
    res.render('error', {
      message: 'Invalid id'
    });
  }
});

router.put('/:id', (req, res) => {
  const id = req.params.id;
  const todo = {
    title: req.body.todo,
    description: req.body.description,
    priority: req.body.priority,
    createdAt: new Date()
  };
  if (typeof id != 'undefined') {
    knex('todo')
      .where('id', id)
      .update(todo, 'id')
      .then( () => {
        res.redirect(`/todo/${req.params.id}`);
      });
  } else {
    res.status(500);
    res.render('error', {
      message: 'Invalid id'
    });
  }
});

router.delete('/:id', (req, res) => {
  const id = req.params.id;
  if (typeof id != 'undefined') {
    knex('todo')
      .where('id', id)
      .del()
      .then( () => {
        res.redirect('/todo/');
      });
  } else {
    res.status(500);
    res.render('error', {
      message: 'Invalid id'
    });
  }
});

module.exports = router;
