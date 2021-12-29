const ProductDetail = require("./product-detail.model");
const model = new ProductDetail();
const store = require("store");

exports.paging = (req, res) => {
  model.getProduct(store.get("id"), (e, data) => {
    console.log(data);
    res.render("product-details", {
      thongtinsanpham: data.thongtinsanpham,
      sanphammuacung: data.sanphammuacung,
    });
  });
};

exports.getProduct = (req, res) => {
  store.set("id", req.params.id);
  res.redirect("/product-details");
};
