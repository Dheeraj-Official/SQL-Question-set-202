use Music_01
go

select
	a.Artist
	,dtAlbums.Albums
	,dtNumber1Albums.Number_1_albums
	,dtSingles.Singles
	,dtNumber1Singles.Number_1_singles
	,dtTours.Tours
	,dtShows.Shows
from
	dbo.Artist as a

	left join
		(select
			ab.Artist_ID
			,count(*) as Singles
		from
			dbo.Album as ab
			join dbo.Track as t on ab.Album_ID = t.Album_ID
		where
			t.Single_release_date is not null
		group by
			ab.Artist_ID) as dtSingles on a.Artist_ID = dtSingles.Artist_ID

	left join
		(select
			ab.Artist_ID
			,count(*) as Number_1_singles
		from
			dbo.Album as ab
			join dbo.Track as t on ab.Album_ID = t.Album_ID
		where
			t.Single_release_date is not null
			and t.US_Billboard_Hot_100_peak = 1
		group by
			ab.Artist_ID) as dtNumber1Singles on a.Artist_ID = dtNumber1Singles.Artist_ID
	
	left join
		(select
			ab.Artist_ID
			,count(*) as Albums
		from
			dbo.Album as ab
		group by
			ab.Artist_ID) as dtAlbums on a.Artist_ID = dtAlbums.Artist_ID

	left join
		(select
			ab.Artist_ID
			,count(*) as Number_1_albums
		from
			dbo.Album as ab
		where
			ab.US_Billboard_200_peak = 1
		group by
			ab.Artist_ID) as dtNumber1Albums on a.Artist_ID = dtNumber1Albums.Artist_ID

	left join
		(select
			t.Artist_ID
			,count(*) as Tours
		from
			dbo.Tour as t
		group by
			t.Artist_ID) as dtTours on a.Artist_ID = dtTours.Artist_ID

	left join
		(select
			t.Artist_ID
			,count(*) as Shows
		from
			dbo.Tour as t
			join dbo.Show as s on t.Tour_ID = s.Tour_ID
		group by
			t.Artist_ID) as dtShows on a.Artist_ID = dtShows.Artist_ID

order by
	a.Artist