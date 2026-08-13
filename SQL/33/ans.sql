USE WorldEvents;
GO

SELECT
    CASE
        WHEN ContinentID IN (1, 3) THEN '1 or 3'
        WHEN ContinentID IN (5, 6) THEN '5 or 6'
        WHEN ContinentID IN (2, 4) THEN '2 or 4'
        WHEN ContinentID = 7 THEN '7'
        ELSE 'Other'
    END AS [Continent ID],
    CASE
        WHEN ContinentID IN (1, 3) THEN 'Eurasia'
        WHEN ContinentID IN (5, 6) THEN 'Americas'
        WHEN ContinentID IN (2, 4) THEN 'Somewhere hot'
        WHEN ContinentID = 7       THEN 'Somewhere cold'
        ELSE 'Somewhere else'
    END AS [Belongs To],
    CASE
        WHEN ContinentID IN (1, 3) THEN 'Europe or Asia'
        WHEN ContinentID IN (5, 6) THEN 'North or South America'
        WHEN ContinentID IN (2, 4) THEN 'Africa or Australasia'
        WHEN ContinentID = 7       THEN 'Antarctica'
        ELSE 'International'
    END AS [Actual Continent (For Interest)]
FROM dbo.tblCountry
GO