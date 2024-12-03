use topmentor_db;

select * from course;

create table student_data(
id int primary key,
name varchar(15));

insert into student_data
values
(101,'Adam'),
(102,'Cathri'),
(103,'Charlie'),
(104,'Laren');

select * from student_data;

#INNER JOIN
select * from course as c
inner join
student_data as s on c.id=s.id;

#LEFT JOIN
select * from course as c
left join
student_data as s on c.id=s.id;

#RIGHT JOIN
select * from course as c
right join
student_data as s on c.id=s.id;

#FULL OUTER JOIN
select * from course as c left join student_data as s on c.id=s.id 
union all
select * from course as c right join student_data as s on c.id=s.id;

#LEFT EXCLUSIVE JOIN
select * from course as c
left join
student_data as s on c.id=s.id where s.id is null;

#RIGHT EXCLUSIVE JOIN
select * from course as c
right join
student_data as s on c.id=s.id where c.id is null;

create table info(
roll_no int primary key,
name varchar(15),score int,grade char,city varchar(15));

insert into info values
(1, 'Anthony',78,'A','Pune'),
(2, 'Bina',88,'A','Pune'),(3, 'Anna',70,'B','Pune'),
(4, 'James',65,'B','Pune'),
(5, 'Tony',73,'B','Pune'),
(6, 'Sam',82,'A','Pune'),
(7, 'Josh',88,'A','Pune'),
(8, 'Jenny',90,'A','Pune'),
(9, 'Ben',60,'C','Pune'),
(10, 'Loren',67,'C','Pune');

select * from info;

UPDATE info
SET city= 'Jaipur'
WHERE roll_no=10;

#SUB QUERIES
select name,score from info where score>(select avg(score) from info);

select max(score) from info;
select name,city from info where city='Banglore' and score=(select max(score) from info);

select roll_no,name from info where roll_no in (select roll_no from info where roll_no%2=0);

use organisation;

show tables;
alter table customer drop column contactname;

select * from customer;

alter table customer add column Salary int;

insert into customer values
(101,'John','India',77000),
(102,'Anna','UK',85000),
(103,'Jacob','India',60000),
(104,'Leena','US',92000),
(105,'Andrew','Canada',82000),
(106,'Sam','Canada',72000);

select * from customer where salary>(select avg(salary) from customer);

select * from customer where salary>(select salary from customer where customername='Anna');

#VIEWS
create view info1 as select roll_no,name,score from info;

select * from info1;

select * from data;

#alter table : used to change the schema of the table

alter table data add column age int;

alter table data drop column age;

alter table data rename column roll_no to id;

select * from student;

select * from data;

set sql_safe_updates=0;#important before performing updates operations

update data set marks=66 where id=5;

update data set grade='C' where grade='F';


