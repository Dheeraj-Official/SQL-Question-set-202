USE WorldEvents;

SELECT 
    UPPER(LEFT(c.CategoryName, 1))      AS [Category Initial],
    COUNT(*)                     AS [Number of Events],
    AVG(LEN(e.EventName))        AS [Avg. EventName Len.]
FROM 
    dbo.tblEvent e
JOIN 
    dbo.tblCategory c ON e.CategoryID = c.CategoryID
GROUP BY 
    LEFT(c.CategoryName, 1)
ORDER BY 
    LEFT(c.CategoryName, 1);