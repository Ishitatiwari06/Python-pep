create database day17_triggers;
use day17_triggers;
drop table employees;
create table employees
(
emp_id int primary key auto_increment,
emp_name varchar(50),
department varchar(30),
salary decimal(10,2)
);

create table emp_logs(
log_id int primary key auto_increment,
emp_id int,
action_type varchar(30),
old_salary decimal(10,2),
new_salary decimal(10,2),
action_time timestamp default current_timestamp
);
delimiter $$
create trigger trg_before_insert_sal
before insert
on employees
for each row
begin
	if new.salary < 10000 then
    signal sqlstate '45000'
    set message_text='salary cannot be below 10000';
    end if;
end$$
delimiter ;
insert into employees(emp_name,department,salary)
values('Amit','IT',25000);
insert into employees(emp_name,department,salary)
values('Riya','HR',8000);
select * from employees;
delimiter $$
create trigger trg_after_insert_log
after insert
on employees
for each row
begin
	insert into emp_logs(emp_id,action_type,new_salary)
    values(new.emp_id,'insert',new.salary);
end$$
-- prevents -ve cycle
delimiter ;
insert into employees(emp_name,department,salary)
values('Neha','Finance',45000);
select * from emp_logs;
delimiter $$
create trigger trg_before_update
before update
on employees
for each row
begin
	if new.salary <= 0 then
    signal sqlstate '45000' -- custome error
    set message_text='invalid salary';
    end if;
end$$
delimiter ;
update employees 
set salary=32000
where emp_id=1;
update employees 
set salary=-500
where emp_id=1;