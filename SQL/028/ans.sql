use worldEvents;

SELECT 
    EventName + ' (category ' + CAST(CategoryID AS nvarchar(10)) + ')' AS [Event (Category)],
    EventDate
FROM 
    tblEvent
WHERE 
    CountryID = 1;