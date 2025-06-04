USE Northwind
-- LIKE: F�r ungenaue Filterung/Suche k�nnen wir LIKE verwenden
-- (statt Vergleichsoperatoren)

SELECT ContactName, ContactTitle FROM Customers
WHERE ContactTitle LIKE 'Manager'

-- Wildcards

-- %-Zeichen: Beliebige Symbol, beliebig viele davon
SELECT ContactName, ContactTitle FROM Customers
WHERE ContactTitle LIKE '%Manager%'

-- _-Zeichen: EIN beliebiges Symbol
SELECT CompanyName FROM Customers
WHERE CompanyName LIKE '_l%'

-- []-Zeichen: Alles was in den Klammern ist, ist ein g�ltiges erstes Symbol
SELECT PostalCode FROM Customers
WHERE PostalCode LIKE '[0123456]%'

-- geht einfacher => [1-6]
SELECT PostalCode FROM Customers
WHERE PostalCode LIKE '[1-6]%'

-- NICHT-Fall [^1-6]
SELECT PostalCode FROM Customers
WHERE PostalCode LIKE '[^1-6]%'

--> von 1-3 und von a-g g�ltige Symbole haben
SELECT PostalCode FROM Customers
WHERE PostalCode LIKE '[1-3 a-g]%'

-- Sonderf�lle:

-- % rausholen
SELECT * FROM Customers
WHERE CompanyName LIKE '%[%]%'

-- ' rausholen
SELECT * FROM Customers
WHERE CompanyName LIKE '%['']%'

-- 1. Alle ShipPostalCode's anzeigen lassen, die mit 0,2,4 beginnen
SELECT ShipPostalCode FROM Orders
WHERE ShipPostalCode LIKE '[024]%'

-- 2. Alle Contactnames die als Title "Owner" haben (Tabelle Customers)
SELECT ContactName, ContactTitle FROM Customers
WHERE ContactTitle LIKE '%Owner%'

