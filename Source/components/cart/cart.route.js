var express = require('express');
var router = express.Router();
const cartController = require('./cart.controller')

router.get('/', cartController.paging)

module.exports = router;