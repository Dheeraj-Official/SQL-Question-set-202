use WorldEvents;
go 

create or alter proc spEventDetails
    @Country varchar(50) = NULL
as
begin
    select
        EventName,
        EventDate,
        CountryName
    from
        tblEvent e
    join
        tblCountry c on e.CountryID = c.CountryID
    where
        (@Country is null or c.CountryName like  '%' + @Country + '%')
end
go

-- exec spEventDetails
exec spEventDetails 'Ukr'