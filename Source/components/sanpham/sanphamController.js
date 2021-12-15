const khachHang = require("./khachhangModel");
const modelKH = new khachHang();

exports.login = (req, res) => {
  modelKH.customerlogin(req.body,(e, data) => {
    res.render('login', { result: data, error: e });
  });
};

exports.paging = (req, res) => {
  res.render('login');
};

exports.signin = (req, res) => {
  modelKH.customersignin(req.body,(e, data) => {
    res.render('login', { result: data, error: e });
  });
};