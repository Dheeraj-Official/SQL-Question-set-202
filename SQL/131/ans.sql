use Music_01
go

create or alter proc dbo.usp_Album_Countdown
	@FromChartPosition tinyint
as
begin

	print concat('Count of albums counting down from ', @FromChartPosition)
	print '====================================='

	declare @AlbumCount int

	while @FromChartPosition >= 1
		begin
			set @AlbumCount = (select count(*) from dbo.Album where US_Billboard_200_peak = @FromChartPosition)

			print concat(@AlbumCount, ' albums reached number ', @FromChartPosition, ' in the charts')

			set @FromChartPosition -= 1
		end

end
go

exec usp_Album_Countdown 5