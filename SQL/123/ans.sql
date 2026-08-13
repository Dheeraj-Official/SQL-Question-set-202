USE Music_01;
GO

CREATE OR ALTER PROCEDURE uspAnalysisParalysis
    @Artist VARCHAR(100) = NULL,
    @City VARCHAR(100) = NULL,
    @CancelledOrNot BIT = NULL,
    @StartDate DATE = NULL,
    @EndDate DATE = NULL
AS
BEGIN
    SELECT sh.Show_date, v.Venue, c.City, ar.Artist, t.Tour_name, sh.Cancelled
    FROM Show AS sh
    JOIN Venue AS v ON sh.Venue_ID = v.Venue_ID
    JOIN City AS c ON v.City_ID = c.City_ID
    JOIN Tour AS t ON sh.Tour_ID = t.Tour_ID
    JOIN Artist AS ar ON t.Artist_ID = ar.Artist_ID
    WHERE (@Artist IS NULL OR ar.Artist = @Artist)
    AND (@City IS NULL OR c.City = @City)
    AND (@CancelledOrNot IS NULL OR sh.Cancelled = @CancelledOrNot)
    AND (@StartDate IS NULL OR sh.Show_date >= @StartDate)
    AND (@EndDate IS NULL OR sh.Show_date <= @EndDate);
END
GO



EXEC uspAnalysisParalysis @Artist = 'Madonna', @City = 'Manchester';
EXEC uspAnalysisParalysis @StartDate = '2020-01-01', @EndDate = '2020-12-31';
EXEC uspAnalysisParalysis; -- returns everything