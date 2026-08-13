USE WorldEvents;
Go

DROP TABLE IF EXISTS  Continent_Summary;

select
    ct.ContinentName,
    count(DISTINCT co.CountryID) as 'Countries in Continent',
    count(DISTINCT e.EventID) as 'Events in Continent',
    min(e.EventDate) as 'Earliest Continent Event',
    max(e.EventDate) as 'Latest Continent Event'
INTO 
    Continent_Summary
from 
    tblEvent e
join 
    tblCountry co on co.CountryID = e.CountryID
join 
    tblContinent ct on ct.ContinentID = co.ContinentID
GROUP BY
    ct.ContinentName;

SELECT * FROM Continent_Summary;
