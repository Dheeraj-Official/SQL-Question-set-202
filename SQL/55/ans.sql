use Music_01;

SELECT
    sh.Show_date,
    sh.Tickets_sold,
    sh.Tickets_available,
    sh.[Revenue_$],
    v.Venue,
    t.Tour_name,
    ar.Artist
FROM
    Show AS sh
    INNER JOIN Venue AS v ON sh.Venue_ID = v.Venue_ID
    INNER JOIN City AS c ON v.City_ID = c.City_ID
    INNER JOIN Tour AS t ON sh.Tour_ID = t.Tour_ID
    INNER JOIN Artist AS ar ON t.Artist_ID = ar.Artist_ID
WHERE
    c.City = 'Manchester'
ORDER BY
    sh.Show_date ASC;