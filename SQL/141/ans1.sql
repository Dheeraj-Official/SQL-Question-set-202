USE DoctorWho;
GO

-- Function to count companions per episode

CREATE OR ALTER FUNCTION dbo.fnNumberCompanions (@EpisodeId INT)
RETURNS INT
AS
BEGIN
    DECLARE @Count INT

    SELECT @Count = COUNT(*)
    FROM dbo.tblEpisodeCompanion
    WHERE EpisodeId = @EpisodeId

    RETURN @Count
END
GO

-- Function to count enemies per episode

CREATE OR ALTER FUNCTION dbo.fnNumberEnemies (@EpisodeId INT)
RETURNS INT
AS
BEGIN
    DECLARE @Count INT

    SELECT @Count = COUNT(*)
    FROM tblEpisodeEnemy
    WHERE EpisodeId = @EpisodeId

    RETURN @Count
END
GO

-- Function to count words in a title

CREATE OR ALTER FUNCTION dbo.fnWords (@Title VARCHAR(200))
RETURNS INT
AS
BEGIN
    DECLARE @Trimmed VARCHAR(200)
    DECLARE @NoSpaces VARCHAR(200)
    DECLARE @Words INT

    SET @Trimmed = LTRIM(RTRIM(@Title))
    SET @NoSpaces = REPLACE(@Trimmed, ' ', '')

    IF LEN(@Trimmed) = 0
        SET @Words = 0
    ELSE
        SET @Words = LEN(@Trimmed) - LEN(@NoSpaces) + 1

    RETURN @Words
END
GO