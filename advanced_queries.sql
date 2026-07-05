use lpu;
create table Attendence(
Student_ID INT,
Subject_Code varchar(10),
Attendence_Date date,
primary key(Student_ID,Subject_Code)
);
insert into Attendence values
(101,"SQL101",'2026-08-01'),
(101,"PY101","2026-07-01");
create table Enrollments(
Enrollment_ID INT PRIMARY KEY,
Student_ID INT,
Course_Name varchar(50),
foreign key(Student_ID)
references students(Student_ID)
);	
insert into Enrollments values
(1,101,"Python"),
(2,102,"SQL");
create table Students_Auto(
Student_ID INT auto_increment primary key,
Subject_Name varchar(100)
);
-- alter table Students_Auto change column Subject_Name Student_Name varchar(100);
insert into Students_Auto(Student_Name) values
("Priya"),
("Rahul");
insert into Students_Auto(Student_Name) values
("Aman");
select * from students;
DESC students;
insert into students values("Rahul",104,"CSE",8.52,25,"Delhi","male",8,"2025-04-05",1500000,98,9452829905,"rahul060@gmail.com");
insert into students(Student_Name,Student_ID,Branch,CGPA,Age,Gender,Semester,Addmission_Date,Fees,Attendence,phonenumber) values("Shreya",105,"IT",8.02,21,"female",7,"2023-04-10",1500000,79,8452829905);