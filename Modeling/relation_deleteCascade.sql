drop table if exists Customer;
drop table if exists CustomerOrder;

create table Customer (	
    name varchar(20) primary key
);

create table CustomerOrder (
	 order_no int primary key auto_increment,
    name varchar(20),
    product varchar(20),
    foreign key(name) references Customer(name) on delete cascade
);

insert into Customer values('IU'); 
insert into Customer values('인나');

insert into CustomerOrder(name, product) values('IU', '순하리');
insert into CustomerOrder(name, product) values('인나', '소주');
insert into CustomerOrder(name, product) values('인나', '카스');

select * from Customer;
select * from CustomerOrder;

# Customer 삭제시 CustomerOrder도 삭제 ( delete cascade )
delete from Customer where name='인나';