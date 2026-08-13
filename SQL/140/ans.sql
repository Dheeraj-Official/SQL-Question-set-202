USE DoctorWho;
GO

CREATE OR ALTER FUNCTION dbo.fnEpisodeDescription (@Title VARCHAR(100))
RETURNS VARCHAR(50)
AS
BEGIN

    DECLARE @Description VARCHAR(50)

    IF CHARINDEX('Part 1', @Title) > 0
        SET @Description = 'First Part'
    ELSE IF CHARINDEX('Part 2', @Title) > 0
        SET @Description = 'Second Part'
    ELSE
        SET @Description = 'Single Episode'

    RETURN @Description

END
GO