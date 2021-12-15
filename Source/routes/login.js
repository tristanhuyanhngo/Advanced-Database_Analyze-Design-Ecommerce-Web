var express = require('express');
var router = express.Router();
const khController = require('../components/khachhang/khachhangController')
/* GET home page. */
router.get('/', khController.login)

module.exports = router;
