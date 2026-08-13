use Music_01;

-- 1. Categorise venues by Capacity
select
    Venue,
    Capacity,
    case
        when Capacity is null        then 'Unknown'
        when Capacity < 1000         then 'Intimate'
        when Capacity < 10000        then 'Small'
        when Capacity < 50000        then 'Medium'
        when Capacity < 100000       then 'Large'
        else 'Enormous'
    end as Venue_size
from Venue;


-- 2. Categorise venues by Opening_date
select
    Venue,
    Opening_date,
    case
        when Opening_date is null              then 'Unknown'
        when YEAR(Opening_date) < '1800'         then 'Ancient'
        when YEAR(Opening_date) < '1900'         then '19th Century'
        when YEAR(Opening_date) < '2000'         then '20th Century'
        else '21st Century'
    end as Venue_era
from Venue;


-- 3. Categorise venues by their status (open / closed / demolished)
select
    Venue,
    Opening_date,
    Closing_date,
    Demolition_date,
    case
        when Demolition_date is not null then 'Demolished'
        when Closing_date is not null    then 'Closed but undemolished'
        else 'Still open'
    end as Venue_status
from Venue;