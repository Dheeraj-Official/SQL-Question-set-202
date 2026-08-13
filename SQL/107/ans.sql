use DoctorWho;

declare @doctorID int = 1;
declare @doctorName varchar(100);
declare @noEpisodes int;

select 
    @doctorName = d.doctorName,
    @noEpisodes = count(*)
from 
    tblDoctor d
join
    tblEpisode e on e.DoctorID = d.DoctorID
where 
    d.doctorID = @doctorID
group by
    doctorName;

print('Resullt for doctor ' + CAST(@doctorID as varchar(10)))
print('-------------------------------------------------')
print('Doctor name : ' + @doctorName)
print('Episodes apperaed in : ' + CAST(@noEpisodes as varchar(10)))