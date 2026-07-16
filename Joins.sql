use normalization_lab;
SET FOREIGN_KEY_CHECKS = 0;
truncate table OrderDetails;
truncate table Orders;
truncate table Products;
truncate table Suppliers;
truncate table Customers;
SET FOREIGN_KEY_CHECKS = 1;
INSERT INTO Customers VALUES
(101,'Amit Sharma','9876543210','Delhi'),
(102,'Priya Singh','9876543211','Mumbai'),
(103,'Rahul Verma','9876543212','Delhi'),
(104,'Sneha Gupta','9876543213','Pune'),
(105,'Arjun Mehta','9876543214','Bangalore'),
(106,'Neha Kapoor','9876543215','Delhi'),
(107,'Rohan Das','9876543216','Kolkata'),
(108,'Simran Kaur','9876543217','Chandigarh'),
(109,'Anjali Roy','9876543218','Mumbai'),
(110,'Vikas Yadav','9876543219','Lucknow'),
(111,'Karan Malhotra','9876543220','Delhi'),
(112,'Pooja Jain','9876543221','Jaipur'),
(113,'Harsh Kumar','9876543222','Delhi'),
(114,'Nikita Sharma','9876543223','Mumbai');

INSERT INTO Suppliers VALUES
(1,'TechWorld','9991111111'),
(2,'HomeEssentials','9991111112'),
(3,'FashionHub','9991111113'),
(4,'FreshFoods','9991111114'),
(5,'OfficeMart','9991111115'),
(6,'Global Suppliers','9991111116'),
(7,'Future Electronics','9991111117'),
(8,'Dream Traders','9991111118');

INSERT INTO Products VALUES
(201,'Laptop','Electronics',55000,1),
(202,'Mouse','Electronics',800,1),
(203,'Keyboard','Electronics',1500,1),
(204,'Office Chair','Furniture',6500,2),
(205,'Dining Table','Furniture',12000,2),
(206,'T-Shirt','Clothing',700,3),
(207,'Jeans','Clothing',1500,3),
(208,'Rice Bag','Groceries',1800,4),
(209,'Cooking Oil','Groceries',1800,4),
(210,'Notebook','Stationery',120,5),
(211,'Printer','Electronics',12000,5),
(212,'Monitor','Electronics',15000,7),
(213,'Headphones','Electronics',2500,7),
(214,'Bookshelf','Furniture',6500,2),
(215,'Pen Drive','Electronics',800,1);

INSERT INTO Orders VALUES
(1001,101),
(1002,102),
(1003,101),
(1004,103),
(1005,104),
(1006,105),
(1007,106),
(1008,107),
(1009,108),
(1010,109),
(1011,105),
(1012,110);

INSERT INTO OrderDetails VALUES

(1001,201,1),
(1001,202,2),

(1002,203,1),
(1002,206,3),

(1003,204,1),
(1003,203,5),

(1004,205,1),
(1004,207,2),

(1005,208,4),
(1005,209,3),

(1006,201,1),
(1006,213,2),

(1007,202,4),
(1007,211,1),

(1008,203,2),

(1009,212,1),
(1009,206,2),

(1010,207,3),
(1010,208,2),

(1011,201,1),
(1011,205,1),

(1012,202,3),
(1012,209,4);

select p.ProductID,s.SupplierName from Products p join Suppliers s on p.SupplierID=S.SupplierID;
select * from Orders join OrderDetails on Orders.OrderID=OrderDetails.OrderID;
select c.CustomerID,o.OrderID from Customers c left join Orders o on c.CustomerID=o.CustomerID;

select c.CustomerName,o.OrderID from Customers c join Orders o on c.CustomerID=o.CustomerID;
select p.ProductName,p.Price,s.SupplierName from Products p join Suppliers s on p.SupplierID=s.SupplierID;
select p.ProductName,s.SupplierName from Products p join SupplierName s on p.SupplierID=s.SupplierID where p.Category="Electronics";
select c.CustomerName from Customers c join Orders on c.CustomerID=Orders.CustomerID order by c.CustomerName;
select s.SupplierName,p.ProductName from Suppliers s join Products p on s.SupplierID=p.SupplierID order by s.SupplierName;

