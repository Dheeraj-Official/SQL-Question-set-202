use WorldEvents;

select 
    AVG(LEN(EventName)) as 'Average Length'
from tblevent;

SELECT EventName
FROM tblEvent
WHERE LEN(EventName) > (
    SELECT AVG(LEN(EventName))
    FROM tblEvent
)
ORDER BY EventName ASC;