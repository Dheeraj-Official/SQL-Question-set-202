use WorldEvents;
go

create or alter function dbo.fnDetailsByYear(@year int) returns table
as
return 
(
    select
        EventName,
        EventDetails,
        CategoryID,
        CountryID
    from
        tblEvent
    where
        year(EventDate) = @year
)
go


select * from dbo.fnDetailsByYear(1918);


select 
    EventName,
    CategoryName,
    CountryName
from 
    dbo.fnDetailsByYear(1918) fn
join 
    tblCountry c on c.CountryID = fn.CountryID
join 
    tblCategory cy on cy.CategoryID = fn.CategoryID
