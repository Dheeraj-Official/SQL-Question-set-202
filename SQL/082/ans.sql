USE WorldEvents;

SELECT EventName, EventDate, CountryID
FROM tblEvent
WHERE EventDate > (
    SELECT MAX(EventDate)
    FROM tblEvent
    WHERE CountryID = 21
)
ORDER BY EventDate DESC;