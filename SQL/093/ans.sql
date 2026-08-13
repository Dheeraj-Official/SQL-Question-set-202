use WorldEvents;
go

create or alter proc spCountryName as
select
    countryID,
    CountryName
from 
    tblCountry
where
    continentID = 1
order by 
    countryName
go

exec spCountryName
