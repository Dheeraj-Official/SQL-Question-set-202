use Music_01


select
    tour_name,
    start_date,
    end_date,
    Tour_gross_$,
    DATEDIFF(DAY, start_date, end_date) as days,
    Tour_gross_$ / DATEDIFF(DAY, start_date, end_date) as Revenue_per_day
from 
    tour