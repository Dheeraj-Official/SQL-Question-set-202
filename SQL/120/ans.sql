USE Music_01;
GO

CREATE OR ALTER PROCEDURE usp_Get_Biggest_Venue_ID
    @StartDate DATE = NULL,
    @EndDate DATE = NULL
AS
BEGIN
    RETURN (
        SELECT TOP 1 Venue_ID
        FROM Venue
        WHERE (Opening_date >= @StartDate OR @StartDate IS NULL)
        AND (Opening_date <= @EndDate OR @EndDate IS NULL)
        ORDER BY Capacity DESC
    );
END
GO