const Sp = require("../models/sanphamModel");
const modelSP = new Sp();

exports.getList = (req, res) => {
  modelSP.getInforSP((e, data) => {
    res.send({ result: data, error: e });
  });
};

exports.update = (req, res) => {
  modelSP.updateSP(req.params.ID,(e, data) => {
    res.send({ result: data, error: e });
  });
};

exports.getListKm = (req, res) => {
  modelSP.getInforSPKM((e, data) => {
    res.send({ result: data, error: e });
  });
};

exports.getListByType = (req, res) => {
  modelSP.getInforSPByType(req.params.type,(e, data) => {
    res.send({ result: data, error: e });
  });
};

exports.getListByTrademark = (req, res) => {
  modelSP.getInforSPByTrademark(req.params.tradmark,(e, data) => {
    res.send({ result: data, error: e });
  });
};