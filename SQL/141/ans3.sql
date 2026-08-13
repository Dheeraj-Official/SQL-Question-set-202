-- Fast Method
-- Scalar function are slow than Group by

USE DoctorWho;

SELECT
    e.EpisodeId,
    e.Title,
    COUNT(DISTINCT c.CompanionId) AS Companions,
    COUNT(DISTINCT en.EnemyId) AS Enemies,
    dbo.fnWords(Title) AS Words
FROM
    dbo.tblEpisode AS e
    LEFT JOIN dbo.tblEpisodeCompanion AS c ON c.EpisodeId = e.EpisodeId
    LEFT JOIN dbo.tblEpisodeEnemy AS en ON en.EpisodeId = e.EpisodeId
GROUP BY
    e.EpisodeId, e.Title
ORDER BY
    Words DESC;