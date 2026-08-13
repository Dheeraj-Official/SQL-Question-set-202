use Music_01

--the basic query
select
	Title
	,US_Billboard_200_peak
	,US_Billboard_200_year_end
from
	dbo.Album
order by
	Title asc


--Albums not in the top 200 chart
select
	Title
	,US_Billboard_200_peak
	,US_Billboard_200_year_end
from
	dbo.Album
where
	US_Billboard_200_peak is null
order by
	Title asc


--Albums in the weekly chart but not in the year end chart
select
	Title
	,US_Billboard_200_peak
	,US_Billboard_200_year_end
from
	dbo.Album
where
	US_Billboard_200_peak is not null
	and US_Billboard_200_year_end is null
order by
	Title asc


--Number 1 albums not in the year end chart
select
	Title
	,US_Billboard_200_peak
	,US_Billboard_200_year_end
from
	dbo.Album
where
	US_Billboard_200_peak = 1
	and US_Billboard_200_year_end is null
order by
	Title asc


--Number 1 albums not in the year end chart
select
	Title
	,US_Billboard_200_peak
	,US_Billboard_200_year_end
from
	dbo.Album
where
	US_Billboard_200_peak = 1
	and 
	(US_Billboard_200_year_end > 10 or US_Billboard_200_year_end is null)
order by
	Title asc