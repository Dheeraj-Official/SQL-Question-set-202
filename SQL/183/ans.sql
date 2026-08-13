use WorldEvents;
go

with First_Half_CTE as
(

    select 
        eventName,
        CategoryID
    from
        tblEvent
    where
        LEFT(EventName, 1) > 'A' and LEFT(EventName, 1) < 'M'
)

select 
    c.CategoryName,
    fhc.EventName
from
    First_Half_CTE fhc
join
    tblCategory c on fhc.CategoryID = c.CategoryID
order by
    c.CategoryName