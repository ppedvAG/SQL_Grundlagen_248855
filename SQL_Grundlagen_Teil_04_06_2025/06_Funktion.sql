USE Northwind
GO

-- Funktion um OrderID zu selektieren
CREATE FUNCTION GetOrderID
(
	@OrderID INT
)
RETURNS INT
AS
BEGIN
	DECLARE @Spalte INT

	SELECT @Spalte = COUNT(*) FROM Orders
	WHERE OrderID = @OrderID

	RETURN @Spalte
END
GO

-- dbo. muss zwingend angegeben werden, weil Schema
SELECT dbo.GetOrderID(10250) 