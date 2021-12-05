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
  modelKH.checkKHbySDTAndPassword(req.query.SDT,req.query.pass,(e, data) => {
    res.send({ result: data, error: e });
  });
};
