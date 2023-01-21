const checkAdmin = (req, res, next) => {
    if (req.session.loggedIn && req.session.user.admin == true) {
      next();
    } else {
      res.send("You're not allowed in this section");
    }
  }

  module.exports = checkAdmin;