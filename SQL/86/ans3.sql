use music_01;

SELECT
    title,
    Album_mins,
    album_secs,
    (album_mins * 60) + album_secs AS Total_secs
FROM Album;