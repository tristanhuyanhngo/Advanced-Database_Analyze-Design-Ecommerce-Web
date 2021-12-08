module.exports = (app) => {
    const khController = require("../controllers/khachhangController")
    app.get("/customer", khController.getList)
    app.get("/customer/:id", khController.getByID)
    app.get("/customers", khController.checkAcc)

    const spController = require("../controllers/sanphamController.js")
    app.get("/product", spController.getList)
    app.put("/product/:ID", spController.update)

    const dhController = require("../controllers/donhangController")
    app.post("/DH", dhController.xacnhan)
  };