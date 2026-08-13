USE Music_01;

EXEC usp_Get_Top_Album_ID @Year = 1980;

EXEC usp_Show_Album_Details @Album_ID = 97;