const express = require('express');
const router = express.Router();
const { getUsers, getUser, createUser } = require('../../controllers/users');
const {
  validatorUsers,
  validatorUser,
} = require('../../middleware/Validators/usersValidator');

router.route('/').get(getUsers).post(validatorUsers, createUser);
// router.route('/:id').get(validatorUser, getUser);
router.route('/:id').get(getUser);

module.exports = router;
