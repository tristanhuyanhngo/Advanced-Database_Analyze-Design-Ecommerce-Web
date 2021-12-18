const express = require('express');
const indexController = require('./index.controller')
const router = express.Router();

router.get('/', indexController.paging)

module.exports = router;