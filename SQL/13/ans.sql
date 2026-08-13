use WorldEvents;

SELECT 
    EventName,
    EventDate
FROM
    tblEvent
WHERE
    EventName LIKE '%Teletubbies%' OR EventName LIKE '%Pandy%';