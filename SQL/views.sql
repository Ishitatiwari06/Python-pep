create view prod_basic as
select * from Products;
select * from prod_basic;
update prod_basic set SupplierID=2 where ProductID=201;
select * from Products;
create view city as
select * from Customers where Address="Delhi";
create view products as
select ProductName,Price from Products;
create view prod_cat as
select * from Products where Category="Electronics";
use lpu;
create index idx_email on students(email);
drop index phonenumber on students;
show index from students;
create unique index idx_phone on students(phonenumber);
create view emp_info as
select Name,Dept,Hire_date,City from Employees where Join_Date>"2023-01-01";
create view emp_report as
select ID,Name,Dept,City,Salary,case when Salary>=80000 then "High" 
when Salary between 60000 and 79999 then "Medium" else "Low" end as Category from Employees;