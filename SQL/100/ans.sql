USE DoctorWho;

DECLARE @EpisodeId int = 42;

DECLARE @EpisodeName varchar(100) = (
	SELECT Title
	FROM tblEpisode
	WHERE EpisodeId = @EpisodeId
);

DECLARE @NumberCompanions int = (
	SELECT COUNT(*)
	FROM tblEpisodeCompanion
	WHERE EpisodeId = @EpisodeId
);

DECLARE @NumberEnemies int = (
	SELECT COUNT(*)
	FROM tblEpisodeEnemy
	WHERE EpisodeId = @EpisodeId
);

SELECT
	@EpisodeName AS Title,
	@EpisodeId AS 'Episode id',
	@NumberCompanions AS 'Number of companions',
	@NumberEnemies AS 'Number of enemies';