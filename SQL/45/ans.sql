use Music_01

select 
    venue,
    Construction_start_date,
    Opening_date,
    Construction_cost_$m,
    CAST(Construction_cost_$m / DATEDIFF(DAY,Construction_start_date, Opening_date) as decimal(5,2)) as cost_per_day
from
    venue
where
    Construction_start_date is not null
    and Opening_date is not null and Construction_cost_$m is not null