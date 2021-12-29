const express = require("express");
const productDetailController = require("./product-detail.controller");
const router = express.Router();

router.get("/", productDetailController.paging);

router.post("/:id", productDetailController.getProduct);

module.exports = router;
