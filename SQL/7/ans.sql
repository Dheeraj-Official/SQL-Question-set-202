USE WorldEvents;

SET NOCOUNT ON;

SELECT 
    TOP 2
    EventName,
    EventDate
FROM 
    dbo.tblEvent
ORDER BY
    EventDate DESC;

SELECT 
    TOP 2
    EventName,
    EventDate
FROM 
    dbo.tblEvent
ORDER BY
    EventDate;

