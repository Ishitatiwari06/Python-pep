-- create database lpu;
 use lpu; 
drop table students_lpu;
-- create table students_lpu(name varchar(20),id int,batch varchar(20),cgpa decimal(4,2),age int,city varchar(20));
-- insert into students_lpu values('Ishita',12305797,'CSE',8.50,22,'Lucknow');
-- insert into students_lpu values('Sakshi',12307599,'CSE',7.56,21,'Bihar');
-- insert into students_lpu values('Rohan',12211155,'AI/ML',8.05,20,'Jharkhand');
 -- insert into students_lpu values('Ayush',12374597,'CSE',9.87,23,'Nagaland');
  insert into students_lpu values('Priya',12474597,'IT',9.07,22,'Uttarakhand');
   insert into students_lpu values('Ron',1237397,'ECE',4.87,21,'Finland');
   insert into students_lpu values('Shreya',1230397,'ECE',7.87,21,'Delhi');
-- select * from students_lpu;
-- alter table students_lpu add primary key(id);
-- truncate table students_lpu;
desc students_lpu;
alter table students_lpu change column id stu_id int;
-- select * from students_lpu where batch="AI/ML";
-- select * from students_lpu where batch="IT";
-- select * from students_lpu where batch="ECE";
-- select * from students_lpu where city="Delhi";
-- select * from students_lpu where cgpa>8 and batch="IT";
-- select * from students_lpu where cgpa>7.5 and batch="ECE";
-- select * from students_lpu where age>20 and batch="CSE";
-- select * from students_lpu where city="Delhi" or city="Mumbai";
-- select * from students_lpu where batch="IT" or batch="CSE";
-- select * from students_lpu where cgpa>8 and batch="ECE";
-- sql do implicit conversion
select * from students_lpu where city!="Finland";
select * from students_lpu where batch!="CSE" and batch!="AI/ML";
select * from students_lpu where cgpa<=8;
/* Advanced Filtering
is null,between,in
*/
select name,age from students_lpu where age is null;
select * from students_lpu where batch in ("AI/ML","CSE");
select * from students_lpu where stu_id in (101,103,108);
/*Regex
like- to search and filter patterns
'_' is a wildcard for exaclty 1 character 
'%' for zero or more matching chars
*/
select * from students_lpu where name like "a%"; -- starting with a (case insensitive)
select * from students_lpu where name like "%n";
select * from students_lpu where name like "%ra%";
select * from students_lpu where name like "_____"; -- name with only 5 characters
-- or
select * from students_lpu where length(name)=5; 
--  order by
-- select * from students_lpu order by name;
-- select * from students_lpu order by batch,name;
select * from students_lpu where batch="CSE";
select * from students_lpu where age between 19 and 21;
select * from students_lpu where age in ('CSE','IT');
select name,age from students_lpu where name like "s%";
select distinct batch from students_lpu;
select name,cgpa from students_lpu;
select * from students_lpu order by cgpa desc;