var express = require('express');
const IndexController  = require('../controllers/IndexController');
const UserController = require('../controllers/UserController');
const checkAuth = require('../middlewares/checkAuth');
var router = express.Router();

/* GET home page. */
router.get('/', checkAuth, IndexController.showIndex);

router.get('/login', UserController.showLogin);
router.get('/cadastrar', UserController.showCadastro);

router.post('/cadastrar', UserController.cadastro)
router.post('/login', UserController.login)


module.exports = router;
