const cpfValidator = require('cpf')
const fs = require('fs');
const path = require('path')

const AdminController = {

    showAdmin: (req, res) => {
        res.render('admin');
    },

    showUser: (req, res) =>{
        var data = req.body;
        let caminho = path.resolve(__dirname + "/../database/usuarios.json");
        let usuarios = JSON.parse(fs.readFileSync(caminho));
        let usuario = usuarios.find((user) => user.cpf === cpfValidator.format(req.query.search));
          if(usuario){
            res.render('edit-user-form', {user: usuario})
          } else {
            res.send('Usuario não encontrado')
          }


    },

    edit: (req, res) => {
        var data = req.body;
        let caminho = path.resolve(__dirname + "/../database/usuarios.json");
        let usuarios = JSON.parse(fs.readFileSync(caminho));
        let user = usuarios.find((user) => user.cpf === cpfValidator.format(data.cpf));
        if (!user) {
          return res.status(404).send("User not found.");
      } else {
        user.nome = data.nome;
        user.cpf = data.cpf;
        user.admin = data.admin === 'on' ? true : false;
      }

    
      // Allow the user to input new information
      
      // Save the updated information back to the database
      fs.writeFileSync(path.resolve(__dirname + '/../database/usuarios.json'), JSON.stringify(usuarios, null, 4));
    
  

      res.redirect("/admin");
    },

    delete: (req, res) => {
      var data = req.body;
      let caminho = path.resolve(__dirname + "/../database/usuarios.json");
      let usuarios = JSON.parse(fs.readFileSync(caminho));
      let user = usuarios.find((user) => user.id === req.params.id);
      if (!user) {
        return res.status(404).send("User not found.");
      } 
  
      // Remove the user from the array
      usuarios = usuarios.filter((user) => user.id !== req.params.id);
  
      // Save the updated array to the JSON file
      fs.writeFileSync(path.resolve(__dirname + '/../database/usuarios.json'), JSON.stringify(usuarios, null, 4));
  
      res.redirect("/admin");

    },

};

module.exports = AdminController;