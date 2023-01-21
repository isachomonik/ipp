var express = require('express');
const AdminController = require('../controllers/AdminController');
const UserController = require('../controllers/UserController');
const checkAdmin = require('../middlewares/checkAdmin');
var router = express.Router();

/* GET users listing. */
router.get('/', function(req, res, next) {
  res.send('respond with a resource');
});

router.put('/users/:id/edit', checkAdmin, AdminController.edit);
router.delete('/users/:id/delete', checkAdmin, AdminController.delete);


router.get('/cadastrar', UserController.showCadastro);


router.post('/cadastrar', UserController.cadastro)


module.exports = router;
