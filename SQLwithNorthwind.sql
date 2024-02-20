--author: Rod M
--task: SQL with Northwind

USE Northwind;

--select all rows from 'Customers' table
SELECT * FROM "Customers";

--display unique countries from Customers table
SELECT DISTINCT Country FROM "Customers";

--Get all the rows from the table Customers where the Customer’s ID starts with “BL”.
SELECT * from "Customers" WHERE CustomerID LIKE 'BL%';

--Get the first 100 records of the orders table (with location to organize deliveries)
SELECT TOP 100 * FROM "Orders" ORDER BY ShipCountry;

--Get all customers that live in the postal codes 1010, 3012, 12209, and 05023.
SELECT * FROM "Customers" WHERE PostalCode in ('1010',  '3012', '12209', '05023') ORDER BY Country;

--Get all orders where the ShipRegion is not equal to NULL.
SELECT * FROM "Orders" WHERE ShipRegion IS NOT NULL;

--Get all customers ordered by the country, then by the city.
SELECT * FROM "Customers" ORDER BY Country, City;

--8 Add a new customer to the customers table. You can use whatever values.
INSERT INTO "Customers" (
		CustomerID, 
		CompanyName, 
		ContactName, 
		ContactTitle, 
		Address, 
		City, 
		Region, 
		PostalCode, 
		Country, 
		Phone, 
		Fax)
	VALUES ('PLUM', 'PlumMarket', 'ManagerName', 'TheManager', 'Green St', 'Ann Arbor', 'MI', '48104', 'USA', '123-456-7890', '');

--9 Update all ShipRegion to the value ‘EuroZone’ in the Orders table, where the ShipCountry is equal to France.  
UPDATE Orders 
	SET ShipRegion = 'EuroZone' 
	WHERE ShipCountry = 'France';

--10 Delete all orders from OrderDetails that have quantity of 1. 
--SELECT TOP 10 * FROM [Order Details]; -- for testing
DELETE FROM [Order Details] WHERE 'Quantity' = '1';

--11 Find the CustomerID that placed order 10290 (orders table).
SELECT CustomerID as 'Customer ID' FROM Orders WHERE OrderID = '10290';

--12 Join the orders table to the customers table.
SELECT * FROM Orders
	FULL JOIN Customers On Customers.CustomerID = Orders.CustomerID;

--13 Get employees’ firstname for all employees who report to no one.
SELECT FirstName FROM Employees WHERE ReportsTo IS NULL;

--14 Get employees’ firstname for all employees who report to Andrew.
SELECT FirstName, ReportsTo FROM Employees WHERE ReportsTo = 2; -- Andrew's ID is #2

--15 Write an SQL command to create an index on the CustomerID column in the Customers table.
CREATE INDEX index_customer_id ON Customers(CustomerID);