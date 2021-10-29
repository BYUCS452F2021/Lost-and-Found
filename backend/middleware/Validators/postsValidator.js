const { check, validationResult, param, query } = require('express-validator');

exports.validatorPosts = [
  check('founder_id', 'founder_id field is required').not().isEmpty(),
  check('object_name', 'object_name field is required').not().isEmpty(),
  check('type', 'type field is required').not().isEmpty(),
  check('photo', 'photo field is required').not().isEmpty(),
  check('is_requested', 'is_requested fieid is required').not().isEmpty(),
  check('color', 'color fieid is required').not().isEmpty(),
  check('description', 'description fieid is required').not().isEmpty(),
  check('found_date', 'found_date fieid is required').not().isEmpty(),
  check('reported_date', 'reported_date fieid is required').not().isEmpty(),
  (req, res, next) => {
    const errors = validationResult(req);
    if (!errors.isEmpty()) {
      return res.status(422).json({ success: false, error: errors.array() });
    }
    next();
  },
];
