use WorldEvents;

SELECT
    c.CategoryId,
    c.CategoryName,
    e.EventId,
    e.EventDate,
    e.EventName
FROM
    tblCategory c
    INNER JOIN tblEvent e ON c.CategoryId = e.CategoryId
ORDER BY
    e.EventDate DESC;