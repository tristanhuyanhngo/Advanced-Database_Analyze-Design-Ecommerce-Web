const ProductDetail = require("./product-detail.model");
const model = new ProductDetail();
const store = require("store");

exports.paging = (req, res) => {
  model.getProduct(store.get("idsp"), (e, data) => {
    res.render("product-details", {
      thongtinsanpham: data.thongtinsanpham,
      sanphammuacung: data.sanphammuacung,
    });
  });
};

exports.getProduct = (req, res) => {
  store.set("idsp", req.params.id);
  res.redirect("/product-details");
};

exports.putProductToCart = (req, res) => {
  model.putProductToCart(store.get("idsp"), store.get("id"), (e, data) => {
    console.log(data);
    res.redirect("/");
  });
};
