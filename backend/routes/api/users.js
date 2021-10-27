const express = require('express');
const router = express.Router();
const { getUsers, createUser } = require('../../controllers/users');

router.route('/').get(getUsers);
router.route('/').post(createUser);

module.exports = router;
