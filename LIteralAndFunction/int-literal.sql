DROP TABLE int_literal;

CREATE TABLE IF NOT EXISTS int_literal (
    val INT(2)
);

# 정수,양수, 음수
insert into int_literal(val) values (1);
insert into int_literal(val) values (+1);
insert into int_literal(val) values (-1);

# 정수형으로 변경
insert into int_literal(val) values (3.14); # 3
insert into int_literal(val) values (7.8); # 8

# Out of range
insert into int_literal(val) values (9999999999);

# Type Error
insert into int_literal(val) values ('char value');

select * from int_literal;