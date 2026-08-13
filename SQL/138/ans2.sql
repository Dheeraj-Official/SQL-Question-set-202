USE WorldEvents;
GO

-- check function works
SELECT dbo.fn_GetMonthName(7) AS MonthName;


-- answer
SELECT
    DISTINCT MONTH(et.EventDate) AS MonthNumber,
    dbo.fn_GetMonthName(MONTH(et.EventDate)) AS MonthName
FROM
    dbo.tblEvent et
ORDER BY MonthNumber;