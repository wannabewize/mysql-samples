# Subquery와 in
SELECT stu_no, stu_name, id_num
FROM student
WHERE stu_no IN (SELECT stu_no FROM circle WHERE president = 2);

# JOIN 이용
SELECT s.stu_no, s.stu_name, s.id_num
FROM student s, circle c
WHERE s.stu_no=c.stu_no and c.president=2;