use DoctorWho;
go

create or alter proc spEpisodesSorted
    @SortColumn varchar(50) = 'EpisodeId',
    @SortOrder  varchar(4)  = 'ASC'
as
begin
    declare @sql varchar(max) =
        'SELECT * FROM tblEpisode ORDER BY ' +
        @SortColumn + ' ' + @SortOrder

    exec(@sql)
end
go

-- show episodes in default order
exec spEpisodesSorted
go

-- show episodes in reverse title order
exec spEpisodesSorted 'Title', 'DESC'
go