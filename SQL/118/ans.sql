USE WorldEvents;
GO

CREATE OR ALTER PROCEDURE uspNoisyContinents
    @OutputParameter VARCHAR(MAX) OUTPUT
AS
BEGIN
    SET @OutputParameter = '';

    SELECT @OutputParameter = @OutputParameter + ContinentName + ', '
    FROM (
        SELECT cont.ContinentName, COUNT(ev.EventID) AS NumberOfEvents
        FROM tblContinent AS cont
        INNER JOIN tblCountry AS co ON cont.ContinentID = co.ContinentID
        INNER JOIN tblEvent AS ev ON co.CountryID = ev.CountryID
        GROUP BY cont.ContinentName
        HAVING COUNT(ev.EventID) >= 50
    ) AS BusyContinents;
END
GO


DECLARE @ContinentList VARCHAR(MAX);

-- EXEC uspNoisyContinents @ContinentList OUTPUT;
EXEC uspNoisyContinents @OutputParameter = @ContinentList OUTPUT;

SELECT LEFT(@ContinentList, LEN(@ContinentList) - 2) AS TrimmedList;