use WorldEvents;

select 
    top 5
    EventName,
    EventDetails
from 
    dbo.tblEvent
order by 
    EventDate;