drop table if exists cafes;

CREATE TABLE cafes (
   cafe_id    int(10) auto_increment, 
   name       varchar(20),
   location   geometry,
   primary key(cafe_id)
);
