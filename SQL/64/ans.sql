USE WorldEvents;

SELECT
    c.CategoryName,
    COUNT(e.EventID) AS NumberOfEvents -- COUNT(*)
FROM
    tblCategory AS c
    INNER JOIN tblEvent AS e ON c.CategoryID = e.CategoryID
GROUP BY
    c.CategoryName
ORDER BY
    NumberOfEvents DESC;