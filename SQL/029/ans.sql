use Music_01;

select
    title,
    artist_id,
    release_date,
    ISNULL(CAST([US_sales_(m)] AS nvarchar(20)), 'No sales figures provided') as [US_sales_(m)]
from
    album;

select
    tour_name,
    attendance,
    shows,
    ISNULL(CAST(attendance / shows AS nvarchar(20)), 'Not enough data') as avg_show_attendance
from
    tour;


select
    venue,
    capacity,
    construction_cost_$m,
    ISNULL(CAST(construction_cost_$m * 0.8 AS nvarchar(20)), 'No cost data') as construction_cost_gbp
from
    venue;