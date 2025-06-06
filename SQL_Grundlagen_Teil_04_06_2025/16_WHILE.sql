USE Northwind

-- Variablen Allgemein

DECLARE @OrderID INT = 10250

SELECT * FROM Orders
WHERE OrderID = @OrderID

SET @OrderID = 10251

SELECT * FROM Orders
WHERE OrderID = @OrderID

-- WHILE - leitet eine Schleifanweisung ein
DECLARE @Counter INT = 0

WHILE @Counter <= 5
BEGIN
SELECT 'Hallo'
SET @Counter += 1
END


WHILE 1=1
BEGIN
SELECT 'Hallo'
END


-- IF Anweisung
DECLARE @CounterTwo INT = 0

WHILE @CounterTwo <= 5
BEGIN

	IF @CounterTwo = 2
	BEGIN
		SELECT 'Bin bei 2'
	END

	ELSE 
	BEGIN
		SELECT @CounterTwo
	END
SET @CounterTwo += 1
END
SELECT 'Ende'