var express = require('express');
const AdminController = require('../controllers/AdminController');
const IndexController  = require('../controllers/IndexController');
const UserController = require('../controllers/UserController')
const checkAdmin = require('../middlewares/checkAdmin');
const checkAuth = require('../middlewares/checkAuth');
var router = express.Router();

/* GET home page. */
router.get('/', checkAuth, IndexController.showIndex);

// router.get('/admin', checkAdmin, AdminController.showAdmin)

router.get('/login', UserController.showLogin);
router.post('/login', UserController.login)





module.exports = router;
