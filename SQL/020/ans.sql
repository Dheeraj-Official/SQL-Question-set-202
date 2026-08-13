use Music_01;

SELECT
    show_date,
    Tickets_available,
    Tickets_sold,
    Tickets_available - Tickets_sold AS Unsold_tickets,
    Revenue_$,
    Revenue_$ / Tickets_sold AS Avg_ticket_price,
    (Tickets_available - Tickets_sold) * (Revenue_$ / Tickets_sold) AS Lost_revenue
FROM
    Show
WHERE
    Tickets_available - Tickets_sold >= 10000
ORDER BY
    Unsold_tickets DESC;