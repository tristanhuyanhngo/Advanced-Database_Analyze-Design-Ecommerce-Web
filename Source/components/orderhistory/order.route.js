const express = require("express");
const orderController = require("./order.controller");
const router = express.Router();

router.get("/", orderController.paging);
 
module.exports = router;
