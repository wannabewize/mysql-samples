const connection = require('../dbConn.js');

// prepareTable();
// addCafe('스타벅스', 36.350412, 127.384548);
// addCafe('엔젤이너스', 36.74, 126.11);
// addCafe('카페베네', 36.74, 126.11);

// showCafes();

// 가까운 카페 2곳 출력
showNearTwoCafes(34, 126);

function showNearTwoCafes(lat, long) {
   const sql = 'select name, ST_Distance(location, Point(?, ?) ) as distance from cafes order by distance limit 2;';
   connection.query(sql, [lat, long], (error, results) => {
      if ( error ) {
         console.error('INSERT cafe Error : ', error.message);
         connection.end();
         return;
      }

      for(var cafe of results) {
         console.log(cafe.name, 'distance :', cafe.distance);         
      }

      connection.end();
   });   
}

function showCafes() {
   const sql = 'select name, ST_AsText(location) as location from cafes';
   connection.query(sql, (error, results) => {
      if ( error ) {
         console.error('INSERT cafe Error : ', error.message);
         connection.end();
         return;
      }

      for(var cafe of results) {
         console.log(cafe.name, 'location :', cafe.location);         
      }

      connection.end();
   });
}


function addCafe(name, lat, long) {
// INSERT INTO cafes(title, location) VALUES ('엔젤이너스', Point(36.74, 126.11) );
// INSERT INTO cafes(title, location) VALUES ('카페베네', GeomFromText('POINT(36.74 126.11)'));

   const sql = 'INSERT INTO cafes(name, location) VALUES (?, Point(?, ?))';
   const param = [name, lat, long];
   connection.query(sql, param, (error, result) => {
      if ( error ) {
         console.error('INSERT cafe Error : ', error.message);
         connection.end();
         return;
      }

      console.log('INSERT success :', result.insertId);
      connection.end();
   });
}

function prepareTable() {
   const fs = require('fs');
   const sql = fs.readFileSync('createCafe.sql', 'utf8');

   connection.query(sql, (error, results) => {
      if ( error ) {
         console.error('Create Table error : ', error.message);
         return;
      }
      console.log('Create Table success');
      connection.end();
   });
};