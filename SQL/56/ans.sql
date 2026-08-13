use WorldEvents
SELECT
    co.CountryName
FROM
    tblCountry AS co
    LEFT OUTER JOIN tblEvent AS ev ON co.CountryID = ev.CountryID
WHERE
    ev.EventID IS NULL;