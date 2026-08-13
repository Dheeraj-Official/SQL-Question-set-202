USE WorldEvents;
GO

CREATE OR ALTER FUNCTION dbo.fn_Winners(@title VARCHAR(MAX)) 
RETURNS VARCHAR(MAX)
AS
BEGIN
    DECLARE @rank VARCHAR(MAX)
    SET @rank = 
        CASE 
            WHEN @title IN (SELECT TOP 1 EventName FROM dbo.tblEvent ORDER BY EventDate) 
                THEN 'Oldest'
            WHEN @title IN (SELECT TOP 1 EventName FROM dbo.tblEvent ORDER BY EventDate DESC) 
                THEN 'Newest'
            WHEN @title IN (SELECT TOP 1 EventName FROM dbo.tblEvent ORDER BY EventName) 
                THEN 'Alphabetically First'
            WHEN @title IN (SELECT TOP 1 EventName FROM dbo.tblEvent ORDER BY EventName DESC) 
                THEN 'Alphabetically Last'
            ELSE 
                'Not a Winner'
        END
    RETURN @rank
END
GO