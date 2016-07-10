#2007년 등록 정보
SELECT * FROM fee WHERE fee_year=2007;

# 2007년 학생 등록 정보 - 학기까지
SELECT s.stu_no, stu_name, fee_term
FROM fee f, student s
WHERE fee_year=2007 and f.stu_no=s.stu_no;


# 2007년 학생 등록 정보 - 학기 관계 없음
SELECT distinct s.stu_no, stu_name
FROM fee f, student s
WHERE fee_year=2007 and f.stu_no=s.stu_no;