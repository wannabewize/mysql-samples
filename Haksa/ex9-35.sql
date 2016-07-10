#긍정
select stu_no, stu_name
from circle
where cir_name = 'Java길라잡이';

# 부정
select stu_no, stu_name, cir_name
from circle
where cir_name <> 'Java길라잡이';

# NOT을 이용한 부정
select stu_no, stu_name, cir_name
from circle
where not cir_name = 'Java길라잡이';