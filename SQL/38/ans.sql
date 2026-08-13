use WorldEvents;

select
    EventName,
    EventDate,
    CHARINDEX('this', EventDetails) as 'this Position',
    CHARINDEX('that', EventDetails) as 'that Position',
    abs(CHARINDEX(EventDetails, 'this') - CHARINDEX(EventDetails, 'this')) as 'Offset'
from
    tblEvent