use WorldEvents;

DECLARE @Winners TABLE
(
    Source      VARCHAR(20),
    Winner      VARCHAR(100),
    NumEvents   INT
);

INSERT INTO @Winners (Source, Winner, NumEvents)
SELECT * FROM
(
    SELECT TOP 1 'Category' AS Source, CategoryName AS Winner, COUNT(*) AS NumEvents
    FROM tblEvent e
    JOIN tblCategory cat ON e.CategoryID = cat.CategoryID
    GROUP BY CategoryName
    ORDER BY COUNT(*) DESC
) AS CategoryWinner

UNION

SELECT * FROM
(
    SELECT TOP 1 'Country' AS Source, c.CountryName AS Winner, COUNT(*) AS NumEvents
    FROM tblEvent e
    JOIN tblCountry c ON e.CountryID = c.CountryID
    GROUP BY c.CountryName
    ORDER BY COUNT(*) DESC
) AS CountryWinner

UNION

SELECT * FROM
(
    SELECT TOP 1 'Continent' AS Source, ct.ContinentName AS Winner, COUNT(*) AS NumEvents
    FROM tblEvent e
    JOIN tblCountry c ON e.CountryID = c.CountryID
    JOIN tblContinent ct ON ct.ContinentID = c.ContinentID
    GROUP BY ct.ContinentName
    ORDER BY COUNT(*) DESC
) AS ContinentWinner;

SELECT * FROM @Winners;