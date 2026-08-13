use DoctorWho;

drop table if exists #tblEpisodeWithoutNotes;
drop table if exists #tblEnemy_shorter_description;

select * into #tblEpisodeWithoutNotes from tblEpisode
where Notes is not null;

select * into #tblEnemy_shorter_description from tblEnemy
where len([Description]) > 75;


declare @result table (
    prob int identity(1,1) primary key,
    TableName varchar(50),
    id int,
    ColumnName varchar(50),
    ColumnValue nvarchar(max),
    ProblemName nvarchar(255)
)

insert into @result
select 
    'tblEnemy',
    EnemyId,
    'Description',
    [Description],
    'Description has ' +  CAST(Len([Description]) as varchar(10)) + ' letters'
from 
    #tblEnemy_shorter_description;

insert into @result
select 
    'tblEpisode',
    EpisodeId,
    'Notes',
    Notes,
    'Notes has ' +  CAST(Len(Notes) as varchar(10)) + ' letters'
from 
    #tblEpisodeWithoutNotes;

select * from @result;