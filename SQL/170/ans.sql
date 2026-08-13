use DoctorWho;
go

create or alter function dbo.fnEpisodeByDoctor(@doctorName varchar(50)) returns table
as
return 
(
    select
        EpisodeId,
        Title,
        SeriesNumber,
        EpisodeNumber,
        AuthorID
    from
        tblEpisode e
    join
        tblDoctor d on d.DoctorID = e.DoctorID
)
go

select * from dbo.fnEpisodeByDoctor('chris');

select
    SeriesNumber,
    EpisodeNumber,
    Title,
    AuthorName
from 
    dbo.fnEpisodeByDoctor('chris') fnD
join
    tblAuthor a on a.AuthorID = fnD.AuthorID