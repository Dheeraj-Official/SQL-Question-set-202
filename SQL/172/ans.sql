USE worldEvents;
GO

CREATE OR ALTER FUNCTION dbo.fnContinentSummary (@Continent VARCHAR(50), @Month VARCHAR(20)) RETURNS TABLE
AS
RETURN
    SELECT
        con.ContinentName,
        @Month AS EventMonth,
        COUNT(DISTINCT co.CountryID) AS NumberOfCountries,
        COUNT(DISTINCT cat.CategoryID) AS NumberOfCategories,
        COUNT(DISTINCT e.EventID) AS NumberOfEvents
    FROM 
        dbo.tblContinent con
    JOIN 
        dbo.tblCountry co ON con.ContinentID = co.ContinentID
    JOIN 
        dbo.tblEvent e ON co.CountryID = e.CountryID
    JOIN 
        dbo.tblCategory cat ON e.CategoryID = cat.CategoryID
    WHERE 
        con.ContinentName = @Continent AND DATENAME(MONTH, e.EventDate) = @Month
    GROUP BY 
        con.ContinentName;
GO

SELECT * FROM dbo.fnContinentSummary('Europe', 'October');