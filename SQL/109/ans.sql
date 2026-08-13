USE Music_01;
GO

CREATE OR ALTER PROCEDURE ListAlbums
    @HighChartPosition TINYINT,
    @LowChartPosition TINYINT
AS
BEGIN
    SELECT Title, Artist_ID, US_Billboard_200_peak, Release_date
    FROM Album
    WHERE US_Billboard_200_peak BETWEEN @HighChartPosition AND @LowChartPosition;
END
GO

EXEC ListAlbums 5, 10
-- EXEC ListAlbums @HighChartPosition = 5, @LowChartPosition = 10