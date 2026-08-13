use Music_01;

drop table if exists #ChartToppers;

create table #ChartToppers (
    title nvarchar(255),
    artist nvarchar(255),
    release_date date,
    [US_sales_(m)] decimal(10,2),
    release_type nvarchar(50)
);

insert into #ChartToppers
select
    a.title,
    ar.artist,
    a.release_date,
    a.[US_sales_(m)],
    ar.artist_type
from
    album a
join 
    artist ar on ar.artist_id = a.artist_id
where
    a.US_Billboard_200_peak = 1;

select 
    artist,
    release_type,
    count(*) as Count_releases,
    CAST(avg([US_sales_(m)]) as decimal(5,2)) as avg_sales,
    sum([US_sales_(m)]) as sum_sales
from #ChartToppers
group by artist, release_type;