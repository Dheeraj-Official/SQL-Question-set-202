use DoctorWho;
go

-- Step 1: basic data — series number, year, episode id per episode
with EpisodeYears as
(
    select
        SeriesNumber,
        YEAR(EpisodeDate) as EpisodeYear,
        EpisodeId
    from
        tblEpisode
)

-- Step 2: pivot to show counts of episodes by year (rows) and series number (columns)
select
    EpisodeYear,
    [1], [2], [3], [4], [5]
from
    EpisodeYears
pivot
(
    count(EpisodeId)
    for SeriesNumber in ([1], [2], [3], [4], [5])
) as PivotTable
order by
    EpisodeYear;