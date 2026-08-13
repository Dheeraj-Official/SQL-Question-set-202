USE DoctorWho
GO

CREATE OR ALTER VIEW vwSeriesOne 
AS
SELECT
    Title,
    SeriesNumber,
    EpisodeNumber
FROM 
    tblEpisode
WHERE
    SeriesNumber = 1
GO               

SELECT * FROM vwSeriesOne;