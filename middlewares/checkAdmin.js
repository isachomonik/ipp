const checkAdmin = (req, res, next) => {
    if (req.session.loggedIn && req.session.user.admin == true) {
      next();
    } else {
      res.redirect('/login');
    }
  }

  module.exports = checkAdmin;