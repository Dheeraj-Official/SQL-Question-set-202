USE DoctorWho;

SELECT
    a.AuthorName,
    d.DoctorName,
    COUNT(e.EpisodeId) AS [Number of Episodes]
FROM
    tblEpisode AS e
    INNER JOIN tblAuthor AS a ON e.AuthorId = a.AuthorId
    INNER JOIN tblDoctor AS d ON e.DoctorId = d.DoctorId
GROUP BY
    a.AuthorName,
    d.DoctorName
HAVING
    COUNT(e.EpisodeId) > 5
ORDER BY
    [Number of Episodes] DESC;