use Music_01;
go

create or alter proc usp_Tour_Totals as
select
    artist,
    tour_name,
    sum(tickets_sold) as Total_tickets_sold,
    sum([Revenue_$]) as Total_revenue
from
    artist ar
join 
    tour t on t.artist_id = ar.artist_id
join 
    show s on s.tour_id = t.tour_id
group by
    artist,
    tour_name
order by 
    Total_revenue desc
go

exec usp_Tour_Totals