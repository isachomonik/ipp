var express = require('express');
const UserController = require('../controllers/UserController');
var router = express.Router();

/* GET home page. */
router.get('/', function(req, res, next) {
  res.render('index', { title: 'Express' });
});

router.get('/login', UserController.login);
router.get('/cadastrar', UserController.showCadastro);
router.post('/cadastrar', UserController.cadastro)


module.exports = router;
