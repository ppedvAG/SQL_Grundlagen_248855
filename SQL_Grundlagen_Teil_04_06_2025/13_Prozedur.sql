USE Northwind
GO

/*
	-- Stored Procedures / gespeicherte Prozeduren

	- sind gespeicherte SQL Anweisungen (nicht nur SELECT, sondern auch alles andere)
	- Arbeiten mit Variablen
	- Werden als Datenbankobjekt auf der Datenbank gespeichert => dbo
	- Praktisch zum "automatisieren" von Code
	- Prozeduren verwenden Ihren QueryPlan jedes mal wieder
*/

CREATE PROCEDURE spOrderID 
@OrderID INT
AS
SELECT * FROM Orders
WHERE OrderID = @OrderID
GO

-- Ausführen der Prozedur
EXEC spOrderID 10250
GO

CREATE PROCEDURE spNeuerKunde
@CustomerID char(5), @CompanyName varchar(30),
@Country varchar(30), @City varchar(30)
AS
INSERT INTO Customers (CustomerID, CompanyName, Country, City)
VALUES (@CustomerID, @CompanyName, @Country, @City)

EXEC spNeuerKunde 'ALDIS', 'Aldi GmbH', 'Germany', 'Burghausen'
EXEC spNeuerKunde PPEDV, 'ppedv Ag', Germany, Burghausen

SELECT * FROM Customers
GO

-- Default Werte
CREATE PROCEDURE spCountryCity
@Country varchar(30) = 'Germany', @City varchar(30) = 'Berlin'
AS
SELECT * FROM Customers 
WHERE Country = @Country AND City = @City

EXEC spCountryCity France, Paris
EXEC spCountryCity DEFAULT, Köln
GO


-- 1. Erstelle eine Procedure, der man als Parameter eine OrderID übergeben kann.
-- Bei Ausführung soll der Rechnungsbetrag dieser Order ausgegeben werden 
-- SUM(Quantity * UnitPrice + Freight) = RechnungsSumme.
CREATE PROCEDURE sp_RechnungsSumme @OrderID INT 
AS
SELECT Orders.OrderID, SUM(Quantity * UnitPrice + Freight) as RechnungsSumme
FROM Orders JOIN [Order Details] ON Orders.OrderID = [Order Details].OrderID
WHERE Orders.OrderID = @OrderID
GROUP BY Orders.OrderID
GO

EXEC sp_RechnungsSumme 10248
GO