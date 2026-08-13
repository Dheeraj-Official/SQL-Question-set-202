use DoctorWho;
GO

Create OR ALTER PROC spMattSmithEpisodes AS

select 
    e.seriesnumber as Series,
    e.EpisodeNumber as Episode,
    e.title,
    e.episodeDate as [Date of Episode],
    ed.DoctorName as Doctor
from 
    tblEpisode e
Join 
    tblDoctor ed on e.DoctorID = ed.DoctorID
where
    ed.DoctorName = 'Matt Smith' and YEAR(e.EpisodeDate) = 2012
GO

EXEC spMattSmithEpisodes;