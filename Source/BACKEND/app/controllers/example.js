const Student = require("../models/example");
var model = new Student();

exports.getList = (req, res) => {
  model.getAll((e, data) => {
    res.send({ result: data, error: e });
  });
};

exports.getById = (req, res) => {
  model.getOne(req.params.id, (e, data) => {
    res.send({ result: data, error: e });
  });
};

exports.addNew = (req, res) => {
  model.create(req.body, (e, data) => {
    res.send({ result: data, error: e });
  });
};

exports.update = (req, res) => {
  model.up(req.body, (e, data) => {
    res.send({ result: data, error: e });
  });
};

exports.delete = (req, res) => {
  model.del(req.param.id, (e, data) => {
    res.send({ result: data, error: e });
  });
};
