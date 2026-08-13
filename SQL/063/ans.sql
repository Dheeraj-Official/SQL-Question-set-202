use WorldEvents;

SELECT
    COUNT(*) AS [Number of Events],
    MIN(EventDate) AS [First Date],
    MAX(EventDate) AS [Last Date]
FROM tblEvent;