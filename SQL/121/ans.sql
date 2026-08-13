USE WorldEvents;
GO

CREATE OR ALTER PROCEDURE uspNameLengthDifference
AS
BEGIN
    DECLARE @Difference INT;

    SELECT @Difference = MAX(LEN(EventName)) - MIN(LEN(EventName))
    FROM tblEvent;

    RETURN @Difference;
END
GO