/*
	Datentypen in SQL: 3 große Gruppen

	1. Charakter/String Datentypen

	char(10) = 'Hallo     ' = 10 Byte Speicherplatz => UTF-8
	nchar(10) = 1 Charakter = 2 Byte => 20 Byte Speicherplatz => UTF-16

	varchar(10) = 'Hallo' = 5 Byte Speicherplatz => UTF-8
	nvarchar(10) = 1 Charakter = 2 Byte => 10 Byte => UTF-16

	Legacy: text --> mittlerweile VARCHAR(MAX) = bis zu 2GB groß
	VARCHAR(8000) & NVARCHAR(4000) sind maximum


	2. Numerische Datentypen
	tinyint = 8 Bit = 1 Byte = Range [bis 255]
	smallint = 16 Bit = 2 Byte = Range [-32k] bis [+32k]
	int = 32 Bit = 4 Byte = Range [-2,14Mrd] bis [+2,14Mrd]
	bigint = 64 Bit = 8 Byte = Range [-9,2 Trillion] bis [+9,2 Trillion]

	bit = 1 oder 0 (True = 1, False = 0) => Es gibt kein Bool!

	decimal(x, y) = x Ziffern insgesamt, davon sind y Nachkommastellen
	decimal(10, 2) = 8 Stellen vor dem Komma, 2 Nach dem Komma
	money = 9,2 Trillion
	smallmoney = ca. 214k

	float(n) = bis 53
	1-24 = 7 Stellen Praezision = 4 Byte
	25-53 = 15 Stellen Praezision = 8 Byte

	real = 4 Byte

	binary = wandelt Numerische Zahlen in Binär um (eigentlich Hexadezimal)
	laenge kann gesetzt werden zwischen 1 bis 8.000 Bytes
	SELECT CAST(123456 AS Binary(2))


	3. Datum/Zeit Datentypen
	time = hh:mm:ss.nnnnnnn
	date = YYYY-MM-DD
	datetime = date + time in MS = YYYY-MM-DD hh:mm:ss.mmm
	datetime2 = YYYY-MM-DD hh:mm:ss.nnnnnnn
	smalldatetime = präzise bis Sekunden = YYYY-MM-DD hh:mm:ss

	Andere:
	XML
	JSON
	geometry
	geography
*/



