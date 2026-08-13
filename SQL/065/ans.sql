USE DoctorWho;

SELECT
    a.AuthorName,
    COUNT(e.EpisodeId) AS [Number of Episodes],
    MIN(e.EpisodeDate) AS [Earliest Date],
    MAX(e.EpisodeDate) AS [Latest Date]
FROM
    tblAuthor AS a
    INNER JOIN tblEpisode AS e ON a.AuthorId = e.AuthorId
GROUP BY
    a.AuthorName
ORDER BY
    [Number of Episodes] DESC;