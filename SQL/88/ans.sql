USE Music_01;

SELECT
    Artist,
    Title,
    Release_date,
    [US_sales_(m)]
FROM
    album a
    JOIN artist ar ON ar.artist_id = a.artist_id
WHERE
    YEAR(Release_date) IN (
        SELECT
            top 1 YEAR(release_date)
        FROM
            album
        ORDER BY
            [US_sales_(m)] DESC
    )
ORDER BY
    [US_sales_(m)] DESC;