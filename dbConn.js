const mysql = require('mysql');

const connection = mysql.createConnection({
   host:'localhost',
   user : 'root',
   password : '',
   database : 'mysql-example',
   multipleStatements : true
});

connection.connect();

module.exports = connection;
