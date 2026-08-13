use DoctorWho;
GO

CREATE OR ALTER PROCEDURE spSummariseEpisodes
AS
BEGIN
    -- 5 least frequently-appearing companions
    SELECT TOP 5
        c.CompanionName,
        COUNT(*) AS Appearances
    FROM
        tblEpisodeCompanion ec
    JOIN
        tblCompanion c ON c.CompanionId = ec.CompanionId
    GROUP BY
        c.CompanionName
    ORDER BY
        Appearances ASC;

    -- 5 least frequently-appearing enemies
    SELECT TOP 5
        e.EnemyName,
        COUNT(*) AS Appearances
    FROM
        tblEpisodeEnemy ee
    JOIN
        tblEnemy e ON e.EnemyId = ee.EnemyId
    GROUP BY
        e.EnemyName
    ORDER BY
        Appearances ASC;
END;
GO

EXEC spSummariseEpisodes