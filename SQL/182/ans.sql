use DoctorWho;
go

with CTEDoctor as
(
    select
        e.episodeId
    from
        tblEpisode e
    join
        tblDoctor d on e.DoctorId = d.DoctorId
    join 
        tblEpisodeCompanion ec on ec.EpisodeId = e.EpisodeId
    join
        tblCompanion c on c.CompanionId = ec.CompanionId
    where
        c.CompanionName = 'Rose Tyler' and d.DoctorName != 'David Tennant'
)

select
    distinct
    e.EnemyName
from 
    CTEDoctor d
join
    tblEpisodeEnemy ee on ee.EpisodeId = d.EpisodeId
join
    tblEnemy e on e.EnemyId = ee.EnemyId