USE Northwind

/*

	-- CREATE / ALTER / DROP / INSERT / UPDATE / DELETE
	=> Data Definition Language
	Immer wenn wir Datenbankobjekte bearbeiten/erstellen/verwerfen gelten diese Befehle

*/

-- CREATE
CREATE TABLE PurchasingOrders
(
	ID INT IDENTITY(1, 1) PRIMARY KEY NOT NULL,
	OrderDate date NOT NULL,
	ProductID INT NOT NULL
)

SELECT * FROM PurchasingOrders

-- Beziehung zwischen PurchasingOrder und Products anlegen über ProductID
ALTER TABLE PurchasingOrders
ADD FOREIGN KEY (ProductID) REFERENCES Products (ProductID)

-- Neue Spalte hinzufuegen zu bestehndem Table
ALTER TABLE PurchasingOrders
ADD TestDaten INT

SELECT * FROM PurchasingOrders

-- Spalte nach dem Datentyp ändern
ALTER TABLE PurchasingOrders
ALTER COLUMN TestDaten FLOAT  NULL

-- Spalte verwerfen
ALTER TABLE PurchasingOrders
DROP COLUMN TestDaten

-- INSERT - Hinzufügen von Datensätzen in bestehnder Table

-- Alle Spalten befuellen
INSERT INTO PurchasingOrders
VALUES(GETDATE(), 2, 23.25)

SELECT * FROM PurchasingOrders


-- Explizit einzelne Spalten befuellen
INSERT INTO PurchasingOrders
(OrderDate, ProductID) 
VALUES (GETDATE(), 2)

-- Ergebnis einer SELECT-Abfrage direkt inserten
-- Spaltenanzahl & Datentypen müssen kompatibel sein
INSERT INTO PurchasingOrders
SELECT GETDATE(), 3, 50.5

-- DELETE & TRUNCATE
-- TRUNCATE leert die komplette Tabelle, genau wie DELETE
-- ABER: Delete kann auch explizit Datensätze leeren

-- Aufpassen! Ohne Where Filter werden alle Datensätze gelöscht!
DELETE FROM PurchasingOrders
WHERE ID = 3

-- Primaer-/Fremdschluesselbeziehungen verhindern das loeschen von Datensaetzen
-- sonst Laufen Datensaetze "ins leere"
DELETE FROM Customers
WHERE CustomerID = 'ALFKI'

TRUNCATE TABLE PurchasingOrders

-- UPDATE => Ändern von Spaltenwerten in einem vorhandenen Datensatz

SELECT * FROM PurchasingOrders

-- TestDaten wird rot angezeigt => Lokalen Cache aktualisieren
-- => Bearbeiten => IntelliSense => Lokalen Cache aktualisieren
UPDATE PurchasingOrders
SET TestDaten = 99.99
WHERE ID = 3

-- "Loeschen" von Werten:
UPDATE PurchasingOrders
SET TestDaten = NULL
WHERE ID = 3

-- Transactions
BEGIN TRANSACTION
 
DELETE FROM PurchasingOrders
WHERE TestDaten = 5

COMMIT  -- => Übernimmt die Abfrage
ROLLBACK -- => Die fehlerhafte Abfrage zurück zu stellen

SELECT * FROM PurchasingOrders

-- 1. Trage dich selber in die Tabelle ein (Employees). Bei den folgenden Spalten: 
-- LastName, FirstName, Title, TitleOfCourtesy, BirthDate, 
-- HireDate, City, Region, PostalCode, Country, HomePhone, ReportsTo

-- 2.: Aendere die Werte danach um, in eine Person die frei erfunden 
