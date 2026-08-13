USE WorldEvents;
GO

CREATE OR ALTER PROCEDURE uspMostEventfulCountry
    @TopCountry VARCHAR(100) = '' OUTPUT,
    @EventCount INT = 0 OUTPUT
AS
BEGIN
    SELECT TOP 1
        @TopCountry = co.CountryName,
        @EventCount = COUNT(ev.CountryID)
    FROM tblCountry AS co
    INNER JOIN tblEvent AS ev ON co.CountryID = ev.CountryID
    GROUP BY co.CountryName
    ORDER BY COUNT(ev.CountryID) DESC;
END
GO


DECLARE @Country VARCHAR(100);
DECLARE @Count INT;

EXEC uspMostEventfulCountry
    @TopCountry = @Country OUTPUT,
    @EventCount = @Count OUTPUT;

SELECT @Country AS TopCountry, @Count AS EventCount;