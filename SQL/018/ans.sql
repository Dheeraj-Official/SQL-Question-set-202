use WorldEvents;

select 
    e.EventName
from 
    tblEvent e
join tblCategory c on e.CategoryID = c.CategoryID
where 
    c.CategoryName != 'Transport' and e.EventDetails like '%train%';

select
    e.EventName
from
    tblEvent e
join 
    tblCountry c
    on e.CountryID = c.CountryID
where
    c.CountryName = 'Space' and
    e.EventName not like '%space%' and 
    e.EventDetails not like '%space%'


select 
    e.EventName
from 
    tblEvent e
join 
    tblCategory c on e.CategoryID = c.CategoryID
where
    (c.CategoryID = 5 or c.CategoryID = 6) and 
    e.EventDetails not like '%War%' and 
    e.EventDetails not like '%death%'