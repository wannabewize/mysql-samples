# 등록 정보
select * from fee;

# 등록한 학생의 학생 정보, 장학금 여부
select s.stu_no, s.stu_name, fee_year, fee_term, jang_code, jang_total, fee_div
from fee f, student s
where f.stu_no=s.stu_no and fee_div='Y';