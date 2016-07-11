# subquery와 exists. JOIN 보다 빠르다
SELECT stu_no, stu_name
FROM student
WHERE EXISTS (SELECT * FROM fee WHERE student.stu_no=stu_no);


# JOIN과 DISTINCT로도 가능
SELECT DISTINCT s.stu_no, s.stu_name
FROM student s, fee f
WHERE s.stu_no=f.stu_no;