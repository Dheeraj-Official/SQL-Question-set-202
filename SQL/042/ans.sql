use WorldEvents

select
    EventName,
    EventDate,
    DATEDIFF(DAY, '1984-01-07', EventDate) as 'Days offset',
    ABS(DATEDIFF(DAY, '1984-01-07', EventDate)) as 'Days difference'
from
    tblEvent
order by
    'Days difference'