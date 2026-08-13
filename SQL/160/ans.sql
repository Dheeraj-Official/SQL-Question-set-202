use Music_01;

declare @ChartFloppers Table(
    title nvarchar(255),
    artist  nvarchar(255),
    release_date date,
    [US_sales_(m)] float,
    release_type nvarchar(255)
)

insert into @ChartFloppers 
select 
    a.Title,
    ar.Artist,
    a.Release_date,
    a.[US_sales_(m)],
    ar.Artist_type as release_type
from 
    album a
join 
    artist ar on ar.artist_id = a.artist_id


select * from @ChartFloppers