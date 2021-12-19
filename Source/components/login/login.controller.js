const Login = require("./login.model");
const modelLogin = new Login();
const store = require('store')

exports.paging = (req, res) => {
  res.render("login");
};

exports.register = (req, res) => {
  modelLogin.register(req.body, (e, data) => {
    if (!e) req.flash('mess', 'Đăng ký thành công');
    else req.flash('mess', 'Đăng ký thất bại');
    res.redirect("/login");
  });
};

exports.signin = (req, res) => {
  modelLogin.signin(req.body, (e, data) => {
    if (!e) 
    {
      store.set('id', data)
      res.redirect("/");
    }
    else {
      req.flash('mess2', 'Đăng nhập thất bại');
      res.redirect("/login");
    }
  });
};
