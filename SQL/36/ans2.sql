use Music_01

select 
    show_id,
    show_date,
    cancelled,
    Cancellation_reason,
    case
        when Cancelled = 0 then 'Not Cancelled'
        when Cancellation_reason is null then 'Cancelled for unknown reason'
        else 'Cancelled for other reason'
    end as Cancellation_status
from
    show
where
    show_id between 7256 and 7259