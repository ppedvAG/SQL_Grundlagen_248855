USE Northwind
GO
-- Views: Erzeugt eine Virtuelle Tabelle, deren Inhalt durch eine Abfrage definiert wird

/*
	Vorteile:
		- Um komplexere Abfragen zu speichern
		- Sicherheit: User oder Abteilungen (wo die User drinnen sind) ermöglichen nur die View
		  zu lesen, oder nur zu verändern, oder beides
		- Views sind immer aktuell (aktuelle Daten immer)
			=> beim Aufruf der View, wird das hinterlegte Statement ausgeführt
*/

CREATE VIEW dbo.vRechnungsDaten AS
SELECT 
Orders.OrderID, Customers.CustomerID, CompanyName, Customers.Country, Customers.City, 
Customers.PostalCode, Customers.Address,
Freight, OrderDate, LastName,
CAST(SUM((UnitPrice * Quantity) * (1 - Discount)) + Freight as decimal(10,2)) as SummeBestPosi
FROM [Order Details]
JOIN Orders ON Orders.OrderID = [Order Details].OrderID
JOIN Customers ON Customers.CustomerID = Orders.CustomerID
JOIN Employees ON Employees.EmployeeID = Orders.EmployeeID
GROUP BY Orders.OrderID, Customers.CustomerID, CompanyName, Customers.Country, Customers.City, 
Customers.PostalCode, Customers.Address,
Freight, OrderDate, LastName
GO

-- Aufruf der View
SELECT * FROM vRechnungsDaten
GO

---- View loeschen
--DROP VIEW vRechnungsDaten

-- Code hinter eine View ansehen über Objekt Explorer
-- Rechtsklick auf View -> SKRIPT ALS -> CREATE IN -> Neues Abfragefenster

-- View Ändern
ALTER VIEW vRechnungsDaten AS
SELECT 
Orders.OrderID, Customers.CustomerID, CompanyName, Customers.Country, Customers.City, 
Customers.PostalCode, Customers.Address,
Freight, OrderDate, LastName,
CAST(SUM((UnitPrice * Quantity) * (1 - Discount)) + Freight as decimal(10,2)) as SummeBestPosi
FROM [Order Details]
JOIN Orders ON Orders.OrderID = [Order Details].OrderID
JOIN Customers ON Customers.CustomerID = Orders.CustomerID
JOIN Employees ON Employees.EmployeeID = Orders.EmployeeID
GROUP BY Orders.OrderID, Customers.CustomerID, CompanyName, Customers.Country, Customers.City, 
Customers.PostalCode, Customers.Address,
Freight, OrderDate, LastName
GO



CREATE VIEW vTest AS
SELECT CompanyName, Country, City FROM Customers
WHERE Country = 'Germany'
GO

-- Kann nicht gleich wie View heißen, also Prozedur
CREATE VIEW dbo.spCustOrderHist AS
SELECT * FROM Customers
GO