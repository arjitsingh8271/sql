show databases;
create database celebal_level_A_task;
show databases;
use celebal_level_A_task;


CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY,
    CompanyName VARCHAR(255),
    ContactName VARCHAR(255),
    ContactTitle VARCHAR(255),
    Address VARCHAR(255),
    City VARCHAR(255),
    Region VARCHAR(255),
    PostalCode VARCHAR(50),
    Country VARCHAR(255),
    Phone VARCHAR(50),
    Fax VARCHAR(50)
);

INSERT INTO Customers (CustomerID, CompanyName, ContactName, ContactTitle, Address, City, Region, PostalCode, Country, Phone, Fax)
VALUES
(1, 'Company A', 'John Doe', 'Manager', '123 Main St', 'Berlin', 'Berlin', '10000', 'Germany', '123-456-7890', '123-456-7891'),
(2, 'Company B', 'Jane Smith', 'Sales', '456 Park Ave', 'London', 'London', '20000', 'UK', '234-567-8901', '234-567-8902'),
(3, 'Company C', 'Mike Johnson', 'Owner', '789 Broadway', 'New York', 'NY', '10001', 'USA', '345-678-9012', '345-678-9013'),
(4, 'Company D', 'Chris Brown', 'Director', '321 Elm St', 'Toronto', 'ON', 'M5G2C3', 'Canada', '456-789-0123', NULL),
(5, 'Company E', 'Patricia Taylor', 'Sales', '654 Pine St', 'Paris', 'Île-de-France', '75000', 'France', '567-890-1234', '567-890-1235');

-- -------------------------------------------------------------

CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY,
    LastName VARCHAR(255),
    FirstName VARCHAR(255),
    Title VARCHAR(255),
    TitleOfCourtesy VARCHAR(255),
    BirthDate DATE,
    HireDate DATE,
    Address VARCHAR(255),
    City VARCHAR(255),
    Region VARCHAR(255),
    PostalCode VARCHAR(50),
    Country VARCHAR(255),
    HomePhone VARCHAR(50),
    Extension VARCHAR(10),
    Photo BLOB,
    Notes TEXT,
    ReportsTo INT,
    FOREIGN KEY (ReportsTo) REFERENCES Employees(EmployeeID)
);

INSERT INTO Employees (EmployeeID, LastName, FirstName, Title, TitleOfCourtesy, BirthDate, HireDate, Address, City, Region, PostalCode, Country, HomePhone, Extension, Photo, Notes, ReportsTo)
VALUES
(1, 'Davolio', 'Nancy', 'Sales Representative', 'Ms.', '1948-12-08', '1992-05-01', '507 - 20th Ave. E.Apt. 2A', 'Seattle', 'WA', '98122', 'USA', '206-555-9857', '5467', NULL, 'Education includes a BA in psychology from Colorado State University in 1970. She also completed "The Art of the Cold Call." Nancy is a member of Toastmasters International.', NULL),
(2, 'Fuller', 'Andrew', 'Vice President, Sales', 'Dr.', '1952-02-19', '1992-08-14', '908 W. Capital Way', 'Tacoma', 'WA', '98401', 'USA', '206-555-9482', '3457', NULL, 'Andrew received his BTS commercial in 1974 and a Ph.D. in international marketing from the University of Dallas in 1981. He is fluent in French and Italian.', 1),
(3, 'Leverling', 'Janet', 'Sales Representative', 'Ms.', '1963-08-30', '1992-04-01', '722 Moss Bay Blvd.', 'Kirkland', 'WA', '98033', 'USA', '206-555-3412', '3355', NULL, 'Janet has a BS degree in chemistry from Boston College (1984). She has also completed a certificate program in food retailing management. Janet was hired as a sales associate in 1991 and promoted to sales representative in February 1992.', 2);

-- ----------------------------------------------------------

CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    CustomerID INT,
    EmployeeID INT,
    OrderDate DATE,
    RequiredDate DATE,
    ShippedDate DATE,
    ShipVia INT,
    Freight DECIMAL(10, 2),
    ShipName VARCHAR(255),
    ShipAddress VARCHAR(255),
    ShipCity VARCHAR(255),
    ShipRegion VARCHAR(255),
    ShipPostalCode VARCHAR(50),
    ShipCountry VARCHAR(255),
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID),
    FOREIGN KEY (EmployeeID) REFERENCES Employees(EmployeeID)
);

