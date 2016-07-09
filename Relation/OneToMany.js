/**
 * 하나의 영화에 다수의 리뷰를 작성
 * */
const connection = require('../dbConn.js');

addReview(1, '아이언맨 리뷰1');
addReview(1, '아이언맨 리뷰2');
addReview(1, '아이언맨 리뷰3');
addReview(2, '캡틴 아메리카 리뷰1');
addReview(2, '캡틴 아메리카 리뷰2');

showReview(2);

function addReview(movieId, review) {
   const param = {
      movie_id : movieId,
      review : review
   };
   const sql = 'INSERT INTO review set ?';
   connection.query(sql, param, (error, result) => {
      if ( error ) {
         console.log('INSERT review error : ', error.message);
         connection.end();
         return;
      }

      console.log('insert review success');
   });
}

function showReview(movieId) {
   const sql = 'SELECT * FROM review WHERE movie_id = ?';
   connection.query(sql, movieId, (error, results) => {
      if ( error )  {
         console.log('show Review Error : ', error.message);
         connection.end();
         return;
      }
      for(var item of results) {
         console.log(item.review);
      }
   });
}