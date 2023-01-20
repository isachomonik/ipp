const usuarios = require("../database/usuarios.json");

const IndexController = {
    showIndex: (req, res) => {

        let user = req.session.user
        if (user && user.nome) {
            res.render('index', { user });
        } else {
            res.render('index', { user: {} });
        }
    }

}

module.exports = IndexController;