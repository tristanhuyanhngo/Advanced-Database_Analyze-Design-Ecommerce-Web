const express = require("express");
const orderController = require("./order-detail.controller");
const router = express.Router();

router.get("/", orderController.paging);

router.post("/:id", orderController.orderOne);
 
module.exports = router;
