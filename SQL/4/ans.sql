use Music_01

select 
    a.Artist as "Artist Name",
    a.Artist_type as "Type of Artist",
    a.Year_formed as "Year Formed"
from 
    dbo.Artist a
order by a.Year_formed desc;

-- query 2
select 
    a.Artist as "Artist Name",
    a.Artist_type as "Type of Artist",
    a.Year_formed as "Year Formed"
from 
    dbo.Artist a
order by a.Artist;