INSERT INTO Orders (OrderID, CustomerID, EmployeeID, OrderDate, RequiredDate, ShippedDate, ShipVia, Freight, ShipName, ShipAddress, ShipCity, ShipRegion, ShipPostalCode, ShipCountry)
VALUES
(1, 1, 1, '2023-01-01', '2023-01-05', '2023-01-03', 1, 32.38, 'Company A', '123 Main St', 'Berlin', 'Berlin', '10000', 'Germany'),
(2, 2, 2, '2023-02-01', '2023-02-05', '2023-02-03', 2, 11.61, 'Company B', '456 Park Ave', 'London', 'London', '20000', 'UK'),
(3, 3, 3, '2023-03-01', '2023-03-05', '2023-03-03', 3, 45.45, 'Company C', '789 Broadway', 'New York', 'NY', '10001', 'USA');

-- -------------------------------------------------------------

CREATE TABLE Suppliers (
    SupplierID INT PRIMARY KEY,
    CompanyName VARCHAR(255),
    ContactName VARCHAR(255),
    ContactTitle VARCHAR(255),
    Address VARCHAR(255),
    City VARCHAR(255),
    Region VARCHAR(255),
    PostalCode VARCHAR(50),
    Country VARCHAR(255),
    Phone VARCHAR(50),
    Fax VARCHAR(50),
    HomePage TEXT
);

INSERT INTO Suppliers (SupplierID, CompanyName, ContactName, ContactTitle, Address, City, Region, PostalCode, Country, Phone, Fax, HomePage)
VALUES
(1, 'Exotic Liquids', 'Charlotte Cooper', 'Purchasing Manager', '49 Gilbert St.', 'London', NULL, 'EC1 4SD', 'UK', '(171) 555-2222', NULL, NULL),
(2, 'New Orleans Cajun Delights', 'Shelley Burke', 'Order Administrator', 'P.O. Box 78934', 'New Orleans', 'LA', '70117', 'USA', '(100) 555-4822', NULL, NULL),
(3, 'Grandma Kelly’s Homestead', 'Regina Murphy', 'Sales Representative', '707 Oxford Rd.', 'Ann Arbor', 'MI', '48104', 'USA', '(313) 555-5735', '(313) 555-3349', NULL);

-- -------------------------------------------------------------

CREATE TABLE Categories (
    CategoryID INT PRIMARY KEY,
    CategoryName VARCHAR(255),
    Description TEXT
);

INSERT INTO Categories (CategoryID, CategoryName, Description)
VALUES
(1, 'Beverages', 'Soft drinks, coffees, teas, beers, and ales'),
(2, 'Condiments', 'Sweet and savory sauces, relishes, spreads, and seasonings'),
(3, 'Confections', 'Desserts, candies, and sweet breads');

-- ----------------------------------------------------------------

CREATE TABLE Products (
    ProductID INT PRIMARY KEY,
    ProductName VARCHAR(255),
    SupplierID INT,
    CategoryID INT,
    QuantityPerUnit VARCHAR(255),
    UnitPrice DECIMAL(10, 2),
    UnitsInStock INT,
    UnitsOnOrder INT,
    ReorderLevel INT,
    Discontinued BIT,
    FOREIGN KEY (SupplierID) REFERENCES Suppliers(SupplierID),
    FOREIGN KEY (CategoryID) REFERENCES Categories(CategoryID)
);

INSERT INTO Products (ProductID, ProductName, SupplierID, CategoryID, QuantityPerUnit, UnitPrice, UnitsInStock, UnitsOnOrder, ReorderLevel, Discontinued)
VALUES
(1, 'Chai', 1, 1, '10 boxes x 20 bags', 18.00, 39, 0, 10, 0),
(2, 'Chang', 1, 1, '24 - 12 oz bottles', 19.00, 17, 40, 25, 0),
(3, 'Aniseed Syrup', 1, 2, '12 - 550 ml bottles', 10.00, 13, 70, 25, 0),
(4, 'Chef Anton’s Cajun Seasoning', 2, 2, '48 - 6 oz jars', 22.00, 53, 0, 0, 0),
(5, 'Chef Anton’s Gumbo Mix', 2, 2, '36 boxes', 21.35, 0, 0, 0, 1);

