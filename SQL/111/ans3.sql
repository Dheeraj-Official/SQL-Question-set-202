USE Music_01;
GO

ALTER PROCEDURE usp_Get_Top_Album_ID
    @Year INT
AS
BEGIN
    RETURN (
        SELECT TOP 1 Album_ID
        FROM Album
        WHERE YEAR(Release_date) = @Year
        ORDER BY [US_sales_(m)] DESC
    );
END
GO