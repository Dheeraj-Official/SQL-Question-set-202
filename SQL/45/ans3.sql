use Music_01

select 
    venue,
    Closing_date,
    Demolition_date
from
    venue
where
    Demolition_date is not null and
    Closing_date is not null and
    Demolition_date <= DATEADD(month, 1, Closing_date)