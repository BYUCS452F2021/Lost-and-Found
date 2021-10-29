const asyncHandler = require('../middleware/async');
const con = require('../config/dbseed');

// @desc    Get all users
// @route   GET api/users
// @access  Public
exports.getUsers = asyncHandler(async (req, res, next) => {
  con.connect((err) => {
    con.query(`SELECT * FROM main.person`, (err, result, fields) => {
      if (err) res.status(404).json({ success: false, error: err });
      if (result) res.status(200).json({ success: true, data: result });
    });
  });
});

// @desc    Get a single user
// @route   GET api/users/:id
// @access  Public
exports.getUser = asyncHandler(async (req, res, next) => {
  con.connect((err) => {
    con.query(
      `SELECT * FROM main.person WHERE byu_id='${req.params.id}'`,
      (err, result, fields) => {
        if (err) res.status(404).json({ success: false, error: err });
        // if (!result) res.status(404).json({ success: false, error: 'user not found'});
        if (result) res.status(200).json({ success: true, data: result });
      }
    );
  });
});

// @desc    Create an User
// @route   POST api/users
// @access  Private
exports.createUser = asyncHandler(async (req, res, next) => {
  console.log('Request received');
  con.connect(function (err) {
    con.query(
      `INSERT INTO main.person (byu_id, is_student, name, phone_number, email) VALUES ('${req.body.byu_id}', '${req.body.is_student}', '${req.body.name}', '${req.body.phone_number}', '${req.body.email}')`,
      (err, result, fields) => {
        if (err) res.json({ success: false, error: err });
        if (result)
          res.status(200).json({
            success: true,
            data: {
              byu_id: req.body.byu_id,
              is_student: req.body.is_student,
              name: req.body.name,
              phone_number: req.body.phone_number,
              email: req.body.email,
              num_found: 0,
              num_requested: 0,
            },
          });
        if (fields) console.log(fields);
      }
    );
  });
});
