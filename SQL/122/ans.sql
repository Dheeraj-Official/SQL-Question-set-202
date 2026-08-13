USE DoctorWho;
GO

CREATE OR ALTER PROCEDURE spGoodAndBad
    @SeriesNumber INT,
    @NumEnemies INT OUTPUT,
    @NumCompanions INT OUTPUT
AS
BEGIN
    SELECT @NumEnemies = COUNT(DISTINCT en.EnemyId)
    FROM tblEpisode AS ep
    JOIN tblEpisodeEnemy AS ee ON ep.EpisodeId = ee.EpisodeId
    JOIN tblEnemy AS en ON ee.EnemyId = en.EnemyId
    WHERE ep.SeriesNumber = @SeriesNumber;

    SELECT @NumCompanions = COUNT(DISTINCT ec.CompanionId)
    FROM tblEpisode AS ep
    JOIN tblEpisodeCompanion AS ec ON ep.EpisodeId = ec.EpisodeId
    WHERE ep.SeriesNumber = @SeriesNumber;
END
GO



DECLARE @SeriesNumber INT = 1;
DECLARE @NumEnemies INT;
DECLARE @NumCompanions INT;

EXEC spGoodAndBad @SeriesNumber, @NumEnemies OUTPUT, @NumCompanions OUTPUT;

SELECT
    @SeriesNumber AS 'Series number',
    @NumEnemies AS 'Number of enemies',
    @NumCompanions AS 'Number of companions';