use Music_01;

declare @result table (
    Most_popular nvarchar(255),
    item_name nvarchar(255),
    Count_of_shows int
)


-- Artist
insert into @result
select
    top 1
    'artist',
    artist,
    count(*)
from
    tour t
join
    artist ar on ar.artist_id = t.artist_id
join 
    show s on s.tour_id = t.tour_id
group by
    artist
order by
    count(*) desc


-- City
insert into @result
select 
    top 1
    'city',
    city,
    count(*)
from
    show s
join 
    venue v on v.venue_id = s.venue_id
join
    City c on c.city_id = v.City_id
group by
    city
order by
    count(*) desc


-- Country
insert into @result
select
    top 1
    'Country',
    cy.Country,
    count(*) as 'Number of Shows'
from
    show s
join 
    venue v on v.venue_id = s.venue_id
join
    City c on c.city_id = v.City_id
join 
    Country cy on cy.Country_ID = c.Country_ID
group by
    cy.Country
order by
    count(*) desc


-- Tour
insert into @result
select
    top 1
    'tour',
    Tour_name,
    count(*)
from
    tour t
join 
    show s on s.tour_id = t.tour_id
group by
    tour_name
order by
    count(*) desc

-- Venue
insert into @result
select 
    top 1
    'venue',
    venue,
    count(*)
from 
    show s
join 
    venue v on v.venue_id = s.venue_id
group by
    venue
order by
    count(*) desc


-- venue type
insert into @result
select 
    top 1
    'venue_type',
    venue_type,
    count(*)
from
    show s
join 
    venue v on v.venue_id = s.venue_id
join 
    venue_type vt on vt.venue_type_id = v.venue_type_id
group by
    venue_type
order by
    count(*) desc


select * from @result