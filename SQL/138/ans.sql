USE WorldEvents;
GO

CREATE OR ALTER FUNCTION dbo.fn_GetMonthName (@MonthNumber INT)
RETURNS VARCHAR(20)
AS
BEGIN
    DECLARE @MonthName VARCHAR(20);

    SET @MonthName = 
        CASE @MonthNumber
            WHEN 1  THEN 'January'
            WHEN 2  THEN 'February'
            WHEN 3  THEN 'March'
            WHEN 4  THEN 'April'
            WHEN 5  THEN 'May'
            WHEN 6  THEN 'June'
            WHEN 7  THEN 'July'
            WHEN 8  THEN 'August'
            WHEN 9  THEN 'September'
            WHEN 10 THEN 'October'
            WHEN 11 THEN 'November'
            WHEN 12 THEN 'December'
            ELSE NULL
        END;

    RETURN @MonthName;
END;
GO