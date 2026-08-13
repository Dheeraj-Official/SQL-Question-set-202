USE WorldEvents;
GO

SELECT 
    DISTINCT EventName, 
    dbo.fn_Winners(EventName) AS Winners
FROM 
    dbo.tblEvent
ORDER BY 
    Winners;