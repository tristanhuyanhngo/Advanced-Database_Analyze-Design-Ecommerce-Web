var express = require('express');
var router = express.Router();
const spController = require('./sanphamController')
/* GET home page. */
router.get('/', spController.get)
router.get('/1', spController.get1)
router.get('/2', spController.get2)
router.get('/3', spController.get3)
router.get('/4', spController.get4)
module.exports = router;