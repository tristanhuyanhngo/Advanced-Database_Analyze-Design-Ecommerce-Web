var express = require('express');
var router = express.Router();
const khController = require('./khachhangController')
/* GET home page. */
router.get('/', khController.paging)
router.get('/1', khController.login)
router.get('/2', khController.signin)
module.exports = router;