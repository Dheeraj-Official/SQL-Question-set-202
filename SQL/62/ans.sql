use Music_01;

SELECT
    al.Title,
    ar.Artist,
    ISNULL(t.Tour_name, 'No associated tour') AS Tour_name
FROM
    Album AS al
    INNER JOIN Artist AS ar ON al.Artist_ID = ar.Artist_ID
    LEFT OUTER JOIN Tour AS t ON al.Album_ID = t.Album_ID
WHERE
    t.Tour_ID IS NULL
    AND al.Title LIKE '%road%'
    AND al.Title NOT LIKE '%broad%';