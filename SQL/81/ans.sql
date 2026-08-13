USE DoctorWho;
GO
-- View 1
CREATE OR ALTER VIEW vwEpisodeCompanion AS
SELECT EpisodeID
FROM tblEpisodeCompanion
GROUP BY EpisodeID
HAVING COUNT(*) = 1;
GO

-- View 2
CREATE OR ALTER VIEW vwEpisodeEnemy AS
SELECT EpisodeID
FROM tblEpisodeEnemy
GROUP BY EpisodeID
HAVING COUNT(*) = 1;
GO

-- View 3
CREATE OR ALTER VIEW vwEpisodeSummary AS
SELECT e.EpisodeID, e.title
FROM tblEpisode AS e
WHERE NOT EXISTS (SELECT 1 FROM vwEpisodeCompanion AS c WHERE c.EpisodeID = e.EpisodeID)
    AND NOT EXISTS (SELECT 1 FROM vwEpisodeEnemy AS n WHERE n.EpisodeID = e.EpisodeID);
GO

-- result
SELECT *
FROM vwEpisodeSummary
ORDER BY Title;