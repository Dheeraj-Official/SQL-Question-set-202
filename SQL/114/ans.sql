USE DoctorWho;
GO

CREATE OR ALTER PROCEDURE spListEpisodes
    @SeriesNumber INT = NULL
AS
BEGIN
    SELECT Title, SeriesNumber, EpisodeNumber, EpisodeDate
    FROM tblEpisode
    WHERE SeriesNumber = @SeriesNumber OR @SeriesNumber IS NULL
    ORDER BY SeriesNumber, EpisodeNumber;
END
GO

EXEC spListEpisodes 2;

EXEC spListEpisodes;