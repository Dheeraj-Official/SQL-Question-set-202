USE WorldEvents;

SELECT
    TOP 3 ContinentName
FROM
    tblEvent AS a
    INNER JOIN tblCountry AS b ON a.CountryID = b.CountryID
    INNER JOIN tblContinent AS c ON b.ContinentID = c.ContinentID
GROUP BY
    ContinentName
ORDER BY
    COUNT(EventName)