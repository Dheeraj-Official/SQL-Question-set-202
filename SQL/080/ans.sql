use WorldEvents;
go

create or alter view vvEverything as 

select 
    c.CategoryName as Category,
    ct.ContinentName as Continent,
    co.CountryName as Country,
    e.EventName as [Event],
    e.EventDate
from
    tblCategory c
join 
    tblEvent e on c.CategoryID = e.CategoryID
join 
    tblCountry co on co.CountryID = e.CountryID
join 
    tblContinent ct on ct.ContinentID = co.ContinentID;
