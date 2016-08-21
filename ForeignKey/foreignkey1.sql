# Foreign Key가 없는 경우

#테이블 삭제
DROP TABLE if exists Posts;
DROP TABLE if exists Replies;

#글 - 테이블 생성
CREATE TABLE Posts (
   id INT(1),
   text TEXT,
   PRIMARY KEY(id)
);

#댓글 - 테이블 생성
CREATE TABLE Replies (
   id INT(1),
   post_id INT(1),
   text TEXT,
   PRIMARY KEY(id)
);

INSERT INTO Posts VALUES (1, "첫 번째 글");
INSERT INTO Posts VALUES (2, "두 번째 글");

INSERT INTO Replies VALUES (1, 1, "첫 번째 글의 댓글1");
INSERT INTO Replies VALUES (2, 1, "첫 번째 글의 댓글2");
INSERT INTO Replies VALUES (3, 2, "두 번째 글의 댓글1");

 # 세 번째 글이 없는데도 댓글 입력이 가능하다.
INSERT INTO Replies VALUES (4, 3, "세 번째 글의 댓글1");

# 댓글이 있는 글의 id를 변경할 수 있다. ( 1 -> 3 )
UPDATE Posts SET id = 3 WHERE id = 1;

 