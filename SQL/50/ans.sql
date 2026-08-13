use WorldEvents;

SELECT
    ev.EventName,
    ev.EventDate,
    co.CountryName,
    cont.ContinentName
FROM
    tblContinent cont
    INNER JOIN tblCountry co ON cont.ContinentID = co.ContinentID
    INNER JOIN tblEvent ev ON co.CountryID = ev.CountryID
WHERE
    cont.ContinentName = 'Antarctic'
    OR co.CountryName = 'Russia'
ORDER BY
    ev.EventDate;