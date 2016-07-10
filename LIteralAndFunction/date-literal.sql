
CREATE TABLE IF NOT EXISTS date_literal (
    val1 date,
    val2 datetime,
    val3 timestamp,
    val4 time,
    val5 year
);

INSERT INTO date_literal values (now(), now(), now(), now(), now());

SELECT * FROM date_literal;

SELECT now(), curtime();

SELECT dayofmonth('2016-07-28'), dayofweek('20160728'), dayofyear('20160728');

SELECT date_add('2016-07-01', interval 3 day);

SELECT date_format(now(), '%y %m %c');