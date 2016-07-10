SELECT * FROM student;

# 박정인 학생의 출생년도 : 1983
SELECT birth_year FROM student WHERE stu_name='박정인';

# 1983년 이전 출생 학생
SELECT stu_name, birth_year
FROM student
WHERE birth_year < 1983;

# subquery를 사용한 방법
SELECT stu_name, birth_year
FROM student
WHERE birth_year < (SELECT birth_year FROM student WHERE stu_name='박정인');

# 동일 테이블을 사용하는 방법
SELECT s.stu_name, s.birth_year
FROM student s, student st
WHERE st.stu_name='박정인' and s.birth_year < st.birth_year;
