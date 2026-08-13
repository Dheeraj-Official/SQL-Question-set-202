use Music_01;

declare @ReleaseAfter Date = '1064-01-01'

select 
    title,
    Release_date,
    US_Billboard_200_peak
from
    album
where
    Release_date > @ReleaseAfter