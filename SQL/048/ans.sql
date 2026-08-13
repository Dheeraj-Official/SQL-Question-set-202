use Music_01;

SELECT
    Artist.Artist AS [Artist name],
    Album.Title AS [Album name],
    Track.Track_name AS [Track name]
FROM
    Artist
    INNER JOIN Album ON Artist.Artist_ID = Album.Artist_ID
    INNER JOIN Track ON Album.Album_ID = Track.Album_ID
WHERE
    (Track.Track_name LIKE N'%easy%')
    OR (Track.Track_name LIKE N'%simple%')
ORDER BY
    [Album name]