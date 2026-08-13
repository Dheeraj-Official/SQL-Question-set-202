use DoctorWho

declare @EpisodeID int = 15;

declare @EnemyList varchar(255) = ''

select 
    @EnemyList = @EnemyList + e.EnemyName + ', '
from
    tblEnemy e
    join
        tblEpisodeEnemy ee
    on  
        ee.EnemyID = e.EnemyID
where
    ee.EpisodeId = @EpisodeID

select
    @EpisodeID as 'Episode ID',
    @EnemyList as 'Enemies'
