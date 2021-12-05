module.exports = (app) => {
    // const stdController = require("../controllers/example")
  
    // app.get("/student", stdController.getList)
  
    // app.get("/student/:id", stdController.getById)
  
    // app.post("/student", stdController.addNew)
  
    // app.put("/student", stdController.update)
  
    // app.delete("/student/:id", stdController.delete)

    const khController = require("../controllers/khachhangController")
    app.get("/customer", khController.getList)
    app.get("/customer/:id", khController.getByID)
    app.get("/customers", khController.checkAcc)

    const spController = require("../controllers/sanphamController.js")
    app.get("/product", spController.getList)
  };