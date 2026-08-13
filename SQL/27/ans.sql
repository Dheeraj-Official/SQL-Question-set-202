USE Music_01;

select CAST(60 as decimal(5,3))

SELECT
    Title,
    Album_mins,
    Album_secs,
    (Album_mins * 60 + Album_secs) AS Total_length_secs,
    (Album_mins * 60 + Album_secs) / CAST(Tracks AS DECIMAL) AS Avg_track_length_secs,
    CAST((Album_mins * 60 + Album_secs) / CAST(Tracks AS DECIMAL) / 60 AS DECIMAL(5, 2)) AS Avg_track_length_mins
FROM Album
WHERE (Album_mins * 60 + Album_secs) / CAST(Tracks AS DECIMAL) / 60 >= 10;
