USE music_01;

SELECT 
    title,
    Album_mins,
    Album_secs,
    (album_mins * 60) + album_secs AS Total_secs,
    (album_mins * 60) + album_secs - (SELECT AVG((album_mins * 60) + album_secs) FROM album) AS Seconds_longer_than_avg
FROM album
WHERE 
    ((album_mins * 60) + album_secs) > (SELECT AVG((album_mins * 60) + album_secs) FROM album)
    AND ((album_mins * 60) + album_secs) - (SELECT AVG((album_mins * 60) + album_secs) FROM album) < 60
ORDER BY Total_secs DESC;

-- Short method

declare @avg_secs float = (SELECT AVG((album_mins * 60) + album_secs) FROM album)

SELECT 
    title,
    Album_mins,
    Album_secs,
    (album_mins * 60) + album_secs AS Total_secs,
    (album_mins * 60) + album_secs - @avg_secs AS Seconds_longer_than_avg
FROM album
WHERE 
    ((album_mins * 60) + album_secs) > @avg_secs
    AND ((album_mins * 60) + album_secs) - @avg_secs < 60
ORDER BY Total_secs DESC;
