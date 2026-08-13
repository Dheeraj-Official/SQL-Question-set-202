CREATE OR ALTER PROCEDURE spCalculateAge
AS
BEGIN
    DECLARE @Age INT

    SET @Age = DateDiff(year, '03/04/1990', GetDate())

    PRINT 'Your age is ' + CAST(@Age AS VARCHAR(3))
END
GO

EXECUTE spCalculateAge