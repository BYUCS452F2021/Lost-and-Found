const express = require('express');
const router = express.Router();
const { getPosts } = require('../../controllers/posts');

router.route('/').get(getPosts);

module.exports = router;
