-- DATABASE --
create database shop


-- TABLES --
create table productSupply
(
p_id int primary key,
price int,
brand varchar(20)
);

create table dkpStore
(
pdt_id int primary key,
pdt_name varchar(40),
price int,

foreign key(pdt_id) references productSupply(p_id)
);


-- DATA INSERTION --
insert into productSupply(p_id,price,brand) values
(1023,40,'Nestle'),
(1024,30,'Cadbury'),
(1025,80,'Tata'),
(1026,20,'Sundrop'),
(1027,100,'Sundrop');

insert into dkpStore(pdt_id,pdt_name,price) values
(1025,'Salt',100),
(1023,'Maggi Family pack',50),
(1026,'Biscuits',25),
(1027,'Oil',125),
(1024,'DairyMilk',35);

delete from dkpstore where pdt_id=1023;

truncate table dkpstore;

drop table dkpstore;

update productsupply
set price=null 
where p_id=1024;
