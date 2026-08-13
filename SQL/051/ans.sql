use Music_01;

SELECT
    a.Title,
    a.[US_sales_(m)],
    sg.Subgenre,
    g.Genre
FROM
    Album AS a
    INNER JOIN Subgenre AS sg ON a.Subgenre_ID = sg.Subgenre_ID
    INNER JOIN Genre AS g ON sg.Genre_ID = g.Genre_ID
WHERE
    a.[US_sales_(m)] >= 0.5
    AND a.[US_sales_(m)] < 10
    AND g.Genre = 'Metal'
ORDER BY
    a.Title ASC;