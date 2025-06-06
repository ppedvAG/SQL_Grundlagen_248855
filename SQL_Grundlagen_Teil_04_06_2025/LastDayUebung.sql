-- 1. Wieviel Umsatz haben wir in jedem Geschäftsjahr insgesamt gemacht?
-- Benoetigt: SUM(SummeBestPosi)
SELECT DATEPART(YEAR, OrderDate) as Geschäftsjahr,
SUM(SummeBestPosi) as GesamtUmsatz FROM vRechnungsDaten
GROUP BY DATEPART(Year, OrderDate)
ORDER BY 1

-- 2. Wieviel Umsatz haben wir in Q1 1998 mit Kunden aus den USA gemacht?
SELECT SUM(SummeBestPosi) AS GesamtUmsatz FROM vRechnungsDaten
WHERE Country = 'USA' AND DATEPART(YEAR, OrderDate) = 1998 AND
DATEPART(Q, OrderDate) = 1

-- 3.„Zensiere“ alle Telefonnummern der Kunden (Phone): 
-- Es sollen immer nur noch die letzten 4 Ziffern/Symbole angezeigt werden. 
-- Alles davor soll mit einem X pro Symbol ersetzt werden.
-- Beispiel: Phone „08677 9889 0“; danach „XXXXXXXX89 0“
SELECT STUFF(Phone, 1, LEN(Phone) - 4, REPLICATE('X', LEN(Phone)- 4)) FROM Customers
SELECT REPLICATE('X', LEN(Phone) - 4) + RIGHT(Phone, 4) as NeueNummer FROM Customers