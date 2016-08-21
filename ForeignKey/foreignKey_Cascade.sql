# Foreign Key가 있고, UPDATE/DELETE의 룰이 CASCADE 인 경우 
# ON UPDATE, ON DELETE CASCADE : 연관 관계의 데이터도 연계돼서 변경된다.

#테이블 삭제 - 초기화
DROP TABLE if exists Replies;
DROP TABLE if exists Posts;

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
   FOREIGN KEY(post_id) REFERENCES Posts(id) ON UPDATE CASCADE ON DELETE CASCADE
);

INSERT INTO Posts VALUES (1, "첫 번째 글");
INSERT INTO Posts VALUES (2, "두 번째 글");

INSERT INTO Replies VALUES (1, 1, "첫 번째 글의 댓글1");
INSERT INTO Replies VALUES (2, 1, "첫 번째 글의 댓글2");
INSERT INTO Replies VALUES (3, 2, "두 번째 글의 댓글1");

# CASCADE 설정으로는 Foreign Key 설정으로 인해서 세 번째 글(없는 글)의 댓글 입력은 에러가 발생한다.
INSERT INTO Replies VALUES (4, 3, "세 번째 글의 댓글1");

# CASCADE 설정 : 댓글이 있는 첫 번째 글을 삭제하면 연관된 댓글도 삭제된다.
DELETE FROM Posts WHERE id = 1;

# CASCADE 설정 : 댓글이 있는 글의 id를 변경하면 댓글의 foreign key도 함께 바뀐다.
UPDATE Posts SET id = 3 WHERE id = 2;

