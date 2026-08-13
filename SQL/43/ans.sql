use WorldEvents

select
    EventName,
    EventDate,
    DATENAME(dw, EventDate) as 'Day of week',
    DATEPART(DAY, EventDate) as 'Day number'
from
    tblEvent