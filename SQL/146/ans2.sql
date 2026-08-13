USE WorldEvents;
GO

BEGIN TRANSACTION

UPDATE 
    tblCountry
SET
    CountryName = CountryName + '(Holiday Destination)'
WHERE
    CountryName NOT LIKE '%Holiday%'

IF 1 + 1 = 3
    ROLLBACK TRANSACTION
ELSE
    COMMIT TRANSACTION

SELECT * FROM tblCountry;

