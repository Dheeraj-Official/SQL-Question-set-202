use DoctorWho;
GO

create or alter proc spRussell as
select 
    title 
from 
    tblauthor a
join 
    tblEpisode e on a.AuthorID = e.AuthorID
where 
    a.AuthorName like '%Russell%'
order by e.EpisodeDate desc;
go

exec spRussell;