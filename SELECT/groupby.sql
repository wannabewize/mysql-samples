create table GroupByExample (
	val int
);

insert into groupbyexample values (1);
insert into groupbyexample values (2);
insert into groupbyexample values (2);
insert into groupbyexample values (3);
insert into groupbyexample values (3);
insert into groupbyexample values (3);
insert into groupbyexample values (4);
insert into groupbyexample values (4);
insert into groupbyexample values (4);
insert into groupbyexample values (4);
insert into groupbyexample values (5);
insert into groupbyexample values (5);
insert into groupbyexample values (5);
insert into groupbyexample values (5);
insert into groupbyexample values (5);


select * from groupbyexample;

#group by

select * from groupbyexample group by val;
select val, count(*) from groupbyexample group by val;

#count(), sum(), avg(), min(), max()

select val, count(val), sum(val), avg(val) from groupbyexample group by val;

#having

select val, count(val), sum(val), avg(val) from groupbyexample group by val having sum(val) > 3 ;
