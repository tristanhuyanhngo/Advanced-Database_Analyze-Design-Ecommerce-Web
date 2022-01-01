var express = require('express');
var router = express.Router();
const cartController = require('./cart.controller')

router.get('/', cartController.paging)

router.post('/coupons', cartController.addCoupons)

router.post('/change/:id',cartController.changeCart)

router.post('/order',cartController.order)

module.exports = router;