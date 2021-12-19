const Cart = require("./cart.model");
const modelCart = new Cart();

exports.paging = (req, res) => {
  const id = 1
  modelCart.page(id,(e, data) => {
    res.render('cart');
  });
};