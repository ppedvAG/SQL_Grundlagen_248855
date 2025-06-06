USE Northwind

-- Subqueries / Unterabfragen / nested Queries

/*
	- Muessen eigenst�ndig fehlerfrei ausf�hrbar sein fehlerfrei
	- Abfragen werden "von innen nach au�en" der Reihe nach ausgef�hrt
	- Koennen prinzipiell �berall in eine Abfrage eingebaut werden => macht es aber Sinn?
*/

-- Zeige mir alle Orders, deren Freight Wert �ber dem Durchschnitt liegt
SELECT * FROM Orders
WHERE Freight > (SELECT AVG(Freight) FROM Orders)

-- Mehrere Werte aus einer SUbquery in WHERE nutzen
SELECT * FROM Orders
WHERE Freight IN (SELECT TOP 10 Freight FROM Orders)

-- 1. Schreiben Sie eine Abfrage, um eine Produktliste 
--(ID, Name, St�ckpreis) mit einem �berdurchschnittlichen Preis zu erhalten.
SELECT ProductID, ProductName, UnitPrice FROM Products
WHERE UnitPrice > (SELECT AVG(UnitPrice) FROM Products)