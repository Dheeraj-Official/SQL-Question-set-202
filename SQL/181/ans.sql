use worldEvents;
go

with ThisAndThat as
(
    select 
        eventID,
        CHARINDEX('this', eventDetails) as 'ThisPosition',
        CHARINDEX('that', eventDetails) as 'ThatPosition'
    from
        tblEvent
)


select
    EventName,
    EventDate
from
    tblEvent e
join
    ThisAndThat tt
on
    tt.EventID = e.EventID
where
    tt.ThisPosition < tt.ThatPosition and 
    tt.ThisPosition != 0 and tt.ThatPosition != 0
order by
    EventDate
