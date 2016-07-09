/**
 * 영화와 영화 상세 정보 - 1:1
 * */
const connection = require('../dbConn.js');

//prepareTable();

addMovie('아이언맨', '존 파브르', 2008, '영웅은 태어나지 않는다! 다만 만들어질 뿐이다!'); // 로다주, 기네스펠트로
addMovie('캡틴 아메리카 퍼스트 어벤져', '조 존스톤', 2011, '포기를 모르는 자, 최초의 슈퍼히어로로 깨어나다'); // 크리스 에반스, 휴고위빙
addMovie('어밴저스', '조스웨던', 2012, '최강의 슈퍼히어로들이 모였다.'); // 로다주, 스칼렛 요한슨, 크리스 에반스
addMovie('아이언맨3', '존 파브르', 2013, '21세기 가장 매력적인 히어로의 귀환 지금까지의 아이언맨은 잊어라!'); // 로다주, 기네스펠트로
addMovie('어밴저스 에이지 오브 울트론', '조스웨던', 2015, '어벤져스는 끝났다! 희망은 없다!'); // 로다주, 스칼렛 요한슨, 크리스 에반스
addMovie('캡틴 아메리카 시빌워', '앤소니 루소', 2016, '어벤져스 VS 어벤져스 분열은 시작되었다!'); // 로다주, 스칼렛 요한슨, 크리스 에반스


function addMovie(title, director, year, synopsis) {
   const sql = 'INSERT INTO movie set ?';
   var param = { title : title };
   connection.query(sql, param, (error, result) => {
      if ( error ) {
         console.error('INSERT movie Error : ', error.message);
         connection.end();
         return;
      }

      console.log('insert movie success : ', result);

      const generatedId = result.insertId;

      const param2 = {movie_id : generatedId, director : director, year : year, synopsis : synopsis};
      const sql2 = 'INSERT INTO movie_detail SET ?';
      connection.query(sql2, param2, (error, result) => {
         if ( error ) {
            console.error('INSERT movie_detail Error : ', error.message);
            connection.end();
            return;
         }
         console.log('add new movie detail success');
      });
   });
}


function prepareTable() {
   const fs = require('fs');
   const sql = fs.readFileSync('OneToOne.sql', 'utf8');

   connection.query(sql, (error, results) => {
      if ( error ) {
         console.error('table prepare error : ', error.message);
         return;
      }
      console.log('table preparation success');

      connection.end();
   });
};