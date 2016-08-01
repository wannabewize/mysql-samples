drop table if exists Customer;
drop table if exists CustomerOrder;

create table Customer (	
    name varchar(20) primary key
);

create table CustomerOrder (
	 order_no int primary key auto_increment,
    name varchar(20),
    product varchar(20),
    foreign key(name) references Customer(name) 
);

insert into Customer values('IU');
# primary key 중복 - 에러
insert into Customer values('IU'); 
insert into Customer values('인나');

insert into CustomerOrder(name, product) values('IU', '순하리');
insert into CustomerOrder(name, product) values('인나', '소주');

# FK 에러 - 설현은 데이터베이스에 없다.
insert into CustomerOrder(name, product) values('설현', '카스');

select * from Customer;
select * from CustomerOrder;

# 삭제 에러 - CustomerOrder 로 인해서 Customer 삭제 에러
delete from Customer where name='인나';

# CustomerOrder를 먼저 삭제해야 한다.
delete from CustomerOrder where name='인나';
# CustomerOrder 삭제 이후에 Customer 삭제 가능
delete from Customer where name='인나';
