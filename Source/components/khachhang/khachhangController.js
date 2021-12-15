const khachHang = require("./khachhangModel");
const modelKH = new khachHang();


exports.paging = (req, res) => {
  res.render('login');
};

exports.login = (req, res) => {
  modelKH.customerlogin(req.body,(e, data) => {
    console.log(data)
    res.render('index',{ result: data, error: e });
  });
};

exports.signin = (req, res) => {
  modelKH.customersignin(req.body,(e, data) => {
    res.render('index',{ result: data, error: e });
  });
};