-- USE Datenbankname wechselt angesprochene DB
-- Alternative "oben links" per Drop-Down Menu
USE Northwind

-- einzeiliger Kommentar

/*
	Mehrzeilliger
	Kommentar
	block
*/

/*
	SELECT: w�hlt Spalten aus, die im
	Ergebnisfenster angezeigt werden sollen
*/

SELECT * FROM Customers -- * => w�hlt alle Spalten aus

-- "Custom" Werte und mathematischen Operationen m�glich

SELECT 100

SELECT 'Hallo!'

SELECT 'Hallo', 100, 5*8
-- Nur einzelne "Anweisungen" AUSF�HREN => Markieren und STRG + E

SELECT CompanyName, Country FROM Northwind.dbo.Customers

-- Eckige Klammern bei Tabellen mit Leerzeichen im Namen
SELECT * FROM [Order Details]

-- SQL ist NICHT case-sensitive, Formatierung spielt keine Rolle, keine Semikolons n�tig!
sElEcT			CouNtRy,
		ComPAnyNamE

FrOm		CuStOmErS

-- Sortieren mit ORDER BY
SELECT * FROM Customers
ORDER BY City ASC

-- Sortieren nach CompanyName
SELECT CustomerID, CompanyName, Country FROM Customers
ORDER BY 2 DESC, 3 ASC -- => Sortiert nach der 2ten Spalte

-- ORDER BY ist syntaktisch immer am ENDE
-- DESC = Descending = absteigend
-- ASC = Ascending = aufsteigend

-- Mehrere Spalten Sortieren
SELECT * FROM Customers
ORDER BY City DESC, CompanyName DESC

SELECT Country, City FROM Customers
ORDER BY Country DESC, City DESC

-----------------------------------------------------------------------

-- TOP X gibt nur die ersten X zeilen aus
SELECT TOP 10 * FROM Customers
SELECT TOP 100 * FROM Customers

-- Geht auch mit %-Angabe
-- TOP X PERCENT
SELECT TOP 10 PERCENT * FROM Customers

-- Die 20 gr��ten & kleinsten Frachtkosten rausholen aus Orders
SELECT TOP 20 * FROM Orders
ORDER BY Freight ASC

SELECT TOP 20 * FROM Orders
ORDER BY Freight DESC

/*
	WICHTIG!: BOTTOM X existiert nicht, Ergebnisse einfach umdrehen mit ORDER BY
*/


-- Duplikate "filtern" mit SELECT DISTINCT
-- Filtert alle Ergebnisse/Datens�tze deren Werte exakt gleich sind

SELECT DISTINCT Country FROM Customers

SELECT DISTINCT City, Country FROM Customers

----------------------------------------------------------

-- UNION f�hrt mehrere Ergebnistabllen vertikal in eine Tabelle zusammen
-- UNION macht automatisch ein DISTINCT MIT
-- Die Spaltenanzahl und der Datentyp m�ssen kompatibel sein

SELECT * FROM Customers -- 91 Zeilen
UNION
SELECT * FROM Customers -- 91 Zeilen

-- => Mit UNION ALL wird kein DISTINCT ausgef�hrt
SELECT * FROM Customers -- 91 Zeilen
UNION ALL
SELECT * FROM Customers -- 91 Zeilen

SELECT 100, 'Hallo'
UNION
SELECT 'HALLO', 50

SELECT 100 as Test, 'Hallo' as Test12345
UNION
SELECT 50.25 , 'Hallo'

-- Alias: => Spalten umbennenung
SELECT 100 AS Zahl, 'Hallo' as 'Begr��ung das ist eine Spalte', 100 as '100 ist eine Zahl'

SELECT City AS Stadt FROM Customers

-- Aliase auf Tabellennamen
SELECT * FROM Customers as cus