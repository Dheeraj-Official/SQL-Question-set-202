use WorldEvents;


DECLARE @StartYear INT = 1981 
DECLARE @EndYear INT = 2017 

WHILE @StartYear <= @EndYear 
BEGIN 
    DECLARE @CountEvents INT = (SELECT COUNT(*) FROM tblEvent WHERE YEAR(EventDate) = @StartYear) 
    PRINT CAST(@CountEvents as varchar(4)) + ' events occurred in ' + cast(@StartYear as varchar(4))

    SET @StartYear += 1 
END 
