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
