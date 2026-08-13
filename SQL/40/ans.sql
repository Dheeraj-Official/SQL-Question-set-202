use music_01;

select
    title,
    Release_date,
    DATENAME(dw, Release_date) as 'Day of the week',
    CONVERT(char(10), Release_date, 103) as 'UK release date',
    FORMAT(Release_date, 'ddd d MMM yyyy') as 'Long date'
from
    album
where
    -- YEAR(Release_date) = 1984
    DATENAME(dw, Release_date) = DATENAME(dw, '1984-01-07')