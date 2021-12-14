const Donhang = require("../models/donhangModel");
var dhModel = new Donhang();

exports.xacnhan = (req, res) => {
    dhModel.xacNhanDonHang(req.body.DSSP, req.body.TTKH,(e, data) => {
      res.send({ result: data, error: e });
    });
  };