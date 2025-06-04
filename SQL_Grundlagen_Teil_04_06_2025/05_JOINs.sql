USE Northwind

/*
	Inner Join:
	=> Wenn du nur übereinstimmende Daten aus beiden Tabellen brauchst

	Left Join:
	=> Wenn du nur alle Daten aus der Linken Tabelle brauchst inkl übereinstimmende

	Right Join: 
    => Wenn du nur alle Daten aus der Rechten Tabelle brauchst inkl übereinstimmende

	Full Join:
	=> Wenn du alle Daten aus beiden Tabellen brauchst
*/

SELECT * FROM Customers
SELECT * FROM Orders

/*
	JOIN Syntax:
	SELECT * FROM Tabelle A
	JOIN Tabelle B ON A.KeySpalte = B.KeySpalte
*/

-- JOIN zwischen Orders & Customers
SELECT * FROM Customers
JOIN Orders ON Customers.CustomerID = Orders.CustomerID

SELECT * FROM Customers as cus
INNER JOIN Orders as ord ON cus.CustomerID = ord.CustomerID

SELECT Customers.CustomerID FROM Customers
INNER JOIN Orders ON Customers.CustomerID = Orders.CustomerID

-- JOIN - Orders- Customers - Order Details
SELECT * FROM Customers
JOIN Orders ON Orders.CustomerID = Customers.CustomerID
JOIN [Order Details] ON Orders.OrderID = [Order Details].OrderID
WHERE ContactName = 'Paul Henriot'

-- OUTER Joins: Left/Right und FULL Outer

-- LEFT
-- Bestellungen von keinem Kunden (gibts keine)
SELECT * FROM Orders
LEFT JOIN Customers ON Orders.CustomerID = Customers.CustomerID

-- Right 
-- Kunden ohne Bestellungen => Z.189 & 502
SELECT * FROM Orders
Right JOIN Customers ON Orders.CustomerID = Customers.CustomerID

-- JOIN invertierung machen
SELECT * FROM Orders
FULL OUTER JOIN Customers ON Customers.CustomerID = Orders.CustomerID
WHERE Orders.OrderID IS NULL OR Customers.CustomerID IS NULL

-- CROSS JOIN: Erstellt ein Karthesisches Produkt zweier Tabellen (A x B) (91 x 830)
SELECT * FROM Orders CROSS JOIN Customers
ORDER BY OrderID

-- SELF JOIN
SELECT E1.EmployeeID, E1.LastName as Vorgesetzter, E2.EmployeeID, E2.LastName as Angestellter
FROM Employees as E1 
JOIN Employees as E2 ON E1.EmployeeID = E2.ReportsTo
