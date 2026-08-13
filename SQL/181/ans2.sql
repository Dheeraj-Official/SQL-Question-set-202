use worldEvents;
go


select 
    EventName,
    EventDate
from

    (select 
        eventID,
        CHARINDEX('this', eventDetails) as 'ThisPosition',
        CHARINDEX('that', eventDetails) as 'ThatPosition'
    from
        tblEvent
    ) 
as ThisAndThat
join
    tblEvent e
on
    ThisAndThat.EventID = e.EventID
where
    ThisAndThat.ThisPosition < ThisAndThat.ThatPosition and 
    ThisAndThat.ThisPosition != 0 and ThisAndThat.ThatPosition != 0
order by
    EventDate