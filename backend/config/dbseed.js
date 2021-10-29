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
  // con.query(
  //   'CREATE TABLE IF NOT EXISTS person(byu_id VARCHAR(30) NOT NULL, is_student BOOL, name VARCHAR(255), phone_number VARCHAR(30), email VARCHAR(255), num_found INT DEFAULT 0, num_requested INT DEFAULT 0, PRIMARY KEY(byu_id));',
  //   (error, result, fields) => {
  //     if (error) throw error;
  //   }
  // );

  // create object table
  con.query(
    'CREATE TABLE IF NOT EXISTS object(object_id INT NOT NULL AUTO_INCREMENT, founder_id VARCHAR(255) NOT NULL, object_name VARCHAR(255), type VARCHAR(255), photo VARCHAR(255), is_requested BOOL, color VARCHAR(255), description VARCHAR(255), found_date DATETIME, reported_date DATETIME, PRIMARY KEY(object_id), FOREIGN KEY(founder_id) REFERENCES main.person(byu_id));',
    (error, result, fields) => {
      if (error) throw error;
    }
  );

  // create transaction table
  // con.query(
  //   'CREATE TABLE IF NOT EXISTS post(transaction_id VARCHAR(255) NOT NULL, founder_id VARCHAR(255) NOT NULL, receiver_id VARCHAR(255) NOT NULL, object_id VARCHAR(255) NOT NULL, transaction_date DATE, is_returned BOOL, PRIMARY KEY(transaction_id), FOREIGN KEY(founder_id), FOREIGN KEY(receiver_id), FOREIGN KEY(object_id));',
  //   (error, result, fields) => {
  //     if (error) throw error;
  //   }
  // );

  // delete person table
  // con.query('DROP TABLE IF EXISTS person;');

  // delete object table
  // con.query('DROP TABLE IF EXISTS object;');

  console.log('Database Connected');
  // con.end();
});

module.exports = con;
