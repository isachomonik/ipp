var express = require('express');
const LoginController = require('../controllers/LoginController');
var router = express.Router();

/* GET home page. */
router.get('/', function(req, res, next) {
  res.render('index', { title: 'Express' });
});

router.get('/login', LoginController.login);


module.exports = router;
