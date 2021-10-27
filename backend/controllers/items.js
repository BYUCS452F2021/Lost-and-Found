const asyncHandler = require('../middleware/async');
const con = require('../config/dbseed');

// @route   GET api/items
// @desc    Get all items
// @access  Public
exports.getItems = asyncHandler(async (req, res, next) => {
  con.connect(function (err) {
    con.query(`SELECT * FROM main.item`, function (err, result, fields) {
      if (err) res.status(404).send(err);
      if (result) res.status(200).send(result);
    });
  });
});
