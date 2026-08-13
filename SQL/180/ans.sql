use Music_01
go

select
	dt.Venue_size
	,count(*) as Count_venues
	,avg(dt.Construction_cost_$m) as Avg_cost_$m
	,avg(dt.Lifespan_days) as Avg_lifespan_days
	,avg(dt.Cost_per_day) as Avg_cost_per_day_$
from
	(select
		case
			when v.Capacity is null then 'Unknown'
			when v.Capacity < 1000 then 'Intimate'
			when v.Capacity < 10000 then 'Small'
			when v.Capacity < 50000 then 'Medium'
			when v.Capacity < 100000 then 'Large'
			else 'Enormous'
		end as Venue_size
		,v.Construction_cost_$m
		,datediff(day, v.Opening_date, isnull(v.Closing_date, getdate())) as Lifespan_days
		,(v.Construction_cost_$m / datediff(day, v.Opening_date, isnull(v.Closing_date, getdate()))) * 1000000 as Cost_per_day
	from
		dbo.Venue as v) as dt
group by
	dt.Venue_size
order by
	Avg_cost_$m desc