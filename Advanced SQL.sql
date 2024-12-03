use classicmodels;

show tables;

select * from orderdetails;

select * from products;

select productcode,productname,msrp from products where productcode in (select productcode from orderdetails where priceeach<100);

select p.productcode,p.productname,p.msrp from products as p join orderdetails as o on p.productcode=o.productcode where o.priceeach<100; 

use organisation;

select * from customer;

alter table customer add column dept varchar(20);

alter table customer add column age int;

select * from customer;

update customer set age=22 where customerid=101;

update customer set age=28 where customerid=102;

update customer set age=32 where customerid=103;

update customer set age=21 where customerid=104;

update customer set age=26 where customerid=105;

update customer set age=25 where customerid=106;

select dept,round(avg(salary),2) as Avg_Salary from customer group by dept;

use country;

drop table if exists tables1;

create table table1(
ID varchar(133),
name varchar(133)
);

insert into table1 (id,name) 
values ('n1','AS'),
('n2','BR'),
('n3','GA'),
('n4','GJ'),
('n5','HR');

select * from table1;

#if all states are known
select * ,
case when name='BR' then 'Bihar'
when name='AS' then 'Assam'
when name='GA' then 'Goa'
when name='GJ' then 'Gujarat'
when name='HR' then 'Haryana'
end as full_name
from table1;

#if any condition not met then use else part
select * ,
case when name='BR' then 'Bihar'
when name='AS' then 'Assam'
when name='GA' then 'Goa'
when name='HR' then 'Haryana'
else 'State is not present'
end as full_name
from table1;

CREATE TABLE table2(orderid integer,stateid varchar(200),status varchar(200),amount integer); 

INSERT INTO table2(orderid,stateid,status,amount) 
VALUES
('1','s1','shipped','67050'),
('2','s2','delivered','68608'),
('3','s3','packed','62545'),
('4','s2','shipped','54033'),
('5','s1','delivered','39284'),
('6','s2','shipped','80372'),
('7','s2','delivered','66399'),
('8','s3','packed','48914'),
('9','s1','packed','95459'),
('10','s1','delivered','70493'),
('11','s2','delivered','58017'),
('12','s3','packed','80360'),
('13','s1','delivered','90328'),
('14','s3','shipped','32283'),
('15','s2','packed','62551'),
('16','s3','packed','18273'),
('17','s2','shipped','46131'),
('18','s1','packed','18713');

select * from table2;

select stateid,
count(case when status='shipped' then orderid end) as Shipped_order,
count(case when status='delivered' then orderid end) as Delivered_order,
count(case when status='packed' then orderid end) as Packed_order
from table2
group by stateid;

select stateid,
sum(case when status='shipped' then amount end) as Shipped_order,
sum(case when status='delivered' then amount end) as Delivered_order,
sum(case when status='packed' then amount end) as Packed_order
from table2
group by stateid;

create table swap_con_number(
id varchar(133),
name varchar(133));

insert into swap_con_number(id,name) 
values ('1','n1'),
('2','n2'),
('3','n3'),
('4','n4'),
('5','n5');

select * from swap_con_number;

select a.id,isnull(b.name) name from swap_con_number a left join swap_con_number b on
(case when a.id%2=0 then a.id-1
when a.id%2=1 then a.id+1 end)=b.id; 

show tables;
