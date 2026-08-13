use Worldevents;
go
-- with CTE -> common table expression

with EventEras as 
(
    select 
        eventID,
        case
            when YEAR(eventDate) < 1900 then '19th Century and earlier'
            when YEAR(eventDate) < 2000 then '20th Century'
            else '21st Century'
        end as ERA
    from tblEvent
)

select 
    ERA,
    count(*) as 'Number of Events' from EventEras 
group by ERA
order by ERA