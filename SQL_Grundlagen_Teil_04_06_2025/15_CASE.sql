USE Northwind

-- CASE - unterscheiden wir definierten Fällen, die die Ausgabe abändern

-- Wenn ein Fall gefunden wird, wird XYZ ausgeführt
SELECT UnitsInStock,
CASE
	WHEN UnitsInStock < 10 THEN 'Nachbestellen'
	WHEN UnitsInStock > 10 THEN 'Passt'
END as Pruefung
FROM Products

-- Alternative: mit ELSE => "Notausgang" falls eine Pruefung nicht durchging
SELECT UnitsInStock,
CASE
	WHEN UnitsInStock < 10 THEN 'Nachbestellen'
	WHEN UnitsInStock > 10 THEN 'Passt'
	ELSE 'Fehler! Dafür gibt es keine Fallabdeckung'
END as Pruefung
FROM Products

-- Geht auch mit UPDATE
BEGIN TRAN
UPDATE Customers
SET City = 
CASE
	WHEN Country = 'Germany' THEN 'Berlin'
	WHEN Country = 'France' THEN 'Paris'
	ELSE City
END

COMMIT 
ROLLBACK

SELECT * FROM Customers	
WHERE City IN ('Berlin', 'Paris')

-- Auch im Group by möglich
SELECT SUM(UnitsInStock),
CASE
	WHEN UnitsInStock < 10 THEN 'Nachbestellen'
	WHEN UnitsInStock > 10 THEN 'Passt'
	ELSE 'Fehler! Dafür gibt es keine Fallabdeckung'
END as Pruefung
FROM Products
GROUP BY 
CASE
	WHEN UnitsInStock < 10 THEN 'Nachbestellen'
	WHEN UnitsInStock > 10 THEN 'Passt'
	ELSE 'Fehler! Dafür gibt es keine Fallabdeckung'
END
ORDER BY 2 DESC

-- Aufgabe:
-- Wenn ShippedDate kleiner als RequiredDate => "Pünktlich versendet!"
-- Wenn ShippedDate gleich 0 ist => 'Noch nicht versendet'
-- Ansonsten: "Verspätet versendet"
SELECT OrderID, CustomerID, OrderDate, RequiredDAte, ShippedDate,
CASE
	WHEN ShippedDate IS NULL THEN 'Noch nicht versendet'
	WHEN ShippedDate < RequiredDate THEN 'Versendet pünktlich'
	ELSE 'Verspätet versendet'
END AS OrderStatus
FROM Orders