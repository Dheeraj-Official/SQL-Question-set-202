USE worldEvents;
GO

WITH ManyCountries AS
(
    SELECT
        con.ContinentID,
        con.ContinentName,
        COUNT(DISTINCT co.CountryID) AS CountryCount
    FROM dbo.tblContinent con
    JOIN dbo.tblCountry co ON con.ContinentID = co.ContinentID
    GROUP BY con.ContinentID, con.ContinentName
    HAVING COUNT(DISTINCT co.CountryID) >= 3
),
-- This will be skipped
FewEvents AS
(
    SELECT
        con.ContinentID,
        con.ContinentName,
        COUNT(DISTINCT e.EventID) AS EventCount
    FROM dbo.tblContinent con
    JOIN dbo.tblCountry co ON con.ContinentID = co.ContinentID
    JOIN dbo.tblEvent e ON co.CountryID = e.CountryID
    GROUP BY con.ContinentID, con.ContinentName
    HAVING COUNT(DISTINCT e.EventID) <= 10
)
-- This will run
SELECT
    mc.ContinentName,
    mc.CountryCount,
    fe.EventCount
FROM ManyCountries mc
JOIN FewEvents fe ON mc.ContinentID = fe.ContinentID;