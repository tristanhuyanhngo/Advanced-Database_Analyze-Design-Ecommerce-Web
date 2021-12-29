const Cart = require("./cart.model");
const modelCart = new Cart();
const store = require('store')

exports.paging = (req, res) => {
  modelCart.page(store.get("id"),(e, data) => {
    console.log(data)
    res.render('cart', {thongtingiohang : data});
  });
};