USE Northwind

/*
	
	Temporäre Tabellen

	- SELECT INTO #TableName => Ergebnisse werden in Temporäre Tabelle geschrieben
	- existiert nur innerhalb meiner Session (Skriptfenster)
	- werden in SystemDB => tempDB angelegt
	- Ergebnisse werden nur einmal generiert --> TempTables sehr schnell, aber nicht aktuell
	- Lokal = #
	- Global = ##

*/

-- Erstellen
SELECT * 
INTO #TempTable
FROM Customers
WHERE Country = 'Germany'

-- Temporäre Tabelle aufrufen
SELECT * FROM #TempTable

-- manuell loeschen
DROP TABLE #TempTable

-- globale Temp Table
SELECT * 
INTO ##TempTable12
FROM Customers
WHERE Country = 'Germany'

SELECT * FROM ##TempTable12

-- 1. Hat „Andrew Fuller“ (Employee) schonmal Produkte der Kategorie 
-- „Seafood“ (Categories) verkauft?
-- Wenn ja, wieviel Lieferkosten sind 
-- dabei insgesamt entstanden (Freight)?
-- Das ganze mit Temporaere Tabellen machen
SELECT LastName, SUM(Freight) as Lieferkosten
INTO #FullerFreight
FROM Employees
JOIN Orders ON Employees.EmployeeID = Orders.EmployeeID
JOIN [Order Details] ON Orders.OrderID = [Order Details].OrderID
JOIN Products ON Products.ProductID = [Order Details].ProductID
JOIN Categories ON Categories.CategoryID = Products.CategoryID
WHERE Employees.LastName = 'Fuller' AND Categories.CategoryName = 'Seafood'
GROUP BY LastName

SELECT * FROM #FullerFreight