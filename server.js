const config = require('./config.js');
const express = require('express');
const nunjucks = require('nunjucks');
const path = require('path');
const bodyParser = require('body-parser');
const cookieParser = require('cookie-parser');
const todo = require('./routes/todo');
const methodOverride = require('method-override');


const server = express();

server.set('views', path.join(__dirname, 'views'));
server.set('view engine', 'njk');


nunjucks.configure('views', {
  express: server,
  autoescape: true
});


server.use(bodyParser.json());
server.use(bodyParser.urlencoded({extended: false}));
server.use(cookieParser());
server.use(methodOverride('_method'));
server.use(express.static(path.join(__dirname, 'public')));

//routes
server.use('/todo', todo);


server.use((req, res, next) => {
  var err = new Error('Not Found');
  err.status = 404;
  next(err);
});


server.use((err, req, res, next)  => {

  res.locals.message = err.message;
  res.locals.error = req.app.get('env') === 'development' ? err : {};


  res.status(err.status || 500);
  res.render('error/404', {error: err});
});



server.listen(config.port,  () => {
  console.info('Express listening on port', config.port);
});
