const express = require("express");
const accountController = require("./account.controller");
const router = express.Router();

router.get("/", accountController.paging);

router.get("/edit", accountController.edit);

module.exports = router;
