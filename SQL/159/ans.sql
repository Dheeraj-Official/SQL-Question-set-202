USE WorldEvents;

IF OBJECT_ID('tempdb..#CountEvents') IS NOT NULL
    DROP TABLE #CountEvents;

CREATE TABLE #CountEvents
(
    [Year of Events]     INT,
    [Country of Events]  VARCHAR(100),
    [Number of Events]   INT
);

DECLARE @StartYear INT, @EndYear INT, @CurrentYear INT;

SELECT @StartYear = MIN(YEAR(EventDate)),
        @EndYear   = MAX(YEAR(EventDate))
FROM tblEvent;

SET @CurrentYear = @StartYear;

WHILE @CurrentYear <= @EndYear
BEGIN
    INSERT INTO #CountEvents ([Year of Events], [Country of Events], [Number of Events])
    SELECT TOP 1
        @CurrentYear,
        c.CountryName,
        COUNT(*)
    FROM tblEvent e
    JOIN tblCountry c ON e.CountryID = c.CountryID
    WHERE YEAR(EventDate) = @CurrentYear
    GROUP BY c.CountryName
    ORDER BY COUNT(*) DESC;

    SET @CurrentYear = @CurrentYear + 1;
END

SELECT * FROM #CountEvents ORDER BY [Year of Events];

DROP TABLE #CountEvents;