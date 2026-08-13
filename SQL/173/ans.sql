USE DoctorWho;
GO

CREATE OR ALTER FUNCTION dbo.fnChosenEpisodes(@SeriesNumber INT,@AuthorName VARCHAR(100)) RETURNS TABLE
AS
RETURN
    SELECT
        e.EpisodeId,
        e.SeriesNumber,
        e.EpisodeNumber,
        e.EpisodeType,
        e.Title,
        e.EpisodeDate,
        a.AuthorName,
        e.Notes
    FROM 
        dbo.tblEpisode e
    JOIN 
        dbo.tblAuthor a ON e.AuthorId = a.AuthorId
    WHERE 
        (@SeriesNumber IS NULL OR e.SeriesNumber = @SeriesNumber) AND 
        (@AuthorName IS NULL OR a.AuthorName LIKE '%' + @AuthorName + '%');
GO

SELECT COUNT(*) FROM dbo.fnChosenEpisodes(2,'moffat')

SELECT COUNT(*) FROM dbo.fnChosenEpisodes(2,null)

SELECT COUNT(*) FROM dbo.fnChosenEpisodes(null,'moffat')

SELECT COUNT(*) FROM dbo.fnChosenEpisodes(null,null)