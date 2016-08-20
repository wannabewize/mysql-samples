# Foreign Key가 없는 경우

#테이블 삭제
drop table if exists Posts;
drop table if exists Replies;

#글 - 테이블 생성
create table Posts (
   id int(1),
   text text,
   primary key(id)
);

#댓글 - 테이블 생성
create table Replies (
   id int(1),
   post_id int(1),
   text text,
   primary key(id)
);

insert into Posts values (1, "첫 번째 글");
insert into Posts values (2, "두 번째 글");

insert into Replies values (1, 1, "첫 번째 글의 댓글1");
insert into Replies values (2, 1, "첫 번째 글의 댓글2");
insert into Replies values (3, 2, "두 번째 글의 댓글1");
 # 세 번째 글이 없어도 동작한다.
insert into Replies values (4, 3, "세 번째 글의 댓글1");