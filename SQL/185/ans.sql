use Music_01;
go

-- WITHOUT CTE using Subquery
SELECT
    v.Venue,
    v.Opening_date,
    c.City,
    vs.Count_shows,
    vs.Avg_revenue,
    vs.Avg_tickets_sold
FROM
(
    SELECT
        Venue_ID,
        COUNT(*) AS Count_shows,
        Avg(Tickets_sold) AS Avg_tickets_sold,
        AVG(Revenue_$) AS Avg_revenue
    FROM dbo.Show
    GROUP BY Venue_ID
) AS vs
JOIN dbo.Venue v ON vs.Venue_ID = v.Venue_ID
JOIN dbo.City c ON v.City_ID = c.City_ID
ORDER BY vs.Count_shows DESC;