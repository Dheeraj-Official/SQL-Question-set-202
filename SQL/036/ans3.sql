use Music_01

select 
    show_id,
    show_date,
    cancelled,
    Cancellation_reason,
    case
        when Cancelled = 0 then 'Not Cancelled'
        when Cancellation_reason is null then 'Cancelled for unknown reason'
        when Cancellation_reason like '%Covid%'  then 'Cancelled due to COVID'
        else 'Cancelled for other reason'
    end as Cancellation_status
from
    show
where
    show_id between 11556 and 11560