# 장학금 정보
SELECT stu_no, fee_year, fee_term
FROM fee
WHERE jang_code is not null;

# 장학금 받은 학생
SELECT s.stu_no, s.stu_name, fee_year, fee_term
FROM fee f, student s
WHERE jang_code is not null and f.stu_no=s.stu_no;

# 한번이라도 장학금 받은 학생
SELECT distinct s.stu_no, s.stu_name
FROM fee f, student s
WHERE jang_code is not null and f.stu_no=s.stu_no;

