# Foreign Key가 없는 경우

#테이블 삭제 - 초기화
DROP TABLE if exists Posts;
DROP TABLE if exists Replies;

#글 - 테이블 생성
CREATE TABLE Posts (
   id INT(1),
   text TEXT,
   primary KEY(id)
);

#댓글 - 테이블 생성
CREATE TABLE Replies (
   id INT(1),
   post_id INT(1),
   text TEXT,
   PRIMARY KEY(id),
   FOREIGN KEY(post_id) REFERENCES Posts(id)
);

INSERT INTO Posts VALUES (1, "첫 번째 글");
INSERT INTO Posts VALUES (2, "두 번째 글");

INSERT INTO Replies VALUES (1, 1, "첫 번째 글의 댓글1");
INSERT INTO Replies VALUES (2, 1, "첫 번째 글의 댓글2");
INSERT INTO Replies VALUES (3, 2, "두 번째 글의 댓글1");

# Foreign Key 설정으로 인해서 세 번째 글(없는 글)의 댓글 입력은 에러가 발생한다.
INSERT INTO Replies VALUES (4, 3, "세 번째 글의 댓글1");

# Foreign Key 설정으로, 댓글이 있는 첫 번째 글 삭제가 불가능하다.
DELETE FROM Posts WHERE id = 1;

# 댓글이 있는 글의 id는 변경할 수 없다. 에러 발생!
UPDATE Posts SET id = 3 WHERE id = 1;

# 첫 번째 글을 삭제하려면, 댓글을 먼저 삭제해야 한다.
DELETE FROM Replies WHERE post_id = 1;
DELETE FROM Posts WHERE id = 1;