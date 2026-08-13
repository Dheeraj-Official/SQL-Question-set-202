USE Music_01;

DECLARE @TopAlbumID INT;

EXEC @TopAlbumID = usp_Get_Top_Album_ID 1980;

EXEC usp_Show_Album_Details @Album_ID = @TopAlbumID;