use Music_01


declare @Albums int;
declare @Tracks int;

select @Albums = count(*) from Album;
select @Tracks = sum(Tracks) from Album;

select 
    @Albums as 'Count Albums', 
    @Tracks as 'Count Tracks',
    @Tracks / CAST(@Albums as FLOAT) as 'Avg Tracks per Album';