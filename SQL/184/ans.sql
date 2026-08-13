use Music_01;
go

WITH AlbumTrackStats AS
(
    SELECT
        Album_ID,
        COUNT(*) AS NumberOfTracks,
        SUM(Track_mins * 60 + Track_secs) AS TotalDurationSecs
    FROM dbo.Track
    GROUP BY Album_ID
)
SELECT
    al.Title,
    al.Release_date,
    ats.NumberOfTracks,
    ats.TotalDurationSecs
FROM AlbumTrackStats ats
JOIN dbo.Album al ON ats.Album_ID = al.Album_ID
ORDER BY al.Title;