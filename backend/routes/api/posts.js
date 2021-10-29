const express = require('express');
const router = express.Router();
const { getPosts, getPost, createPost } = require('../../controllers/posts');
const {
  validatorPosts,
} = require('../../middleware/Validators/postsValidator');

router.route('/').get(getPosts).post(validatorPosts, createPost);
router.route('/:id').get(getPost);

module.exports = router;
