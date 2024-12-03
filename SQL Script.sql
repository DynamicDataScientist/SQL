create database tm_new_db;

use tm_new_db; #to enter inside the database 

create table student(
id int primary key,
name varchar(20),
age int
);

show tables;
select * from student; # '*' shows all the rows and columns of the table created

insert into student values(1,'Andrew',29);

select * from student;

insert into student values(2,'Bruno',32);

insert into student(id, name, age)
values
(3,'Charlie',47),
(4,'Dane',22),
(5,'Ethan',33);

select * from student;

select name from student;

select name from student where age=47; #here 'where' is a clause 

select name from student where id=5;

create table data(
roll_no int primary key, 
name varchar(20),
marks int,
grade varchar(1),
city varchar(20)
);

insert into data (roll_no, name, marks, grade, city)
values
(1,'Anthony',78,'C','Pune'),
(2,'Bhumika',93,'A','Mumbai'),
(3,'Chetan',85,'B','Mumbai'),
(4,'Dhruv',96,'A','Delhi'),
(5,'Ethan',33,'F','Delhi'),
(6,'Zoya',82,'B','Pune');

select * from data;

select city from data;

select distinct city from data; #distinct is used to display all the unique values from the column 

select name from data where marks>80; #names of students who are securing more than 80 marks 

select name from data where city='Mumbai'; #names of students who are living in Mumbai 

#logical operators - OR, AND, NOT operators
select name from data where marks>80 and city='Delhi';

select name from data where marks>90 or city='Mumbai';

select name from data where city not in ('Mumbai','Delhi');

select name from data where city in ('Mumbai','Delhi');

select * from data where city in ('Mumbai','Delhi');

select name from data where marks between 80 and 90;

select * from data where marks>75 limit 3;

select * from data order by city asc; #order in ascending order
 
select * from data order by marks asc;

select * from data order by marks desc; #descending order 

select name from data order by marks desc limit 3;  #names of top 3 students who have secured the highest marks 
 
#Aggregate functions - count(), max(), min(), sum(), avg()
select * from data;

select max(marks) from data;

select min(marks) from data;

select avg(marks) from data;

select sum(marks) from data;

select count(roll_no) from data;

select city, count(name) from data group by city;

select city, avg(marks) from data group by city order by avg(marks);

select city, avg(marks) from data group by city order by avg(marks) desc;

select grade, count(roll_no) from data group by grade order by grade;

#where clause is used on top of rows
#having clause is used on top of groups

select count(name), city from data group by city having max(marks)>85;

select city from data where grade='A' group by city having max(marks)>90;

#alter table - to modify the existing schema of the table 
select * from data;

alter table data add column age int;

alter table data drop column age;

alter table data change marks score int;

alter table data rename to info;

select * from info;

set sql_safe_updates=0;

update info set grade='O' where grade='A';

update info set score=66 where roll_no=5;

update info set grade='D' where roll_no=5;

show tables;
select * from info;

create table course(
id int primary key,
course varchar(20)
);

insert into course(id,course)
values
(100, 'English'),
(101,'Maths'),
(102,'Science'),
(103,'Computers'),
(104,'Physics'),
(105,'Chemistry');

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


