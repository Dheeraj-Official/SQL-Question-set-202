USE DoctorWho;

SELECT
    EpisodeId,
    Title,
    dbo.fnNumberCompanions(EpisodeId) AS Companions,
    dbo.fnNumberEnemies(EpisodeId) AS Enemies,
    dbo.fnWords(Title) AS Words
FROM
    tblEpisode
ORDER BY
    Words DESC;