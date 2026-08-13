USE Music_01;

-- CAST / CONVERT
SELECT
    Tour_name,
    Attendance,
    Tour_gross_$,
    CAST(Tour_gross_$ / CAST(Attendance AS DECIMAL) AS DECIMAL(5, 2)) AS Avg_ticket_price
FROM Tour
ORDER BY Avg_ticket_price DESC;

SELECT
    Tour_name,
    Attendance,
    Tour_gross_$,
    CONVERT(DECIMAL(5, 2), Tour_gross_$ / CONVERT(DECIMAL, Attendance)) AS Avg_ticket_price
FROM Tour
ORDER BY Avg_ticket_price DESC;