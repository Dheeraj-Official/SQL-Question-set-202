USE DoctorWho

BEGIN TRANSACTION

DECLARE @RowsAffected int

UPDATE 	
	tblEpisode
SET
	NumberEnemies = (
		SELECT 
			COUNT(*) 
		FROM 
			tblEpisodeEnemy AS ee
		WHERE 
			ee.EpisodeId = e.EpisodeId
	)
FROM
	tblEpisode AS e

SET @RowsAffected = @@ROWCOUNT

IF @RowsAffected > 100
	BEGIN
		ROLLBACK
		SELECT 'Transaction rolled back: ' + CAST(@RowsAffected AS varchar) + ' rows affected.'
	END
ELSE

	BEGIN
		COMMIT
		SELECT 
			EpisodeId,
			Title,
			NumberEnemies
		FROM
			tblEpisode
	END




