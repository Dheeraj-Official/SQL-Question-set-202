use DoctorWho;

SELECT
    ep.Title,
    a.AuthorName,
    d.DoctorName,
    en.EnemyName,
    LEN(a.AuthorName) + LEN(ep.Title) + LEN(d.DoctorName) + LEN(en.EnemyName) AS TotalLength
FROM
    tblEpisode AS ep
    INNER JOIN tblAuthor AS a ON ep.AuthorId = a.AuthorId
    INNER JOIN tblDoctor AS d ON ep.DoctorId = d.DoctorId
    INNER JOIN tblEpisodeEnemy AS ee ON ep.EpisodeId = ee.EpisodeId
    INNER JOIN tblEnemy AS en ON ee.EnemyId = en.EnemyId
WHERE
    LEN(a.AuthorName) + LEN(ep.Title) + LEN(d.DoctorName) + LEN(en.EnemyName) < 40;