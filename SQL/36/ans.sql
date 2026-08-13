use Music_01

select 
    show_ID,
    show_date,
    Tickets_available,
    Tickets_sold,
    CASE
        WHEN Tickets_available - Tickets_sold = 0 then 'Sold out'
        when 2 * Tickets_sold >= Tickets_available then '50% or more sold'
        when 2 * Tickets_sold < Tickets_available then 'Less than 50% sold'
        else 'Unknown'
    END as Tickets_status
from
    show
where
    show_id between 1823 and 1827