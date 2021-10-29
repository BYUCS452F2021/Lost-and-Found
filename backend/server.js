const express = require('express');
const dotenv = require('dotenv');

// Load env Vars
dotenv.config({ path: './config/config.env' });

const app = express();

// Init Middleware; Body Parser
app.use(express.json({ extended: false }));

// Define Routes
app.use('/api/posts', require('./routes/api/posts'));
app.use('/api/users', require('./routes/api/users'));

const PORT = process.env.PORT || 5000;
app.listen(PORT, () => {
  console.log(`Server started on port ${PORT}`);
});
