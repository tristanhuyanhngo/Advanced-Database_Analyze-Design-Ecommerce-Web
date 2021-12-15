var express = require('express');
var router = express.Router();
const khController = require('./khachhangController')
/* GET home page. */
router.get('/', khController.paging)
router.post('/', khController.login)
router.post('/', khController.signin)
module.exports = router;