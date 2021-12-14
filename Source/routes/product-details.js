var express = require('express');
var router = express.Router();
const spController = require("../app/controllers/sanphamController")
/* GET home page. */
router.get('/', spController.getList)

module.exports = router;
