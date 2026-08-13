use DoctorWho;

DROP TABLE IF EXISTS #BestEpisodes;

CREATE TABLE #BestEpisodes (
EpisodeId int,
Title nvarchar(255)
);


INSERT INTO
    #BestEpisodes (EpisodeId, Title)
SELECT
    e.EpisodeId,
    e.Title
FROM
    tblEpisode e
    JOIN tblAuthor a ON a.AuthorId = e.AuthorId
WHERE
    a.AuthorName = 'Steven Moffat';



INSERT INTO
    #BestEpisodes (EpisodeId, Title)
SELECT
    e.EpisodeId,
    e.Title
FROM
    tblEpisode e
    JOIN tblEpisodeCompanion ec ON ec.EpisodeId = e.EpisodeId
    JOIN tblCompanion c ON c.CompanionId = ec.CompanionId
WHERE
    c.CompanionName = 'Amy Pond';


SELECT
    *
FROM
    #BestEpisodes;
SELECT
    Title,
    COUNT(*) AS Appearances
FROM
    #BestEpisodes
GROUP BY
    Title
HAVING
    COUNT(*) > 1
ORDER BY
    Title;