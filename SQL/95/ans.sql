use DoctorWho;
GO

create or alter proc spMoffats as
select 
    title 
from 
    tblauthor a
join 
    tblEpisode e on a.AuthorID = e.AuthorID
where 
    a.AuthorName like '%Moffat%'
order by e.EpisodeDate desc;
go

exec spMoffats;