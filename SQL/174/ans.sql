-- MSTVF -> Multi- statement table-valued function
USE DoctorWho;
GO

CREATE OR ALTER FUNCTION dbo.fnCompanions (@EpisodeId INT) RETURNS VARCHAR(MAX)
AS
BEGIN
    DECLARE @Result VARCHAR(MAX);

    SELECT 
        @Result = c.CompanionName + ', '
    FROM 
        tblEpisodeCompanion ec
    JOIN 
        tblCompanion c ON ec.CompanionId = c.CompanionId
    WHERE 
        ec.EpisodeId = @EpisodeId;

    RETURN @Result;
END
GO

CREATE OR ALTER FUNCTION dbo.fnEnemies (@EpisodeId INT) RETURNS VARCHAR(MAX)
AS
BEGIN
    DECLARE @Result VARCHAR(MAX);

    SELECT 
        @Result = e.EnemyName + ', '
    FROM 
        tblEpisodeEnemy ee
    JOIN 
        tblEnemy e ON ee.EnemyId = e.EnemyId
    WHERE 
        ee.EpisodeId = @EpisodeId;

    RETURN @Result;
END
GO


CREATE OR ALTER FUNCTION dbo.fnSilly (@CompanionName VARCHAR(100), @EnemyName VARCHAR(100))
RETURNS @Results TABLE
(
    EpisodeId     INT,
    SeriesNumber  INT,
    EpisodeNumber INT,
    Title         VARCHAR(200),
    Appearing     VARCHAR(MAX)
)
AS
BEGIN

    INSERT INTO @Results
    SELECT 
        e.EpisodeId, e.SeriesNumber, 
        e.EpisodeNumber, e.Title,
        dbo.fnCompanions(e.EpisodeId)
    FROM 
        tblEpisode e
    WHERE EXISTS
    (
        SELECT 1
        FROM 
            tblEpisodeCompanion ec
        JOIN 
            tblCompanion c ON ec.CompanionId = c.CompanionId
        WHERE 
            ec.EpisodeId = e.EpisodeId
        AND 
            c.CompanionName LIKE '%' + @CompanionName + '%'
    );

    INSERT INTO @Results
    SELECT 
        e.EpisodeId, 
        e.SeriesNumber, 
        e.EpisodeNumber, 
        e.Title,
        dbo.fnEnemies(e.EpisodeId)
    FROM 
        dbo.tblEpisode e
    WHERE EXISTS
    (
        SELECT 1
        FROM 
            tblEpisodeEnemy ee
        JOIN 
            tblEnemy en ON ee.EnemyId = en.EnemyId
        WHERE 
            ee.EpisodeId = e.EpisodeId AND 
            en.EnemyName LIKE '%' + @EnemyName + '%'
    );

    RETURN;
END
GO

SELECT * FROM dbo.fnSilly('wilf','ood')
