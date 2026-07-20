create database companyDB;
use companyDB;
create table employees
(
emp_id int primary key,
emp_name varchar(50),
department varchar(30),
salary decimal(10,2)
);
insert into employees values
(101,"Rahul","IT",55000),
(102,'Aman','HR',45000),
(103,'Priya','Finance',70000),
(104,'Sneha','IT',60000),
(105,'Rohit','Sales',45000),
(106,'Kiran','HR',52000);
select * from employees;
--  stored procedure
delimiter //
create procedure ShowAllEmployees()
begin
select * from employees;
end //
delimiter ;
call ShowAllEmployees()
delimiter //
create procedure employeedepartment( in dept varchar(30) )
begin
select * from employees where department=dept;
end //
delimiter ;
call employeedepartment('HR');
call employeedepartment('Finance');
delimiter //
create procedure salarygreaterthan( in amt decimal(10,2) )
begin
select * from employees where salary>amt;
end //
delimiter ;
call salarygreaterthan(10000);
delimiter //
create procedure empminfilter(minsal decimal(10,2) )
begin
select * from employees where salary>minsal;
end //
delimiter ;
call empminfilter(60000);
delimiter //
create procedure empfilter( in dept varchar(30), minsal decimal(10,2) )
begin
select * from employees where department=dept and salary=minsal;
end //
delimiter ;
call empfilter('IT',50000);
show procedure status;
show create procedure ShowAllEmployees;
drop procedure ShowAllEmployees;
delimiter //
create procedure ShowAllEmployees()
begin
select * from employees;
end //
delimiter ;