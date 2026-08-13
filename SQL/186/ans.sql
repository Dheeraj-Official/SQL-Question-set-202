use WorldEvents;
go

SELECT
    Second_Half_Derived.EventName,
    c.CountryName
FROM
(
    SELECT
        EventID,
        EventName,
        CountryID
    FROM dbo.tblEvent
    WHERE RIGHT(EventName, 1) BETWEEN 'N' AND 'Z'
) AS Second_Half_Derived
JOIN dbo.tblCountry c ON Second_Half_Derived.CountryID = c.CountryID;