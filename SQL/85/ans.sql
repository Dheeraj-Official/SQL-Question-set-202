use WorldEvents;

SELECT CountryName
FROM tblCountry AS c
WHERE (
    SELECT COUNT(*)
    FROM tblEvent AS e
    WHERE e.CountryID = c.CountryID
) > 8
ORDER BY CountryName ASC;