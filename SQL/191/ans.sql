use worldEvents;
go

-- multiple CTEs
with OwlFreeEvents as
(
    select
        EventID,
        CountryID,
        CategoryID
    from
        tblEvent
    where
        EventName not like '%O%'
        and EventName not like '%W%'
        and EventName not like '%L%'
),
CountryEvents as
(
    select
        e.EventID,
        e.EventName,
        e.EventDate,
        e.CategoryID
    from
        tblEvent e
    where
        e.CountryID in (select distinct CountryID from OwlFreeEvents)
),
CategoryEvents as
(
    select
        e.EventID,
        e.EventName,
        e.EventDate
    from
        tblEvent e
    where
        e.CategoryID in (select distinct CategoryID from CountryEvents)
)

select
    EventName,
    EventDate
from
    CategoryEvents
order by
    EventDate;