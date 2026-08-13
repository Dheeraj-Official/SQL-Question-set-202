use WorldEvents;

-- Without CTE -> common table expression
declare @result table (
    eventID int,
    Century varchar(50)
)

insert into @result
    select 
    eventID,
    case
        when YEAR(eventDate) < 1900 then '19th Century and earlier'
        when YEAR(eventDate) < 2000 then '20th Century'
        else '21st Century'
    end as Century
from
    tblEvent

select Century as 'ERA', count(*) as 'Number of Events' 
from @result
group by Century