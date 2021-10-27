const mysql = require('mysql');
const dotenv = require('dotenv');

// Load env Vars
dotenv.config({ path: './config.env' });

const con = mysql.createConnection({
  host: process.env.RDS_END_POINT,
  user: process.env.RDS_USERNAME,
  password: process.env.RDS_PASSWORD,
});

// Create Tables
con.connect((err) => {
  if (err) throw err;

  con.query('CREATE DATABASE IF NOT EXISTS main;');
  con.query('USE main;');

  // create person table
  con.query(
    'CREATE TABLE IF NOT EXISTS person(byu_id VARCHAR(30) NOT NULL, is_student BOOL, name VARCHAR(255), phone_number VARCHAR(30), email VARCHAR(255), num_found INT, num_requested INT, PRIMARY KEY(byu_id));',
    (error, result, fields) => {
      if (error) throw error;
    }
  );

  // create object table
  // con.query(
  //   'CREATE TABLE IF NOT EXISTS object(object_id VARCHAR(255) NOT NULL, founder_id VARCHAR(255) NOT NULL, object_name VARCHAR(255), last_name VARCHAR(255), phone_number VARCHAR(30), email VARCHAR(255), num_found INT, num_requested INT, PRIMARY KEY(byu_id));',
  //   (error, result, fields) => {
  //     if (error) throw error;
  //   }
  // );

  // delete table
  // con.query('DROP TABLE IF EXISTS person;');

  console.log('Database Connected');
  // con.end();
});

module.exports = con;
