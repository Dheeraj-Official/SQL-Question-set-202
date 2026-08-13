use DoctorWho;
go

-- Step 1: build comma list of distinct first words of EpisodeType
declare @EpisodeTypes varchar(max) = '';

select @EpisodeTypes = @EpisodeTypes + QUOTENAME(FirstWord) + ','
from
(
    select distinct
        case when CHARINDEX(' ', EpisodeType) > 0
            then LEFT(EpisodeType, CHARINDEX(' ', EpisodeType) - 1)
            else EpisodeType
        end as FirstWord
    from tblEpisode
) t;

set @EpisodeTypes = LEFT(@EpisodeTypes, LEN(@EpisodeTypes) - 1);

-- Step 2: dynamic SQL pivot using that column list
declare @sql varchar(max) = '
with cte as
(
    select
        d.DoctorName,
        e.EpisodeId,
        case when CHARINDEX('' '', e.EpisodeType) > 0
            then LEFT(e.EpisodeType, CHARINDEX('' '', e.EpisodeType) - 1)
            else e.EpisodeType
        end as FirstWord
    from tblEpisode e
    join tblDoctor d on e.DoctorId = d.DoctorId
)
select DoctorName, ' + @EpisodeTypes + '
from cte
pivot (count(EpisodeId) for FirstWord in (' + @EpisodeTypes + ')) as pvt
';

exec (@sql);