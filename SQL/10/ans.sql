USE WorldEvents;

SELECT
    e.EventName,
    e.EventDate,
    c.CategoryName
FROM 
    tblEvent e
JOIN 
    tblCategory c ON e.CategoryID = c.CategoryID
WHERE
    c.CategoryName = 'Love and Relationships';  