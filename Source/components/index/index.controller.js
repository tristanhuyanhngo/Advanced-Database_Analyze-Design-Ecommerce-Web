const Index = require("./index.model");
const modelIndex = new Index();

exports.paging = (req, res) => {
  modelIndex.page((e, data) => {
    if (!e) res.render("index", { data }); 
    else res.status(404).json({ errors: "error" });
  });
};
