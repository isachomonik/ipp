const usuarios = require('../database/usuarios.json')
const fs = require('fs')
const path = require('path')
var uniqid = require('uniqid'); 

const UserController = {
    login: (req, res) => {
        res.render('login');
    },
    showCadastro: (req, res) => {
        res.render('cadastro')
    },


    cadastro: (req, res) => {
        var data = req.body

        let novoUsuario = {
            id: uniqid(),
            nome: data.name,
            cpf: data.cpf,
        }

        console.log(novoUsuario)
        console.log('testestestestestestesteste')


        usuarios.push(novoUsuario);
        let caminho = path.resolve(__dirname + '/../database/usuarios.json')
        fs.writeFileSync(caminho, JSON.stringify(usuarios, null, 4));

        res.redirect('/login')

        

        
    }
}

module.exports = UserController;