USE WorldEvents;

DECLARE @Year INT = 1992;

DECLARE @EventsInYear VARCHAR(MAX) = '';

SELECT @EventsInYear = @EventsInYear + EventName + ', '
FROM (
    SELECT TOP 3 EventName
    FROM tblEvent
    WHERE YEAR(EventDate) = @Year
    ORDER BY EventName
) AS TopEvents;

SELECT 
    @Year as 'Year',
    @EventsInYear as 'Events in Year';