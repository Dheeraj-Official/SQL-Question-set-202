use DoctorWho;
go

create or alter Proc spEnemyEpisodes
    @enemyName nvarchar(50)
as
begin
    select 
        seriesNumber,
        episodeNumber,
        Title
    from
        tblEpisode e
    join
        tblEpisodeEnemy ee on ee.EpisodeID = e.EpisodeID
    join
        tblEnemy t on t.EnemyID = ee.EnemyID
    where
        t.EnemyName like '%' + @enemyName + '%';
end
go

exec spEnemyEpisodes 'ood'
exec spEnemyEpisodes 'auton'
exec spEnemyEpisodes 'silence'
