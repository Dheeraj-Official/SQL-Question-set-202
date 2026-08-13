use Movies_02;

select 
    top 9
    f.Title,
    s.Source
from 
    film f
join 
    source s on f.sourceID = s.sourceID
where
    Source is not null