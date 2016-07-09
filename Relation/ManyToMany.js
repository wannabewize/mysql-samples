/**
 * 영화와 영화 배우
 * 영화에는 다수의 배우가 출연
 * 배우는 다수의 영화에 출연
 * */
const connection = require('../dbConn.js');


//addActor('로다주'); // 1
//addActor('기네스펠트로'); // 2
//addActor('크리스 에반스'); // 3
//addActor('스칼렛 요한슨'); // 4
//addActor('휴고위빙'); // 5

// 아이언맨1 : 로다주, 기네스펠트로
//addStaring(1, 1);
//addStaring(1, 2);
//
//// 캡틴 아메리카 : 크리스 에반스, 휴고위빙
//addStaring(2, 3);
//addStaring(2, 5);
//
//// 어밴져스 : 로다주, 스칼렛 요한슨, 크리스 에반스
//addStaring(3, 1);
//addStaring(3, 3);
//addStaring(3, 4);
//
//// 어밴져스3 : 로다주, 기네스펠트로
//addStaring(4, 1);
//addStaring(4, 2);
//
//// 어밴져스 : 로다주, 스칼렛 요한슨, 크리스 에반스
//addStaring(5, 1);
//addStaring(5, 3);
//addStaring(5, 4);

showActor(2);

function showActor(movieId) {
// select a.actor_id, a.name, m.title as movie_name from actor a join movie m on movie_id=1;
   const sql = 'SELECT * from actor where actor_id in ( select actor_id from staring where movie_id = ?)';
   connection.query(sql, movieId, (error, results) => {
      if ( error ) {
         console.log('show Actor Error : ', error.message);
         connection.end();
         return;
      }
      for(var item of results) {
         console.log(item.name);
      }
      connection.end();
   });
}

function addStaring(movieId, actorId) {
   const sql = 'INSERT INTO staring SET ?';
   connection.query(sql, {movie_id:movieId, actor_id:actorId}, (error, result) => {
      if ( error ) {
         console.error('INSERT staring error : ', error.message);
         connection.end();
         return;
      }

      console.log('INSERT staring success');
   });
}


function addActor(name) {
   const sql = 'INSERT INTO actor SET ?';
   connection.query(sql, {name:name}, (error, result) => {
      if ( error ) {
         console.log('INSERT actor Error : ', error.message);
         connection.end();
         return;
      }

      console.log('INSERT actor success : ', result.insertId);
   });
}

