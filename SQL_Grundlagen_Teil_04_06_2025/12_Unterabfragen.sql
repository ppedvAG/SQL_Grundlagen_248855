USE Northwind

-- Subqueries / Unterabfragen / nested Queries

/*
	- Muessen eigenständig fehlerfrei ausführbar sein fehlerfrei
	- Abfragen werden "von innen nach außen" der Reihe nach ausgeführt
	- Koennen prinzipiell überall in eine Abfrage eingebaut werden => macht es aber Sinn?
*/

-- Zeige mir alle Orders, deren Freight Wert über dem Durchschnitt liegt
SELECT * FROM Orders
WHERE Freight > (SELECT AVG(Freight) FROM Orders)

-- Mehrere Werte aus einer SUbquery in WHERE nutzen
SELECT * FROM Orders
WHERE Freight IN (SELECT TOP 10 Freight FROM Orders)

-- 1. Schreiben Sie eine Abfrage, um eine Produktliste 
--(ID, Name, Stückpreis) mit einem überdurchschnittlichen Preis zu erhalten.
SELECT ProductID, ProductName, UnitPrice FROM Products
WHERE UnitPrice > (SELECT AVG(UnitPrice) FROM Products)