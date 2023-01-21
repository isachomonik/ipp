const usuarios = require("../database/usuarios.json");
const fs = require("fs");
const path = require("path");
const cpfValidator = require('cpf')
var uniqid = require("uniqid");

const UserController = {
  showLogin: (req, res) => {
    res.render("login");
  },

  showCadastro: (req, res) => {
    res.render("cadastro");
  },

  cadastro: (req, res) => {
    var data = req.body;

    let novoUsuario = {
      id: uniqid(),
      nome: data.name,
      cpf: cpfValidator.format(data.cpf),
      admin: false
    };

    if(cpfValidator.isValid(novoUsuario.cpf)){
      try {
        usuarios.push(novoUsuario);
        let caminho = path.resolve(__dirname + "/../database/usuarios.json");
        fs.writeFileSync(caminho, JSON.stringify(usuarios, null, 4));
        res.redirect("/login");
      } catch (err) {
        console.error(err);
        res.send("There was an error processing your request");
      }
      
    } else {
      res.send("CPF inválido, revise seus dados e tente novamente")
    }


  },
  login: (req, res) => {
    var data = req.body;
    let caminho = path.resolve(__dirname + "/../database/usuarios.json");
    let usuarios = JSON.parse(fs.readFileSync(caminho));
    let usuario = usuarios.find((user) => user.cpf === cpfValidator.format(data.cpf));

    if (usuario) {
      req.session.loggedIn = true;
      req.session.user = usuario;
      res.redirect("/");
    } else {
      res.send("CPF not found. Please try again or register.");
    }
  },

  deleteUser: (req, res) => {

  },

  edit: (req, res) => {
    var data = req.body;
    let caminho = path.resolve(__dirname + "/../database/usuarios.json");
    let usuarios = JSON.parse(fs.readFileSync(caminho));
    let user = usuarios.find((user) => user.id === req.params.id);
    if (!user) {
      return res.status(404).send("User not found.");
  }

  // Allow the user to input new information
  user.nome = req.body.name;
  user.cpf = req.body.cpf;
  
  // Save the updated information back to the database
  fs.writeFileSync(path.resolve(__dirname + '/../database/usuarios.json'), JSON.stringify(usuarios, null, 4));

  res.redirect("/users");
  }
};

module.exports = UserController;