select o.OrderID,p.ProductName,o.Quantity,p.Price from Products p join Orders o on  p.ProductID=o.ProductID;
select c.CustomerName,p.ProductName,o.Quantity from Customers c, Products p join OrderDetails o on p.ProductID=O.ProductID;
select p.ProductName,s.SupplierName from Products p join Suppliers s on p.SupplierID=s.SupplierID where p.Price>1000;
select c.CustomerName,o.OrderID from Customers c join Orders o on c.CustomerID=o.CustomerID where c.CustomerName like "A%";
select p.ProductName from Products p join Suppliers s on p.SupplierID=s.SupplierID where p.ProductName like "%Tech%";
select p.ProductName,s.SupplierName from Products p join Suppliers s on p.SupplierID=s.SupplierID where p.Price  between 500 and 3000 order by p.Price desc;
select c.CustomerName,o.OrderID from Customers c join Orders o on c.CustomerID=o.CustomerID where c.Address="Delhi";
select p.ProductName,o.Quantity from Products p join OrderDetails o on p.ProductID=O.ProductID where o.Quantity>5;
select s.SupplierName from Products p join Suppliers s on p.SupplierID=s.SupplierID where p.Category in ("Electronics","Furniture");
select c.CustomerName,o.OrderID from Customers c join Orders o on c.CustomerID=o.CustomerID where c.Address!="Mumbai";

-- Advanced ques
-- top 5 products purchased 
select o.OrderID,p.ProductName,c.CustomerName,s.SupplierName,od.Quantity from
OrderDetails od join Orders o on c.OrderID=o.OrderID
join Customers c on o.CustomerID=c.CustomerID
join Products p on od.ProductID=p.ProductID
join Suppliers s on s.SupplierID=p.SupplierID;
--  customers who has purchased the heighest total quantity of products display customer name and total quantity?

-- Subqueries
-- products whose amt is more than avg of all products
select ProductName from Products where Price>(select avg(Price) from Products);
select ProductName from Products where Price=(select max(Price) from Products);
select c.CustomerName from Customers c join Orders o on c.CustomerID=o.CustomerID;
-- Products supplied by suppliers from Delhi
select distinct p.ProductName,s.SupplierID from Customers c,Products p join Suppliers s on s.SupplierID=p.SupplierID where c.Address="Delhi";
-- Supplier supplies products with above avg price
select distinct p.ProductName,s.SupplierID from Products p join Suppliers s on s.SupplierID=p.SupplierID where p.Price>(select avg(Price) from Products);
-- latest order
select * from Orders order by OrderID desc limit 1;
-- customers who ordered expensive products
select c.CustomerName from Products p,Customers c join Orders o on o.CustomerID=c.CustomerID where p.Price>1000;
--  Suppliers whose products were never ordered
select s.SupplierName from Suppliers s 
join Products p on p.SupplierID=s.SupplierID 
join OrderDetails o on o.ProductID=p.ProductID
where p.ProductID!=o.ProductID;
--  find products costing more than every stationary product
select ProductName from Products where Price>(select Price from Products where Category="Stationery");

-- String Functions
select upper(CustomerName) from Customers;
select lower(CustomerName) from Customers;
select CustomerName,length(CustomerName) as Length from Customers;
select concat(CustomerName,Address) as Name_City from Customers;
select substr(CustomerName,1,4) from Customers;
select replace(CustomerName,'a','*') from Customers;
select trim('	Database Systems	');
select upper(CustomerName),lower(Address) from Customers;
select substr(ProductName,1,3) from Products;
select ProductName from Products where length(ProductName)>8;
select concat(CustomerName,' (',Address,')') as 'CustomerName(CITY)' from Customers;
select replace(ProductName,' ','_') as Product_Name from Products;
select Address,length(Address) as Length from Customers;
select concat(substr(CustomerName,1,1),substr(CustomerName,locate(' ',CustomerName)+1,1)) as Initials from Customers;
select concat('Rahul',' purchased',' laptop') as concat;
select substr(ProductName,1,5) from Products;
select upper(ProductName) from Products;
select SupplierName,length(SupplierName) as Length from Suppliers;
select trim(CustomerName) as Name from Customers;
select concat(CustomerName,' - ',Address) as 'CustomerName - CITY' from Customers;