-- ----------------------------------------------------------------

CREATE TABLE OrderDetails (
    OrderID INT,
    ProductID INT,
    UnitPrice DECIMAL(10, 2),
    Quantity INT,
    Discount DECIMAL(3, 2),
    PRIMARY KEY (OrderID, ProductID),
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID),
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);

INSERT INTO OrderDetails (OrderID, ProductID, UnitPrice, Quantity, Discount)
VALUES
(1, 1, 18.00, 10, 0),
(1, 3, 10.00, 5, 0),
(2, 2, 19.00, 7, 0),
(2, 4, 22.00, 3, 0),
(3, 1, 18.00, 20, 0.1),
(3, 5, 21.35, 2, 0.05);

-- -----------------------------------------------------

-- 1. List of all customers
SELECT * FROM Customers;


-- 2. list of all customers where company name ending in N
SELECT * FROM Customers
WHERE CompanyName LIKE '%N';


-- 3. list of all customers who live in Berlin or London
SELECT * FROM Customers
WHERE City IN ('Berlin', 'London');


-- 4. list of all customers who live in UK or USA
SELECT * FROM Customers
WHERE Country IN ('UK', 'USA');


-- 5. list of all products sorted by product name
SELECT * FROM Products
ORDER BY ProductName;


-- 6. list of all products where product name starts with an A
SELECT * FROM Products
WHERE ProductName LIKE 'A%';


-- 7. List of customers who ever placed an order
SELECT DISTINCT Customers.*
FROM Customers
JOIN Orders ON Customers.CustomerID = Orders.CustomerID;


-- 8. list of Customers who live in London and have bought chai
SELECT DISTINCT Customers.*
FROM Customers
JOIN Orders ON Customers.CustomerID = Orders.CustomerID
JOIN OrderDetails ON Orders.OrderID = OrderDetails.OrderID
JOIN Products ON OrderDetails.ProductID = Products.ProductID
WHERE Customers.City = 'London' AND Products.ProductName = 'Chai';


-- 9. List of customers who never place an order
SELECT * FROM Customers
WHERE CustomerID NOT IN (SELECT CustomerID FROM Orders);


-- 10. List of customers who ordered Tofu
SELECT DISTINCT Customers.*
FROM Customers
JOIN Orders ON Customers.CustomerID = Orders.CustomerID
JOIN OrderDetails ON Orders.OrderID = OrderDetails.OrderID
JOIN Products ON OrderDetails.ProductID = Products.ProductID
WHERE Products.ProductName = 'Tofu';


-- 11. Details of first order of the system
SELECT * FROM Orders
ORDER BY OrderDate ASC
LIMIT 1;


-- 12. Find the details of most expensive order date
SELECT Orders.*
FROM Orders
JOIN OrderDetails ON Orders.OrderID = OrderDetails.OrderID
GROUP BY Orders.OrderID
ORDER BY SUM(OrderDetails.UnitPrice * OrderDetails.Quantity) DESC
LIMIT 1;


-- 13. For each order get the OrderID and Average quantity of items in that order
SELECT OrderID, AVG(Quantity) AS AvgQuantity
FROM OrderDetails
GROUP BY OrderID;


-- 14. For each order get the orderID, minimum quantity and maximum quantity for that order
SELECT OrderID, MIN(Quantity) AS MinQuantity, MAX(Quantity) AS MaxQuantity
FROM OrderDetails
GROUP BY OrderID;


-- 15. Get a list of all managers and total number of employees who report to them.
SELECT e1.EmployeeID, e1.FirstName, e1.LastName, COUNT(e2.EmployeeID) AS NumberOfReports
FROM Employees e1
LEFT JOIN Employees e2 ON e1.EmployeeID = e2.ReportsTo
GROUP BY e1.EmployeeID, e1.FirstName, e1.LastName
HAVING COUNT(e2.EmployeeID) > 0;


