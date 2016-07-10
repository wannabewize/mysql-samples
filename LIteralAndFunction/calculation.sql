drop table calculation;

CREATE TABLE calculation (
	val1 int,
    val2 int
);

INSERT INTO calculation values (1, 2);
INSERT INTO calculation values (1, NULL);

select val1, val2 from calculation;

# 4칙 연산, alias(as)
select val1, val2, val1 + val2 as plus, val1 - val2 as minus , val1 * val2 as multiply, val1 / val2 as devide from calculation;

# ifnull
select val1, val2, val1 + ifnull(val2, 99) as plus from calculation;