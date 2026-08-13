use Music_01;

declare @NameCotains varchar(255) = '%love%'

select 
    title,
    Release_date,
    US_Billboard_200_peak
from
    album
where
    title like @NameCotains


set @NameCotains = '%hate%'
