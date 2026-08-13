USE DoctorWho;

SELECT
    YEAR(e.EpisodeDate) AS "Episode Year",
    em.EnemyName AS "Enemy Name",
    COUNT(*) AS "Number of episodes"
FROM
    dbo.tblEpisode e
JOIN dbo.tblEpisodeEnemy ee ON ee.EpisodeId = e.EpisodeId
JOIN dbo.tblEnemy em ON em.EnemyId = ee.EnemyId
JOIN dbo.tblDoctor d ON d.DoctorId = e.DoctorId
WHERE
    YEAR(d.BirthDate) < 1970
GROUP BY
    YEAR(e.EpisodeDate), em.EnemyName
HAVING
    COUNT(*) > 1
ORDER BY
    "Episode Year", 
    "Number of episodes" DESC;