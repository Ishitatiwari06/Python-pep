create database normalization_lab;
use normalization_lab;
create table OrderData
(
OrderID INT,
CustomerName varchar(50),
Phone varchar(15),
Address varchar(100),
ProductName varchar(50),
Category varchar(30),
SupplierName varchar(50),
SupplierPhone varchar(15),
Quantity int,
Price decimal(10,2)
);
insert into OrderData values
(101,'Rahul','9877543211','Delhi','Laptop','Electronics','ABC Suppliers','9991111111',1,65000),
(102,'Rahul','9877543211','Delhi','Mouse','Electronics','ABC Suppliers','9991111111',2,2700),
(103,'Rahul','9877543211','Delhi','Keyboard','Electronics','ABC Suppliers','9991111111',1,12000),
(104,'Aman','9249204444','Noida','Laptop','Electronics','ABC Suppliers','9991111111',1,65000),
(105,'Aman','9877543211','Noida','Pendrive','Accessories','ABC Suppliers','9991111111',3,65000),
(106,'Priya','9877543211','Lucknow','Laptop','Electronics','ABC Suppliers','9991111111',1,65000),
(107,'Priya','9877543233','Lucknow','Headphones','Accessories','XYZ Traders','999222222',1,800),
(108,'Sneha','9877543244','Mumbai','Pendrive','Accessories','ABC Traders','9991111111',2,8300),
(109,'Sneha','9877543244','Mumbai','Headphones','Accessories','XYZ Traders','999222222',1,18600);
create table Suppliers
(
SupplierID int primary key,
SupplierName varchar(50),
SupplierPhone varchar(15)
);
create table Customers
(
CustomerID INT primary key,
CustomerName varchar(50),
Phone varchar(15),
Address varchar(100)
);
create table Products
(
ProductID int primary key,
ProductName varchar(50),
Category varchar(30),
Price decimal(10,2),
SupplierID int,
foreign key(SupplierID) references Suppliers(SupplierID)
);
create table Orders
(
OrderID INT primary key,
CustomerID int,
foreign key (CustomerID) references Customers(CustomerID)
);
create table OrderDetails
(
OrderID INT,
ProductID int,
Quantity int,
primary key(OrderID,ProductID),
foreign key (ProductID) references Products(ProductID),
foreign key (OrderID) references Orders(OrderID)
);
insert into Customers values
(101,'Rahul','9877543211','Delhi'),
(102,'Aman','9249204444','Noida'),
(103,'Priya','9877543211','Lucknow'),
(104,'Sneha','9877543244','Mumbai'),
(105,'Gaurav','9889979944','Hyderabad');
insert into Suppliers values
(1,'ABC Suppliers','9991111111'),
(2,'XYZ Traders','999222222');
insert into Products values
(101,'Laptop','Electronics',65000,1),
(102,'Mouse','Electronics',2700,1),
(103,'Keyboard','Electronics',12000,1),
(104,'Pendrive','Accessories',3000,2),
(105,'Headphones','Accessories',35000,2);
insert into Orders values
(1,101),
(2,102),
(3,103),
(4,104),
(5,105);
insert into OrderDetails values
(1,101,1),
(2,102,2),
(3,103,1);
-- ques
-- update rahul's phone no
update Customers set phone="9543839905" where CustomerName="Rahul";
-- add new customer without adding any order
insert into Customers values(106,"Shreya","9294039556","Delhi");
-- delete order 102, check whether customer information still exists
delete from Orders where OrderId=2; -- error as child table OrderDetails has record of OrderId=2