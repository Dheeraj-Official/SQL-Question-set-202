use Music_01;

SELECT
    Artist_type,
    COUNT(*) AS NumberOfArtists
FROM
    Artist
GROUP BY
    Artist_type;