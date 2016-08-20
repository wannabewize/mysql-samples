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
   primary key(id),
   foreign key(post_id) references Posts(id)
);

insert into Posts values (1, "첫 번째 글");
insert into Posts values (2, "두 번째 글");

insert into Replies values (1, 1, "첫 번째 글의 댓글1");
insert into Replies values (2, 1, "첫 번째 글의 댓글2");
insert into Replies values (3, 2, "두 번째 글의 댓글1");

 # Foreign Key 설정으로 인해서 세 번째 글(없는 글)의 댓글 입력은 에러가 발생한다.
insert into Replies values (4, 3, "세 번째 글의 댓글1");

# Foreign Key 설정으로, 댓글이 있는 첫 번째 글 삭제가 불가능하다.
delete from Posts where id = 1;

# 첫 번째 글을 삭제하려면, 댓글을 먼저 삭제해야 한다.
delete from Replies where post_id = 1;
delete from Posts where id = 1;