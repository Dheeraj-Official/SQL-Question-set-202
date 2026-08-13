use DoctorWho
go

Create or alter proc spCompanionsForDoctor
    @Doctor varchar(50)
as 
begin
    select
        distinct
        c.CompanionName
    from
        tblEpisode e
    join
        tblDoctor d on e.DoctorID = d.DoctorID
    join
        tblEpisodeCompanion ec on ec.EpisodeID = e.EpisodeID
    join 
        tblCompanion c on c.CompanionID = ec.CompanionID
    where
        d.DoctorName like '%' + @Doctor + '%' AND c.CompanionName is not null
end
go
