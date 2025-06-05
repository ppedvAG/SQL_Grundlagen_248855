USE Northwind

-- Aggregatfunktionen: Führt eine Berechnung auf einer Menge von Werten durch und gibt ein
--					   einziges Ergebnis zurück
-- Ausnahme: COUNT(*) ignoriert keine NULL Werte, Aggregatfunktionen schon

-- 5 grundsätzliche Funktionen

SELECT 
SUM(Freight) AS Summe,
MIN(Freight) AS Minimum,
MAX(Freight) AS Maximum,
AVG(Freight) AS Durchschnitt,
COUNT(ShippedDate) AS ZähleSpalte, COUNT(*) AS ZähleAlles
FROM Orders

-- AVG Selber Berechnen
SELECT SUM(Freight) / Count(*) FROM Orders

SELECT CustomerID, SUM(Freight) FROM Orders
-- => Lösung => Über group by

-- Alles was kein Aggregat im SELECT ist, wird ZWINGEND im GROUP BY angegeben
SELECT CustomerID, SUM(Freight) FROM Orders
GROUP BY CustomerID

-- Quantity Summe pro ProductName
SELECT ProductName, SUM(Quantity) as SummeStueckzahl FROM [Order Details]
JOIN Products ON Products.ProductID = [Order Details].ProductID
GROUP BY ProductName
ORDER BY SummeStueckzahl DESC

-- Quantity Summe pro ProductName für Produkte der KAtegorie 1-4
SELECT ProductName, SUM(Quantity) as SummeStueckZahl FROM [Order Details]
JOIN Products ON Products.ProductID = [Order Details].ProductID
WHERE CategoryID IN (1,2,3,4)
GROUP BY ProductName
ORDER BY SummeStueckZahl DESC

-- Quantity Summe Pro ProductName für Produkte die aber über 1000 liegen!!
-- HAVING funktioniert 1zu1 wie WHERE, kann aber gruppierte/aggregierte Werte filtern
SELECT ProductName, SUM(Quantity) as SummeStueckZahl FROM [Order Details]
JOIN Products ON Products.ProductID = [Order Details].ProductID
GROUP BY ProductName
HAVING SUM(Quantity) > 1000
ORDER BY SummeStueckZahl DESC
