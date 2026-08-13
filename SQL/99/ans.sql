DECLARE @Variable1 int = 1 
DECLARE @Variable2 int 
DECLARE @Variable3 int 

SET @Variable2 = 2

SELECT @Variable3 = 3

SELECT @Variable1, @Variable2, @Variable3

DECLARE @Name	varchar(20)
DECLARE @birthDate	date
DECLARE @petCount	int

SET @Name = 'Dheeraj'
SET @birthDate = '2004-03-26'
SET @petCount = 5

SELECT @Name, @birthDate, @petCount
