use WorldEvents;
go


create or alter proc uspContinentEvents
    @continent varchar(50) = null,
    @after datetime = null,
    @before datetime = null
as
begin
    select
        ct.ContinentName,
        e.EventName,
        e.EventDate
    from
        tblEvent e
    join
        tblCountry c on e.CountryID = c.CountryID
    join
        tblContinent ct on c.ContinentID = ct.ContinentID
    where
        (@continent is null or ct.ContinentName = @continent) and
        (@after is null or e.EventDate >= @after) and
        (@before is null or e.EventDate <= @before)
end
go

exec uspContinentEvents

-- exec uspContinentEvents 'North America', '2020-01-01', '2020-12-31';