-- 16. Get the OrderID and the total quantity for each order that has a total quantity of greater than 300
SELECT OrderID, SUM(Quantity) AS TotalQuantity
FROM OrderDetails
GROUP BY OrderID
HAVING SUM(Quantity) > 300;


-- 17. list of all orders placed on or after 1996/12/31
SELECT * FROM Orders
WHERE OrderDate >= '1996-12-31';


-- 18. list of all orders shipped to Canada
SELECT * FROM Orders
WHERE ShipCountry = 'Canada';


-- 19. list of all orders with order total > 200
SELECT Orders.OrderID, SUM(OrderDetails.UnitPrice * OrderDetails.Quantity) AS OrderTotal
FROM Orders
JOIN OrderDetails ON Orders.OrderID = OrderDetails.OrderID
GROUP BY Orders.OrderID
HAVING SUM(OrderDetails.UnitPrice * OrderDetails.Quantity) > 200;


-- 20. List of countries and sales made in each country
SELECT ShipCountry, SUM(OrderDetails.UnitPrice * OrderDetails.Quantity) AS TotalSales
FROM Orders
JOIN OrderDetails ON Orders.OrderID = OrderDetails.OrderID
GROUP BY ShipCountry;


-- 21. List of Customer ContactName and number of orders they placed
SELECT Customers.ContactName, COUNT(Orders.OrderID) AS NumberOfOrders
FROM Customers
JOIN Orders ON Customers.CustomerID = Orders.CustomerID
GROUP BY Customers.ContactName;


-- 22. List of customer contactnames who have placed more than 3 orders
SELECT Customers.ContactName, COUNT(Orders.OrderID) AS NumberOfOrders
FROM Customers
JOIN Orders ON Customers.CustomerID = Orders.CustomerID
GROUP BY Customers.ContactName
HAVING COUNT(Orders.OrderID) > 3;


-- 23. List of discontinued products which were ordered between 1/1/1997 and 1/1/1998
SELECT DISTINCT Products.*
FROM Products
JOIN OrderDetails ON Products.ProductID = OrderDetails.ProductID
JOIN Orders ON OrderDetails.OrderID = Orders.OrderID
WHERE Products.Discontinued = 1
  AND Orders.OrderDate BETWEEN '1997-01-01' AND '1998-01-01';


-- 24. List of employee firsname, lastName, superviser FirstName, LastName
SELECT e1.FirstName AS EmployeeFirstName, e1.LastName AS EmployeeLastName, e2.FirstName AS SupervisorFirstName, e2.LastName AS SupervisorLastName
FROM Employees e1
LEFT JOIN Employees e2 ON e1.ReportsTo = e2.EmployeeID;


-- 25. List of Employees id and total sale condcuted by employee
SELECT Employees.EmployeeID, SUM(OrderDetails.UnitPrice * OrderDetails.Quantity) AS TotalSales
FROM Employees
JOIN Orders ON Employees.EmployeeID = Orders.EmployeeID
JOIN OrderDetails ON Orders.OrderID = OrderDetails.OrderID
GROUP BY Employees.EmployeeID;


-- 26. list of employees whose FirstName contains character 'a'
SELECT * FROM Employees
WHERE FirstName LIKE '%a%';


-- 27. List of managers who have more than four people reporting to them.
SELECT e1.EmployeeID, e1.FirstName, e1.LastName, COUNT(e2.EmployeeID) AS NumberOfReports
FROM Employees e1
LEFT JOIN Employees e2 ON e1.EmployeeID = e2.ReportsTo
GROUP BY e1.EmployeeID, e1.FirstName, e1.LastName
HAVING COUNT(e2.EmployeeID) > 4;


-- 28. List of Orders and ProductNames
SELECT Orders.OrderID, Products.ProductName
FROM Orders
JOIN OrderDetails ON Orders.OrderID = OrderDetails.OrderID
JOIN Products ON OrderDetails.ProductID = Products.ProductID;


