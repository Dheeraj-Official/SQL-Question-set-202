use Music_01
SELECT
    t.Tour_name,
    t.Start_date,
    t.End_date,
    ISNULL(al.Title, 'No associated album') AS AlbumTitle
FROM
    Tour AS t
    LEFT OUTER JOIN Album AS al ON t.Album_ID = al.Album_ID
ORDER BY
    t.Tour_name ASC;