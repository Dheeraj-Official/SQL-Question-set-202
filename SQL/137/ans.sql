CREATE OR ALTER FUNCTION dbo.fnReign (@StartDate DATE, @EndDate DATE) 
RETURNS INT
AS
BEGIN
	DECLARE @days INT
	SET @days = DATEDIFF(DAY, @StartDate, @EndDate)
	RETURN @days
END
GO