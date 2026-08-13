use music_01;

-- 01
select
    title,
    US_Billboard_200_peak,
    US_Billboard_200_year_end,
    [US_sales_(m)]
from
    album
where 
    US_Billboard_200_peak = 1

-- 02
select
    title,
    US_Billboard_200_peak,
    US_Billboard_200_year_end,
    [US_sales_(m)]
from
    album
where 
    US_Billboard_200_year_end = 1

-- 03
select
    TOP 10
    title,
    US_Billboard_200_peak,
    US_Billboard_200_year_end,
    [US_sales_(m)]
from
    album
where 
    US_Billboard_200_peak <= 10

-- 04
select
    title,
    US_Billboard_200_peak,
    US_Billboard_200_year_end,
    [US_sales_(m)]
from
    album
where 
    [US_sales_(m)] >= 10
