-- Different approach

USE WorldEvents;

DECLARE @TopContinents TABLE (ContinentName NVARCHAR(50));

INSERT INTO
    @TopContinents
SELECT
    TOP 3 ContinentName
FROM
    tblEvent AS a
    INNER JOIN tblCountry AS b ON a.CountryID = b.CountryID
    INNER JOIN tblContinent AS c ON b.ContinentID = c.ContinentID
GROUP BY
    ContinentName
ORDER BY
    COUNT(EventName);


SELECT
    ContinentName,
    EventName
FROM
    tblEvent AS a
    INNER JOIN tblCountry AS b ON a.CountryID = b.CountryID
    INNER JOIN tblContinent AS c ON b.ContinentID = c.ContinentID
WHERE
    ContinentName IN (
        SELECT
            ContinentName
        FROM
            @TopContinents
    );