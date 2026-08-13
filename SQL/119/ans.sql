USE Music_01;
GO

CREATE OR ALTER PROCEDURE uspListShows
    @CancelledOrNot BIT = NULL,
    @StartDate DATE = NULL,
    @EndDate DATE = NULL
AS
BEGIN
    SELECT Show_date, Venue_ID, Tickets_sold, Tickets_available, Cancelled
    FROM Show
    WHERE (Cancelled = @CancelledOrNot OR @CancelledOrNot IS NULL)
    AND (Show_date >= @StartDate OR @StartDate IS NULL)
    AND (Show_date <= @EndDate OR @EndDate IS NULL);
END
GO

EXEC uspListShows 0;

EXEC uspListShows 1, '2020-01-01', '2020-12-31';

exec uspListShows;