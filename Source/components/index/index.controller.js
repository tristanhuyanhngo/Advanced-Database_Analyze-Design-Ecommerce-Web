const Index = require("./index.model");
const modelIndex = new Index();
exports.paging = (req, res) => {
  modelIndex.page((e, data) => {
    if (!e)
      res.render("index", {
        baby: data.baby,
        bobby: data.bobby,
        huggies: data.huggies,
        pedisure: data.pedisure,
        ensure: data.ensure,
        suatuoi: data.suatuoi,
        suabot: data.suabot,
        khuyenmai: data.khuyenmai,
        andam: data.andam,
        bimsua: data.bimsua,
        cssk: data.cssk,
      });
    else res.status(404).json({ errors: "error" });
  });
};
