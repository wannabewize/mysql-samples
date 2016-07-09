DROP TABLE float_literal;

CREATE TABLE IF NOT EXISTS float_literal (
    val float(2)
);

# 정상 실행
insert into float_literal(val) values (1);
insert into float_literal(val) values (+1);
insert into float_literal(val) values (-1);

insert into float_literal(val) values (3.14); # 3.14
insert into float_literal(val) values (7.8); # 7.8
insert into float_literal(val) values (4E-3); # 0.004
insert into float_literal(val) values (4.5E+3); # 4500


# 정상
insert into float_literal(val) values (9999999999);

# Type Error
insert into float_literal(val) values ('char value');

select * from float_literal;
