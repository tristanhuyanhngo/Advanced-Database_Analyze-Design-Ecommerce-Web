const khachHang = require("../models/khachhangModel");
const modelKH = new khachHang();

exports.getList = (req, res) => {
  modelKH.getInforKH((e, data) => {
    res.send({ result: data, error: e });
  });
};

exports.getByID = (req, res) => {
  modelKH.getInforKHByID(req.params.id,(e, data) => {
    res.send({ result: data, error: e });
  });
};

exports.checkAcc = (req, res) => {
  modelKH.checkKHbySDTAndPassword(req.body.sdt_login,req.body.pass_login,(e, data) => {
    res.send({ result: data, error: e });
  });
};
