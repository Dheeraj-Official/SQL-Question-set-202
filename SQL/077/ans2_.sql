USE MUSIC_01;
GO

SELECT 
	t.Tour_name,
	t.Start_date,
	na.Title,
	na.Release_date,
	na.Artist,
	na.Record_label
FROM
	dbo.Number_1_Albums na
JOIN 
	dbo.Tour t ON t.Album_ID = na.Album_ID
