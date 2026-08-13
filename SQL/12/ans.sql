use Music_01

select 
    top 5
    title,
    release_date,
    wiki_url
from
    album
where 
    title = 'Greatest Hits'

select 
    top 5
    title,
    release_date,
    wiki_url
from
    album
where 
    title like '%Greatest Hits%';


select 
    top 5
    tour_name,
    [Start_date],
    shows
from
    tour
where 
    tour_name not like '%tour%';