var express = require('express');
const AdminController = require('../controllers/AdminController');
const UserController = require('../controllers/UserController');
const checkAdmin = require('../middlewares/checkAdmin');
var router = express.Router();

/* GET users listing. */
router.get('/', checkAdmin, AdminController.showAdmin );

router.put('/edit/:id', checkAdmin, AdminController.edit);
router.delete('/delete/:id', checkAdmin, AdminController.delete);

router.get('/user', AdminController.showUser);
router.post('/edit-user/:id', AdminController.edit);
router.post('/delete-user/:id', AdminController.delete);






router.get('/cadastrar', UserController.showCadastro);


router.post('/cadastrar', UserController.cadastro)
router.post('/login', UserController.login)


module.exports = router;
