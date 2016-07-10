select stu_no, stu_name, birth_year from student
where birth_year <= all (select birth_year from student);

select stu_no, stu_name, birth_year from student
where birth_year <= (select min(birth_year) from student);

select min(birth_year) from student;


select stu_no, stu_name, id_num
from student
where birth_year > any (select birth_year from student);

select stu_no, stu_name, id_num
from student
where birth_year > (select min(birth_year) from student);
