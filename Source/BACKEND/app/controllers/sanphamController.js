const Sp = require("../models/sanphamModel");
const modelSP = new Sp();

exports.getList = (req, res) => {
  modelSP.getInforSP((e, data) => {
    res.send({ result: data, error: e });
  });
};
