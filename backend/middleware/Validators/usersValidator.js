const { check, validationResult, param, query } = require('express-validator');

exports.validatorUsers = [
  check('byu_id', 'byu_id field is required').not().isEmpty(),
  check('is_student', 'is_student field is required').not().isEmpty(),
  check('name', 'name field is required').not().isEmpty(),
  check('phone_number', 'phone_number field is required').not().isEmpty(),
  check('email', 'email fieid is required').not().isEmpty(),
  (req, res, next) => {
    const errors = validationResult(req);
    if (!errors.isEmpty()) {
      return res.status(422).json({ success: false, error: errors.array() });
    }
    next();
  },
];

// exports.validatorUser = [
//   query('id', 'id param is required').exists().toString(),
//   (req, res, next) => {
//     const errors = validationResult(req);
//     if (!errors.isEmpty()) {
//       return res.status(422).json({ success: false, error: errors.array() });
//     }
//     next();
//   },
// ];
