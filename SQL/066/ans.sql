USE Music_01;

SELECT
    ar.Artist,
    COUNT(al.Album_ID) AS NumberOfAlbums,
    SUM(al.[US_sales_(m)]) AS TotalUSSales,
    AVG(al.[US_sales_(m)]) AS AverageUSSales
FROM
    Artist AS ar
    INNER JOIN Album AS al ON ar.Artist_ID = al.Artist_ID
WHERE
    al.US_Billboard_200_peak = 1
GROUP BY
    ar.Artist
HAVING
    AVG(al.[US_sales_(m)]) >= 10
ORDER BY
    NumberOfAlbums DESC;