use Music_01;

declare @avgAttendance float
set @avgAttendance = (select avg(attendance) from tour)

select @avgAttendance as 'Average Attendance';

select 
    tour_name,
    Attendance
from tour
where attendance  > @avgAttendance
order by attendance asc;
