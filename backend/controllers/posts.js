const asyncHandler = require('../middleware/async');

// @route   GET api/posts
// @desc    Get all posts
// @access  Public
exports.getPosts = asyncHandler(async (req, res, next) => {
  res.status(200).send('get all posts');
});
