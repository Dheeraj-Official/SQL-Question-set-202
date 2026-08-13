USE Music_01;

IF OBJECT_ID('tempdb..#CovidCancellations') IS NOT NULL
    DROP TABLE #CovidCancellations;

-- 01
SELECT *
INTO #CovidCancellations
FROM Show
WHERE Cancellation_reason LIKE '%covid%';

-- 02
SELECT
    CONCAT(COUNT(*), ' shows cancelled due to Covid') AS Result
FROM
    #CovidCancellations;

-- 03
SELECT
    v.Venue,
    COUNT(*) AS Number_of_cancellations
FROM
    #CovidCancellations c
    JOIN Venue v ON c.Venue_ID = v.Venue_ID
GROUP BY
    v.Venue
ORDER BY
    Number_of_cancellations DESC;

-- 04
SELECT TOP 3
    a.Artist,
    COUNT(*) AS Number_of_cancellations
FROM
    #CovidCancellations c
    JOIN Tour t ON c.Tour_ID = t.Tour_ID
    JOIN Artist a ON t.Artist_ID = a.Artist_ID
GROUP BY
    a.Artist
ORDER BY
    Number_of_cancellations DESC;