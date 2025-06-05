USE Northwind
-- String Funktionen bzw. Text-Datentypen manipulieren

-- LEN gibt die laenge eines Strings zurück (Anzahl/Characters) als INT
SELECT CompanyName, LEN(CompanyName) FROM Customers

-- LEFT/RIGHT geben die "linken" bzw. "rechten" x Zeichen eines Strings zurück
SELECT CompanyName, LEFT(CompanyName, 5) FROM Customers
SELECT CompanyName, RIGHT(CompanyName, 5) FROM Customers

-- SUBSTRING(Spalte, x ,y) springt zu Position x in einem String und gibt y zeichen aus
SELECT SUBSTRING(CompanyName, 5, 5), CompanyName FROM Customers

-- STUFF(Spalte, x, y, replace) ersetzt y Zeichen eines Strings ab Position x
-- mit dem "replace Wert" (optional)
SELECT STUFF(Phone, LEN(Phone) - 4, 5, 'XXXXX') FROM Customers

-- PATINDEX sucht nach "Schema" (wie LIKE) in einem String und gibt die Position aus
-- an der das Schema gefunden wurde
SELECT PATINDEX('%kiste%', CompanyName), CompanyName FROM Customers

-- CONCAT fügt mehrere Strings in die selbe Spalte zusammen
SELECT CONCAT(FirstName, ' ', LastName, EmployeeID) as GanzerName FROM Employees
SELECT FirstName + ' ' + LastName as GanzerName FROM Employees

/***************************************************************************/
-- Umwandlungstypen
-- CAST oder Convert, wandeln Datentypen in der Ausgabe um
-- konvertierung von datetime => date
SELECT CAST(OrderDate as date) FROM Orders
SELECT CAST(FirstName + LastName as varchar(2)) FROM Employees

SELECT CONVERT(date, OrderDate) FROM Orders
SELECT CONVERT(varchar(2), FirstName + LastName) FROM Employees

-- ISNULL prüft auf NULL Werte und ersetzt diese wenn Gewünscht
SELECT ISNULL(Fax, 'Nicht vorhanden!') as KeineFax, Fax FROM Customers

-- Format
DECLARE @d AS DATE = '13.02.2005'

SELECT FORMAT(@d, 'd', 'en-US') AS 'US English',
	   FORMAT(@d, 'd', 'en-gb') AS 'British English',
	   FORMAT(@d, 'd', 'de-de') AS 'German',
	   FORMAT(@d, 'd', 'zh-cn') AS 'Chinese Simplified'


SELECT FORMAT(@d, 'D', 'en-US') AS 'US English',
	   FORMAT(@d, 'D', 'en-gb') AS 'British English',
	   FORMAT(@d, 'D', 'de-de') AS 'German',
	   FORMAT(@d, 'D', 'zh-cn') AS 'Chinese Simplified'

SELECT TOP 5 FREIGHT,
		FORMAT(Freight, 'N', 'de-de'),
		FORMAT(Freight, 'G', 'de-de'),
		FORMAT(Freight, 'C', 'zh-cn')
FROM Orders

-- REPLACE(x, y, z) => "y" sucht in "x" den String um Ihn mit "z" zu ersetzen
SELECT REPLACE('Hallo Welt', 'Welt', 'und Willkommen!')

-- REPLICATE(x, y) => Setze "y" mal die "x" vor der Spalte
SELECT REPLICATE('0', 3) + Phone FROM Customers

-- Reverse(Spaltenname) => z.B "Hallo" wird zu "ollaH"
SELECT CompanyName, REVERSE(CompanyName) From Customers

-- UPPER(Spaltenname) => alles in Großbuchstaben
SELECT CompanyName, UPPER(CompanyName) FROM Customers

-- LOWER(Spaltenname) => alles in Kleinbuchstaben
SELECT CompanyName, LOWER(CompanyName) FROM Customers

-- TRANSLATE(inputString, chars, replace)
-- => Gebe deinen InputString an, wähle die "chars" aus die im "inputString" ersetzt werden
-- sollen mit "replace
SELECT TRANSLATE('2*[3+4]/{7-2}', '[]{}', '')

/*********************************************************************************/
-- Datumsfunktionen
SELECT GETDATE() -- aktuelle Systemzeit mit Zeitstempel
SELECT CURRENT_TIMESTAMP -- => das selbe

SELECT
YEAR(OrderDate) as Jahr,
MONTH(OrderDate) as Monat, 
DAY(OrderDate) as Tag, OrderDate
FROM Orders

-- Andere Option für Zeitintervalle
SELECT
DATEPART(YEAR, OrderDate) as Jahr,
DATEPART(QUARTER, OrderDate) as Quartal,
DATEPART(WEEK, OrderDate) as KW,
DATEPART(WEEKDAY, OrderDate) as Wochentag,
DATEPART(HOUR, OrderDAte) as Stunde
FROM Orders

-- Intervall Namen rausziehen aus einem Datum
SELECT 
DATEPART(MONTH, OrderDate), DATENAME(MONTH, OrderDate),
DATEPART(WEEKDAY, OrderDate), DATENAME(WEEKDAY, OrderDate)
FROM Orders

-- Intervall zu einem Datum addieren/subtrahieren
SELECT DATEADD(DAY, 14, GETDATE())
SELECT DATEADD(DAY, -14, GETDATE())

-- Differenz zwischen den Intervallen
SELECT DATEDIFF(YEAR, '13.02.2005', GETDATE())
SELECT DATEDIFF(YEAR, OrderDate, GETDATE()) FROM Orders

