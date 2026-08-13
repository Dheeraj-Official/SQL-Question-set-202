USE Music_01;
GO

CREATE OR ALTER FUNCTION dbo.ufn_SearchMusic (@SearchString NVARCHAR(200)) RETURNS TABLE
AS
RETURN
(
    SELECT 
        'Single' AS ItemType, 
        t.Track_name AS Name,
        a.Artist AS ArtistName, 
        t.Single_release_date AS ReleaseDate
    FROM 
        dbo.Track t
    JOIN 
        dbo.Album al ON t.Album_ID = al.Album_ID
    JOIN 
        dbo.Artist a ON al.Artist_ID = a.Artist_ID
    WHERE 
        t.Single_release_date IS NOT NULL AND t.Track_name LIKE '%' + @SearchString + '%'

UNION ALL

    SELECT 
        'Album' AS ItemType,
        al.Title AS Name,
        a.Artist AS ArtistName, 
        al.Release_date AS ReleaseDate
    FROM 
        dbo.Album al
    JOIN 
        dbo.Artist a ON al.Artist_ID = a.Artist_ID
    WHERE 
        al.Title LIKE '%' + @SearchString + '%'

UNION ALL

    SELECT 
        'Tour' AS ItemType, 
        tr.Tour_name AS Name,
        a.Artist AS ArtistName, 
        tr.Start_date AS ReleaseDate
    FROM 
        dbo.Tour tr
    JOIN 
        dbo.Artist a ON tr.Artist_ID = a.Artist_ID
    WHERE 
        tr.Tour_name LIKE '%' + @SearchString + '%'
);
GO

select * from dbo.ufn_SearchMusic('chris');