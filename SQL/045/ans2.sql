use Music_01

select 
    venue,
    Opening_date,
    Closing_date,
    DATEDIFF(DAY,Opening_date, isnull(Closing_date, getdate())) as days_Open
from
    venue
where
    Opening_date is not null