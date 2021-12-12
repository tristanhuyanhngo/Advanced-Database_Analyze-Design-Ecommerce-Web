module.exports = (app) => {
    const khController = require("../controllers/khachhangController")

    const spController = require("../controllers/sanphamController.js")
    app.get("/product", spController.getList)
    app.get("/product/km", spController.getListKm)
    app.get("/product/type/:type", spController.getListByType)
    app.get("/product/trademark/:trademark", spController.getListByTrademark)

    const dhController = require("../controllers/donhangController")
    app.post("/order/confirm", dhController.xacnhan)
  };