USE Northwind

-- WHERE: filtert Ergebniszeilen
SELECT * FROM Customers
WHERE Country = 'Germany'

-- = sucht nach exakten Treffern
SELECT * FROM Customers
WHERE Country = ' Germany'

SELECT * FROM Orders
WHERE Freight = 100

-- alle boolschen Vergleichsoperatoren verwenden
-- (>, <, >=, <=, != bzw <>)

SELECT * FROM Orders
WHERE Freight > 500

SELECT * FROM Customers
WHERE Country != 'Germany'

-- Kombinieren von WHERE Ausdrücken mit AND oder OR
SELECT * FROM Customers
WHERE Country = 'Germany' AND City = 'Berlin'

SELECT * FROM Customers
WHERE Country = 'Germany' OR City = 'Berlin'

-- AND = "Beide" Bedingungen wahr sein
-- OR = Ein Ausdruck wahr sein
-- Können beliebig oft kombiniert werden

-- Vorsicht: bei Kombination
SELECT * FROM Customers
WHERE (City = 'Paris' OR City = 'Berlin') AND Country = 'Germany'
-- AND stärker bindenter ist als OR; Notfalls Klammer setzen

SELECT * FROM Orders
WHERE Freight >= 100 AND Freight <= 500

-- Alternative mit BETWEEN, Randwerte sind mit dabei
SELECT * FROM Orders
WHERE Freight BETWEEN 100 AND 500

SELECT * FROM Customers
WHERE Country = 'Brazil' OR Country = 'Germany' OR Country = 'France'

-- Alternative => IN (Wert1, Wert2, Wert3)
SELECT * FROM Customers
WHERE Country IN ('Brazil', 'Germany', 'France')

-- IN verbindet mehrere OR Bedingungen, aber beziehen sich nur AUF eine einzige SPALTE

-- Übungen:

-- 1. Alle ContactNames die als Title "Owner" haben
SELECT  ContactName, ContactTitle FROM Customers
WHERE ContactTitle = 'Owner'

-- 2. Alle Order Details die ProductID 43 bestellt haben
SELECT * FROM [Order Details]
WHERE ProductID = 43

-- 3. Alle Kunden die aus Paris, Berlin, Madrid und Brasilien kommen
SELECT * FROM Customers
WHERE City IN ('Paris', 'Berlin', 'Madrid') OR Country = 'Brazil'

-- 4. Alle Customers rausholen, die keine Fax haben
SELECT * FROM Customers
WHERE Fax IS  NULL

-- 5. Haben wir Produkteinheiten im Lager (UnitsInStock), die aber nicht
-- mehr verkauft werden (Discontinued)? Wenn ja, wieviel "Geld" liegt dort im Lager?
-- Rechnung: UnitsInStock * UnitPrice

SELECT ProductName, UnitsInStock * UnitPrice as Wert FROM Products
WHERE Discontinued = 1 AND UnitsInStock != 0
ORDER BY Wert