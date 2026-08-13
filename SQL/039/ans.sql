use WorldEvents;


select 
    eventName,
    eventDate,
    FORMAT(eventDate, 'dd/MM/yyyy') as 'using Fromat',
    CONVERT(char(10), EventDate,103) as 'using Convert'
from
    tblEvent
where
    YEAR(eventdate) = '1978'
order by
    eventDate