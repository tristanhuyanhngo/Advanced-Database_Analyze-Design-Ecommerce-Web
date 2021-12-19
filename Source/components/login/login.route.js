const express = require('express');
const loginController = require('./login.controller')
const router = express.Router();

router.get('/', loginController.paging)
router.post('/register', loginController.register)
router.post('/signin', loginController.signin)
module.exports = router;