use Music_01
go

create or alter proc dbo.usp_Vali_Date_Parameters
	@StartDate date = null
	,@EndDate date = null
as
begin

	declare @MaxDate date = (select max(Release_date) from dbo.Album)
	declare @MinDate date = (select min(Release_date) from dbo.Album)

	if @StartDate > @MaxDate
		begin
			select concat('The latest release date is ', format(@MaxDate, 'yyyy-MM-dd')) as 'Invalid start date'
			return
		end

	if @EndDate < @MinDate
		begin
			select concat('The earliest release date is ', format(@MinDate, 'yyyy-MM-dd')) as 'Invalid end date'
			return
		end

	select
		ab.Title
		,ar.Artist
		,ab.Release_date
		,ab.US_Billboard_200_peak
	from
		Album as ab
		join Artist as ar on ar.Artist_ID = ab.Artist_ID
	where
		(ab.Release_date >= @StartDate or @StartDate is null)
		and (ab.Release_date <= @EndDate or @EndDate is null)

end
go


EXEC usp_Vali_Date_Parameters '2025-01-01', '2025-12-31'
EXEC usp_Vali_Date_Parameters '1920-01-01', '1920-12-31'
EXEC usp_Vali_Date_Parameters '2020-01-01', '2020-12-31'
EXEC usp_Vali_Date_Parameters