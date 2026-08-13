use WorldEvents;

SELECT
    c.CategoryId,
    c.CategoryName,
    e.EventId,
    e.EventDate,
    e.EventName
FROM
    tblCategory c
    LEFT OUTER JOIN tblEvent e ON c.CategoryId = e.CategoryId
ORDER BY
    e.EventDate DESC;