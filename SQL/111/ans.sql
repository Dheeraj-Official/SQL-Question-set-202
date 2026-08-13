USE Music_01;
GO

CREATE OR ALTER PROCEDURE usp_Get_Top_Album_ID
    @Year INT
AS
BEGIN
    SELECT TOP 1 Album_ID
    FROM Album
    WHERE YEAR(Release_date) = @Year
    ORDER BY [US_sales_(m)] DESC;
END
GO

CREATE OR ALTER PROCEDURE usp_Show_Album_Details
    @Album_ID INT
AS
BEGIN
    SELECT Title, Artist_ID, Release_date, [US_sales_(m)]
    FROM Album
    WHERE Album_ID = @Album_ID;
END
GO