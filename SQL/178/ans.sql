USE DoctorWho
GO

WITH mpEpisodes AS (
	SELECT
		e.EpisodeId
	FROM
		tblEpisode AS e
		JOIN tblAuthor AS a ON e.AuthorId = a.AuthorId
	WHERE
		a.AuthorName like '%mp%'
)

SELECT DISTINCT
	c.CompanionName
FROM 
	mpEpisodes AS e
	JOIN tblEpisodeCompanion AS ec ON e.EpisodeId = ec.EpisodeId
	JOIN tblCompanion AS c ON ec.CompanionId = c.CompanionId
ORDER BY
	c.CompanionName