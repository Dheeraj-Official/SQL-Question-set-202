use Music_01
go

create or alter proc usp_Albums_Or_Singles
	@ReleaseYear int = null
	,@AlbumOrSingle nvarchar(6) = null
as
begin

	if @AlbumOrSingle = 'Album'
	begin
		select
			ab.Title
			,ar.Artist
			,ab.Release_date
			,concat(ab.Album_mins, ':', format(ab.Album_secs, '00')) as [Length]
			,ab.US_Billboard_200_peak as [Peak_chart_position]
			,'Album' as [Type]
		from
			dbo.Album as ab
			join dbo.Artist as ar on ar.Artist_ID = ab.Artist_ID
		where
			(year(ab.Release_date) = @ReleaseYear or @ReleaseYear is null)
		order by
			ab.Title asc

		return
	end


	if @AlbumOrSingle = 'Single'
	begin
		select
			t.Track_name as [Title]
			,ar.Artist
			,t.Single_release_date
			,concat(t.Track_mins, ':', format(t.Track_secs, '00')) as [Length]
			,US_Billboard_Hot_100_peak as [Peak_chart_position]
			,'Track' as [Type]
		from
			dbo.Track as t
			join dbo.Album as ab on ab.Album_ID = t.Album_ID
			join dbo.Artist as ar on ar.Artist_ID = ab.Artist_ID
		where
			(year(t.Single_release_date) = @ReleaseYear or @ReleaseYear is null)
			and t.Single_release_date is not null
		order by
			[Title] asc
	
		return
	end

	if @AlbumOrSingle is null
	begin
		select
			ab.Title
			,ar.Artist
			,ab.Release_date
			,concat(ab.Album_mins, ':', format(ab.Album_secs, '00')) as [Length]
			,ab.US_Billboard_200_peak as [Peak_chart_position]
			,'Album' as [Type]
		from
			dbo.Album as ab
			join dbo.Artist as ar on ar.Artist_ID = ab.Artist_ID
		where
			(year(ab.Release_date) = @ReleaseYear or @ReleaseYear is null)
		union
		select
			t.Track_name
			,ar.Artist
			,t.Single_release_date
			,concat(t.Track_mins, ':', format(t.Track_secs, '00'))
			,US_Billboard_Hot_100_peak
			,'Track'
		from
			dbo.Track as t
			join dbo.Album as ab on ab.Album_ID = t.Album_ID
			join dbo.Artist as ar on ar.Artist_ID = ab.Artist_ID
		where
			(year(t.Single_release_date) = @ReleaseYear or @ReleaseYear is null)
			and t.Single_release_date is not null
		order by
			[Title] asc

		return
	end

	select 'You must pass ''Album'', ''Single'', or omit the @AlbumOrSingle parameter' as [Problem]

end
go


exec usp_Albums_Or_Singles 1970, 'haaha'
exec usp_Albums_Or_Singles 1970,'Album'
exec usp_Albums_Or_Singles 1970,'Single'
exec usp_Albums_Or_Singles 1970