USE WorldEvents;


SELECT
    CASE 
        WHEN YEAR(EventDate) BETWEEN 1701 AND 1800 THEN '18th Century'
        WHEN YEAR(EventDate) BETWEEN 1801 AND 1900 THEN '19th Century'
        WHEN YEAR(EventDate) BETWEEN 1901 AND 2000 THEN '20th Century'
        WHEN YEAR(EventDate) BETWEEN 2001 AND 2100 THEN '21th Century'
    END
    AS Century,
    COUNT(*) as 'Number of Events'
FROM
    dbo.tblEvent
GROUP BY CUBE (
        CASE 
            WHEN YEAR(EventDate) BETWEEN 1701 AND 1800 THEN '18th Century'
            WHEN YEAR(EventDate) BETWEEN 1801 AND 1900 THEN '19th Century'
            WHEN YEAR(EventDate) BETWEEN 1901 AND 2000 THEN '20th Century'
            WHEN YEAR(EventDate) BETWEEN 2001 AND 2100 THEN '21th Century'
        END
)
ORDER BY Century;