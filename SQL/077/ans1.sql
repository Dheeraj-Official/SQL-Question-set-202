USE Music_01;
GO

CREATE OR ALTER VIEW dbo.Number_1_Albums AS

select
	al.Album_ID
	,al.Title
	,al.Release_date
	,ar.Artist
	,r.Record_label
from
	dbo.Artist as ar
join 
	dbo.Album as al on ar.Artist_ID = al.Artist_ID
join 
	dbo.Record_Label as r on al.Record_label_ID = r.Record_label_ID
WHERE
    al.US_Billboard_200_peak = 1