const khachHang = require("./sanphamModel");
const modelKH = new khachHang();

exports.get = (req, res) => {
  modelKH.getpromotionproduct((e, data) => {
    res.render("index", { r :data});
  });
};

exports.get1 = (req, res) => {
  modelKH.getfreshmilkproduct((e, data) => {
    res.render("index", { r :data});
  });
};

exports.get2 = (req, res) => {
  modelKH.getpowderedmilkproduct((e, data) => {
    res.render("index", { r :data});
  });
};

exports.get3 = (req, res) => {
  modelKH.getdiaperdiapersproduct((e, data) => {
    res.render("index", { r :data});
  });
};

exports.get4 = (req, res) => {
  modelKH.getnutritionproduct((e, data) => {
    res.render("index", { r :data});
  });
};