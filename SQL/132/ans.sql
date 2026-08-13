use worldevents;


DECLARE @Month INT = 1 
DECLARE @December INT = 12 

WHILE @Month <= @December 
BEGIN
    DECLARE @EventList VARCHAR(MAX) = '' 

    SELECT 
        @EventList += EventName + ', ' 
    FROM tblEvent 
    WHERE MONTH(EventDate) = @Month
    
    PRINT 'Events which occurred in ' + DATENAME(MM, '2017-' + CAST(@Month AS VARCHAR(2)) + '-01') + ': ' + @EventList 

    SET @Month += 1	
END