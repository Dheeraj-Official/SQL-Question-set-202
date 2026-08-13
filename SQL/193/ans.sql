use Music_01;
go

with VenueLocations as
(
    select
        v.Venue_ID,
        v.Venue,
        c.City,
        co.Country
    from
        Venue v
    join
        City c on v.City_ID = c.City_ID
    join
        Country co on c.Country_ID = co.Country_ID
),
ShowCounts as
(
    select
        Venue_ID,
        count(*) as NumberOfShows
    from
        Show
    group by
        Venue_ID
)

select top 10
    vl.Venue,
    vl.City,
    vl.Country,
    sc.NumberOfShows
from
    VenueLocations vl
join
    ShowCounts sc on vl.Venue_ID = sc.Venue_ID
order by
    sc.NumberOfShows desc;