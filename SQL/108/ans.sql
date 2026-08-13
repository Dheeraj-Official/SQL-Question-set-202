use Music_01

declare @avgCapacity float;
declare @vagCost float;

select 
    @avgCapacity = avg(capacity),
    @vagCost = avg(construction_cost_$m)
from 
    venue;

select
    venue,
    Opening_date,
    capacity,
    construction_cost_$m
from
    venue
where
    capacity > @avgCapacity
    and construction_cost_$m > @vagCost