-- 29. List of orders place by the best customer
SELECT Orders.*
FROM Orders
JOIN (
    SELECT CustomerID, COUNT(OrderID) AS NumberOfOrders
    FROM Orders
    GROUP BY CustomerID
    ORDER BY NumberOfOrders DESC
    LIMIT 1
) AS BestCustomer ON Orders.CustomerID = BestCustomer.CustomerID;


-- 30. List of orders placed by customers who do not have a Fax number
SELECT Orders.*
FROM Orders
JOIN Customers ON Orders.CustomerID = Customers.CustomerID
WHERE Customers.Fax IS NULL;


-- 31. List of Postal codes where the product Tofu was shipped
SELECT DISTINCT Orders.ShipPostalCode
FROM Orders
JOIN OrderDetails ON Orders.OrderID = OrderDetails.OrderID
JOIN Products ON OrderDetails.ProductID = Products.ProductID
WHERE Products.ProductName = 'Tofu';


-- 32. List of product Names that were shipped to France
SELECT DISTINCT Products.ProductName
FROM Orders
JOIN OrderDetails ON Orders.OrderID = OrderDetails.OrderID
JOIN Products ON OrderDetails.ProductID = Products.ProductID
WHERE Orders.ShipCountry = 'France';


-- 33. List of ProductNames and Categories for the supplier 'Specialty Biscuits, Ltd.
SELECT Products.ProductName, Categories.CategoryName
FROM Products
JOIN Suppliers ON Products.SupplierID = Suppliers.SupplierID
JOIN Categories ON Products.CategoryID = Categories.CategoryID
WHERE Suppliers.CompanyName = 'Specialty Biscuits, Ltd.';


-- 34. List of products that were never ordered
SELECT * FROM Products
WHERE ProductID NOT IN (SELECT DISTINCT ProductID FROM OrderDetails);


-- 35. List of products where units in stock is less than 10 and units on order are 0.
SELECT * FROM Products
WHERE UnitsInStock < 10 AND UnitsOnOrder = 0;


-- 36. List of top 10 countries by sales
SELECT Orders.ShipCountry, SUM(OrderDetails.UnitPrice * OrderDetails.Quantity) AS TotalSales
FROM Orders
JOIN OrderDetails ON Orders.OrderID = OrderDetails.OrderID
GROUP BY Orders.ShipCountry
ORDER BY TotalSales DESC
LIMIT 10;


-- 37. Number of orders each employee has taken for customers with CustomerIDs between A and AO
SELECT Employees.EmployeeID, COUNT(Orders.OrderID) AS NumberOfOrders
FROM Employees
JOIN Orders ON Employees.EmployeeID = Orders.EmployeeID
WHERE Orders.CustomerID BETWEEN 'A' AND 'AO'
GROUP BY Employees.EmployeeID;


-- 38. Orderdate of most expensive order
SELECT Orders.OrderDate
FROM Orders
JOIN OrderDetails ON Orders.OrderID = OrderDetails.OrderID
GROUP BY Orders.OrderID
ORDER BY SUM(OrderDetails.UnitPrice * OrderDetails.Quantity) DESC
LIMIT 1;


-- 39. Product name and total revenue from that product
SELECT Products.ProductName, SUM(OrderDetails.UnitPrice * OrderDetails.Quantity) AS TotalRevenue
FROM Products
JOIN OrderDetails ON Products.ProductID = OrderDetails.ProductID
GROUP BY Products.ProductName;


-- 40. Supplierid and number of products offered
SELECT SupplierID, COUNT(ProductID) AS NumberOfProducts
FROM Products
GROUP BY SupplierID;


-- 41. Top ten customers based on their business
SELECT Customers.CustomerID, Customers.CompanyName, SUM(OrderDetails.UnitPrice * OrderDetails.Quantity) AS TotalSpent
FROM Customers
JOIN Orders ON Customers.CustomerID = Orders.CustomerID
JOIN OrderDetails ON Orders.OrderID = OrderDetails.OrderID
GROUP BY Customers.CustomerID, Customers.CompanyName
ORDER BY TotalSpent DESC
LIMIT 10;


-- 42. What is the total revenue of the company.
SELECT SUM(OrderDetails.UnitPrice * OrderDetails.Quantity) AS TotalRevenue
FROM OrderDetails;







