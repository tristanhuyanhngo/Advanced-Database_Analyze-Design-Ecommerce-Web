const Cart = require("./cart.model");
const modelCart = new Cart();
const store = require('store')

exports.paging = (req, res) => {
  modelCart.page(store.get("id"),(e, data) => {
    res.render('cart', {
      thongtingiohang : data.data,
      tongtiensanpham : data.tongtiensanpham,
      phivanchuyen : data.phivanchuyen,
      VAT : data.VAT,
      TongCong : data.TongCong
    });
  });
};