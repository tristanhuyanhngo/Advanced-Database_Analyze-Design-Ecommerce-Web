const Order = require("./order.model");
const modelOrder = new Order();
const store = require("store");

exports.paging = (req, res) => {
  modelOrder.page(store.get("id"), (e, data) => {
    if (!e) res.render("orderhistory", { orders: data });
    else res.redirect("/");
  });
};
