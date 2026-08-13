use worldEvents;

select 
    EventName,
    LEN(EventName) as 'Length of name'
from
    tblEvent
order by 'Length of name';