USE Music_01;
GO

CREATE OR ALTER FUNCTION dbo.fnAddressFirstLine(@address VARCHAR(100))
RETURNS VARCHAR(100)
AS
BEGIN
    DECLARE @comma_pos INT
    SET @comma_pos = CHARINDEX(',', @address)

    IF @comma_pos = 0
        RETURN @address
    
    RETURN LEFT(@address, @comma_pos - 1)
END;
GO

