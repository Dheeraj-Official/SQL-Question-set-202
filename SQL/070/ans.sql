use Music_01

select 
    ct.Continent, 
    co.Country, 
    c.City, 
    v.Venue, 
    count(s.Show_ID) as 'Number of Shows',
    avg(s.Tickets_sold) as 'Average Ticket Price',
    count(s.Revenue_$) as 'Total Revenue'
from
    dbo.Show s
    join dbo.Venue v on v.Venue_ID = s.Venue_ID
    join dbo.City c on c.City_ID = v.City_ID
    join dbo.Country co on co.Country_ID = c.Country_ID
    join dbo.Continent ct on ct.Continent_ID = co.Continent_ID
group by 
    ct.Continent, 
    co.Country, 
    c.City, 
    v.Venue
order by 
    'Number of Shows' desc;