-- Mixed Ques
-- total amt spend by each customer
select c.CustomerName,sum((od.quantity)*(p.Price)) as Total_Spent from OrderDetails od join Products p on od.ProductID=p.ProductID
join Orders o on o.OrderID=od.OrderID 
join Customers c on o.CustomerID=c.CustomerID group by c.CustomerName;
-- customers who have placed more than 1 order
select c.CustomerID,c.CustomerName from
Orders o join Customers c on o.CustomerID=c.CustomerID group by c.CustomerID,c.CustomerName having count(o.OrderID)>=2;
-- find avg price of products supplied by each supplier
select p.ProductName,avg(p.Price) as Average_Price from Products p join Suppliers s on p.SupplierID=s.SupplierID group by p.ProductName;
-- Top 5 most expensive products
select ProductName from Products order by Price desc limit 5 ;
-- Products never ordered
select ProductName from Products where ProductID not in (select ProductID from OrderDetails);
-- supplier name along with number of products they supply
select s.SupplierName,count(p.ProductID) as No_of_Products from Suppliers s join Products p on s.SupplierID=p.SupplierID group by s.SupplierName;
-- customers who purchased products from more than 1 supplier
select c.CustomerID,c.CustomerName from Customers c join Orders o on o.CustomerID=c.CustomerID join OrderDetails od on od.OrderID=o.OrderID join Products p on p.ProductID=od.ProductID group by c.CustomerID,c.CustomerName having count(distinct p.SupplierID)>1;
-- product ordered in highest quantity
select p.ProductID,p.ProductName,sum(od.Quantity) as TotalQuantity from Products p join OrderDetails od on od.ProductID=p.ProductID group by p.ProductID,p.ProductName order by TotalQuantity desc;
-- first 3 chars of product name whose price>avg price
select substr(ProductName,1,3) as Name from Products where Price>(select avg(Price) from Products);
-- customer name in uppercase along with their total purchase amt
select upper(c.CustomerName),sum(p.Price*od.Quantity) as TotalAmt from Customers c 
join Orders o on o.CustomerID=c.CustomerID 
join OrderDetails od on od.OrderID=o.OrderID
join Products p on p.ProductID=od.ProductID group by c.CustomerID,c.CustomerName;

-- Advanced problems
-- customers whose total purchase > avg customer purchase
select c.CustomerName as Customer_Name,sum((od.quantity)*(p.Price)) as Total_Spent from OrderDetails od join Products p on od.ProductID=p.ProductID
join Orders o on o.OrderID=od.OrderID 
join Customers c on o.CustomerID=c.CustomerID group by c.CustomerID,c.CustomerName
having Total_Spent>(select avg(CustomerTotal) from
(select sum((od.quantity)*(p.Price)) as CustomerTotal from  OrderDetails od
join Products p on od.ProductID=p.ProductID
join Orders o on o.OrderID=od.OrderID group by o.CustomerID) as AvgTable); 
-- supplier whose products are never appeared in any order
select s.SupplierID,s.SupplierName from Suppliers s where not exists (select 1 from OrderDetails od join Products p on od.ProductID=p.ProductID where p.SupplierID=s.SupplierID);
-- customers who placed max number of orders
select c.CustomerName,count(o.OrderID) as no_of_orders from Orders o
join Customers c on c.CustomerID=o.CustomerID group by c.CustomerID,c.CustomerName order by no_of_orders desc;
-- second highest priced product
select ProductID,ProductName,Price from Products where price=(select max(Price) from Products where Price<(select max(Price) from Products));
-- products whose prices > avg price of products in their supplier gp
select p1.ProductID,p1.ProductName from Products p1 where p1.Price > (select avg(p2.Price) from Products p2 where p2.SupplierID=p1.SupplierID);
-- display cities having more than 3 customers
select Address from Customers group by Address having count(CustomerName)>3;
-- customers who purchased most expensive products
select distinct c.CustomerID, c.CustomerName from Customers c 
join Orders o on o.CustomerID=c.CustomerID 
join OrderDetails od on od.OrderID=o.OrderID 
join Products p on p.ProductID=od.ProductID where p.Price=(select max(Price) from Products);
-- products ordered by at least 5 different customers
select p.ProductID,p.ProductName from Products p 
join OrderDetails od on od.ProductID=p.ProductID 
join Orders o on od.OrderID=o.OrderID group by p.ProductID,p.ProductName having count(distinct o.CustomerID)>5;
-- suppliers contributing highest revenue
select s.SupplierID,s.SupplierName,sum(p.Price*od.Quantity) as Revenue from Suppliers s 
join Products p on p.SupplierID=s.SupplierID 
join OrderDetails od on od.ProductID=p.ProductID
group by s.SupplierID,s.SupplierName 
having Revenue=(select max(total) from (select sum(p.Price*od.Quantity) as total from Products p join OrderDetails od on od.ProductID=p.ProductID group by p.SupplierID) as t);
-- products whose names contain exactly 6 characters
select distinct ProductName from Products where length(ProductName)=6;