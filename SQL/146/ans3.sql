USE WorldEvents;
GO

CREATE OR ALTER FUNCTION dbo.fn_remove(@Country VARCHAR(MAX)) RETURNS VARCHAR(MAX)
AS 
BEGIN
    DECLARE @index INT
    DECLARE @Result VARCHAR(MAX)

    SET @index = CHARINDEX('(', @Country)

    IF @index > 0
        SET @Result = LEFT(@Country, @index - 1)
    ELSE
        SET @Result = @Country

    RETURN @Result
END
GO

UPDATE dbo.tblCountry
SET CountryName = dbo.fn_remove(CountryName)
GO


SELECT * from tblCountry;
GO
