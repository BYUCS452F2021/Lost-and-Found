const asyncHandler = require('../middleware/async');
const con = require('../config/dbseed');

// @route   GET api/users
// @desc    Get all users
// @access  Public
exports.getUsers = asyncHandler(async (req, res, next) => {
  con.connect(function (err) {
    con.query(`SELECT * FROM main.person`, function (err, result, fields) {
      if (err) res.status(404).send(err);
      if (result) res.status(200).send(result);
    });
  });
});

// @route   POST api/users
// @desc    Create an User
// @access  Private
exports.createUser = asyncHandler(async (req, res, next) => {
  if (req.body.name && req.body.phone_number && req.body.email) {
    console.log('Request received');
    con.connect(function (err) {
      con.query(
        `INSERT INTO main.person (byu_id, is_student, name, phone_number, email, num_found, num_requested) VALUES ('${req.body.byu_id}', '${req.body.is_student}', '${req.body.name}', '${req.body.phone_number}', '${req.body.email}', '${req.body.num_found}', '${req.body.num_requested}' )`,
        function (err, result, fields) {
          if (err) res.send(err);
          if (result)
            res.status(200).send({
              byu_id: req.body.byu_id,
              is_student: req.body.is_student,
              name: req.body.name,
              phone_number: req.body.phone_number,
              email: req.body.email,
              num_found: req.body.num_found,
              num_requested: req.body.num_requested,
            });
          if (fields) console.log(fields);
        }
      );
    });
  } else {
    console.log('Missing a parameter');
  }
});
