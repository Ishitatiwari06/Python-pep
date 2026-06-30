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
-- select * from students_lpu where name like "a%"; -- starting with a (case insensitive)
-- select * from students_lpu where name like "%n";
-- select * from students_lpu where name like "%ra%";
-- select * from students_lpu where name like "_____"; -- name with only 5 characters
-- -- or
-- select * from students_lpu where length(name)=5; 
-- --  order by
-- -- select * from students_lpu order by name;
-- -- select * from students_lpu order by batch,name;
-- select * from students_lpu where batch="CSE";
-- select * from students_lpu where age between 19 and 21;
-- select * from students_lpu where age in ('CSE','IT');
-- select name,age from students_lpu where name like "s%";
-- select distinct batch from students_lpu;
-- select name,cgpa from students_lpu;
-- select * from students_lpu order by cgpa desc;

-- change column names
alter table students_lpu change column stu_id Student_ID int;
alter table students_lpu change column name Student_Name varchar(100);
alter table students_lpu change column age Age int;
alter table students_lpu change column batch branch varchar(10);
alter table students_lpu change column cgpa CGPA decimal(3,2), change column AGE Age INT;
alter table students_lpu change column city City varchar(50);
-- add columns
alter table students_lpu add column Gender varchar(30), add column Semester int,
 add column Addmission_Date date, add column Fees decimal(10,2), add column Attendence decimal(5,2);
 alter table students_lpu add column phonenumber varchar(10),add column email text;
desc students_lpu;

update students_lpu set Gender='Female', Semester=6,Addmission_Date='2024-04-05',Fees=84000,Attendence=80,phonenumber=9452839906 where Student_ID=1230397;
update students_lpu set Gender='Male', Semester=6,Addmission_Date='2024-04-05',Fees=89000,Attendence=85,email='ronald@gmail.com' where Student_ID=1237397;
update students_lpu set Gender='Male', Semester=5,Addmission_Date='2025-04-05',Fees=90000,Attendence=90,phonenumber=9452839905,email='rohan@gmail.com' where Student_ID=12211155;
update students_lpu set Gender='female', Semester=7,Addmission_Date='2023-05-05',Fees=84000,Attendence=90 where Student_ID=12305797;
update students_lpu set Gender='Female', Semester=7,Addmission_Date='2023-05-05',Fees=88000,Attendence=90,email='sakshi26@gmail.com' where Student_ID=12307599;
update students_lpu set Gender='Male', Semester=6,Addmission_Date='2024-04-05',Fees=82000,Attendence=90 where Student_ID=12374597;
update students_lpu set Gender='Female', Semester=6,Addmission_Date='2024-04-05',Fees=91000,Attendence=90,phonenumber=9452569905 where Student_ID=12474597;
insert into students_lpu values('Sneha Shukla',12311155,'Agri',8.8,25,'Lucknow','Female',6,'2024-03-01',400000,75,8423345747,NULL);
insert into students_lpu values('Rahul Shukla',12311044,'Finance',8.5,26,'Mumbai','Male',5,'2025-03-01',350000,70,8423645747,NULL);
insert into students_lpu values('Gaurika',12315155,'Science',7.8,25,'Delhi','Female',6,'2024-03-01',400000,75,NULL,'gaur121@gmail.com');
delete from students_lpu where Student_ID=12311044;

select * from students_lpu;
select Student_ID,Student_Name,branch from students_lpu;
select distinct City from students_lpu;
-- 4- names of all without showing duplicate branch name
select Student_Name from students_lpu where branch in (select distinct branch from students_lpu);
select * from students_lpu where branch='CSE';
select * from students_lpu where Age>20;
select * from students_lpu where CGPA>=80.5;
select * from students_lpu where City in ('Delhi','Noida','Lucknow');
select * from students_lpu where Age between 18 and 21;

select * from students_lpu where Student_Name like "A%";
select * from students_lpu where Student_Name like "%a";
select * from students_lpu where Student_Name like "%an%";
select * from students_lpu where City like "N%";
select * from students_lpu where branch='CSE' and CGPA>8;
select * from students_lpu where City='Delhi' and branch='IT';
select * from students_lpu where branch!='Mechanical';
select * from students_lpu where age between 19 and 22 and branch='CSE';
--  NULL Handling
select * from students_lpu where email is NULL;
select * from students_lpu where phonenumber is not null;
-- sorting
select * from students_lpu order by CGPA desc;
select * from students_lpu order by Student_Name;
select * from students_lpu order by branch asc,CGPA desc;
-- Mixed
select Student_Name,City from students_lpu where City='Delhi' and CGPA>8.5;
select * from students_lpu where City!='Delhi';
select * from studnets_lpu where Student_Name like 'S%' and City in ('Delhi','Jaipur');
select * from studnets_lpu where age>20 and branch in ('CSE','IT');
select * from studnets_lpu where City like '%a%' order by Student_Name;
select Student_Name,CGPA from students_lpu where CGPA between 8 and 9;
select * from students_lpu where email!=NULL;
