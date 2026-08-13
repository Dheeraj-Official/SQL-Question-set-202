USE WorldEvents;
GO

CREATE OR ALTER PROCEDURE uspFirstEventContinent
    @OutputParameter VARCHAR(100) OUTPUT
AS
BEGIN
    SELECT TOP 1 @OutputParameter = cont.ContinentName
    FROM tblContinent AS cont
    INNER JOIN tblCountry AS co ON cont.ContinentID = co.ContinentID
    INNER JOIN tblEvent AS ev ON co.CountryID = ev.CountryID
    ORDER BY ev.EventDate;
END
GO


CREATE OR ALTER PROCEDURE uspEventsInContinent
    @Parameter VARCHAR(100)
AS
BEGIN
    SELECT ev.EventName, ev.EventDate, co.CountryName, cont.ContinentName
    FROM tblContinent AS cont
    JOIN tblCountry AS co ON cont.ContinentID = co.ContinentID
    JOIN tblEvent AS ev ON co.CountryID = ev.CountryID
    WHERE cont.ContinentName = @Parameter
    ORDER BY ev.EventDate;
END
GO

-- Chaining Proc 1 and 2
DECLARE @Variable VARCHAR(100) = '';

EXEC uspFirstEventContinent
    @OutputParameter = @Variable OUTPUT;

EXEC uspEventsInContinent
    @Parameter = @Variable;