drop table if exists feeds;
drop table if exists friendship;

create table if not exists feeds (
	id int(4) not null auto_increment,
    user char(10),
    message text,
    primary key(id)
);

create table if not exists friendship (
	user char(10) not null,
    friend char(10) not null
);