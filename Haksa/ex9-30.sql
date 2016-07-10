select stu_no, stu_name
from student
where stu_no in (select stu_no from fee);

select stu_no, stu_name
from student
where exists (select * from fee where stu_no = student.stu_no);


select stu_no, stu_name
from student
where not exists (select * from fee where stu_no = student.stu_no);