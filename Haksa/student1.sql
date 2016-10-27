CREATE TABLE student (
    stu_no char(10), #학번
    stu_name char(10), #학생이름
    grade int(1), # 학년
    phone_no varchar(14) #휴대전화번호
);

# Table 'student' already exists

CREATE TABLE IF NOT EXISTS student (
    stu_no char(10), #학번
    stu_name char(10), #학생이름
    grade int(1), # 학년
    phone_no varchar(14) #휴대전화번호
);


desc student;

# 중복 stu_no
INSERT INTO student VALUES ('200010010', 'IU', 1, '010-1234-5678');
INSERT INTO student VALUES ('200010010', 'Inna', 2, '010-1234-5679');

# null입력
INSERT INTO student VALUES ('200010010', 'Inna', 1);
