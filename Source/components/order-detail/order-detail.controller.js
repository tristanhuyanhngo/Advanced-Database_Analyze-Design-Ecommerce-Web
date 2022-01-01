const Order = require("./order-detail.model");
const modelOrder = new Order();
const store = require("store");

exports.paging = (req, res) => {
  modelOrder.page(store.get('id1'),(e,data)=>{
    console.log(data)
    res.render("order-detail",{data});
  })
};

exports.orderOne = (req, res) => {
  store.set('id1',req.params.id)
  res.redirect("/order-detail");
};
