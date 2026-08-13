use DoctorWho;
go

with TennantEnemies as
(
    select
        e.EpisodeId,
        e.Title,
        ee.EnemyId
    from
        tblEpisode e
    join
        tblDoctor d on e.DoctorId = d.DoctorId
    join
        tblEpisodeEnemy ee on e.EpisodeId = ee.EpisodeId
    where
        d.DoctorName = 'David Tennant'
),
OtherDoctorEnemies as
(
    select distinct
        ee.EnemyId
    from
        tblEpisode e
    join
        tblDoctor d on e.DoctorId = d.DoctorId
    join
        tblEpisodeEnemy ee on e.EpisodeId = ee.EpisodeId
    where
        d.DoctorName <> 'David Tennant'
)

select distinct
    te.EpisodeId,
    te.Title
from
    TennantEnemies te
where
    te.EnemyId not in (select EnemyId from OtherDoctorEnemies)
    and te.EpisodeId not in
    (
        select EpisodeId
        from TennantEnemies
        where EnemyId in (select EnemyId from OtherDoctorEnemies)
    )
order by
    te.Title;