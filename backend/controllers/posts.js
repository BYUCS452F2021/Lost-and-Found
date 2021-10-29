const asyncHandler = require('../middleware/async');
const con = require('../config/dbseed');

// @desc    Get all posts
// @route   GET api/posts
// @access  Public
exports.getPosts = asyncHandler(async (req, res, next) => {
  con.connect((err) => {
    con.query(`SELECT * FROM main.object`, (err, result, fields) => {
      if (err) res.status(404).json({ success: false, error: err });
      if (result) res.status(200).json({ data: result });
    });
  });
});

// @desc    Get a single post
// @route   GET api/posts/:id
// @access  Public
exports.getPost = asyncHandler(async (req, res, next) => {
  con.connect((err) => {
    con.query(
      `SELECT * FROM main.object WHERE object_id='${req.params.id}'`,
      (err, result, fields) => {
        if (err) res.status(404).json({ success: false, error: err });
        if (!result.length)
          res.status(404).json({
            success: false,
            error: `post not found with given id: ${req.params.id}`,
          });
        else res.status(200).json({ data: result });
      }
    );
  });
});

// @desc    Create a post
// @route   POST api/posts
// @access  Private
exports.createPost = asyncHandler(async (req, res, next) => {
  console.log('Request received');
  con.connect(function (err) {
    con.query(
      `INSERT INTO main.object (founder_id, object_name, type, photo, is_requested, color, description, found_date, reported_date) VALUES ('${req.body.founder_id}', '${req.body.object_name}', '${req.body.type}', '${req.body.photo}', '${req.body.is_requested}', '${req.body.color}', '${req.body.description}', '${req.body.found_date}', '${req.body.reported_date}')`,
      (err, result, fields) => {
        if (err) res.json({ success: false, error: err });
        if (result)
          res.status(200).json({
            success: true,
            data: {
              founder_id: req.body.founder_id,
              object_name: req.body.object_name,
              type: req.body.type,
              photo: req.body.photo,
              is_requested: req.body.is_requested,
              color: req.body.color,
              description: req.body.description,
              found_date: req.body.found_date,
              reported_date: req.body.reported_date,
            },
          });
        if (fields) console.log(fields);
      }
    );
  });
});