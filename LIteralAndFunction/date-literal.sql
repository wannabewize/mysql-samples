DROP TABLE date_literal;

CREATE TABLE IF NOT EXISTS date_literal (
    val1 date,
    val2 datetime
);

# 2016-05-01, 2016-05-01 07:00:07
insert into date_literal(val1, val2) values (now(), now());

insert into date_literal(val1, val2) values ('2016-12-25', '2015-12-24 15:30:33');


select * from date_literal;