use Music_01;
go

create or alter function dbo.fn_Album_Certification(@Sales float) returns nvarchar(14)
as
begin
    return 
    case
		when @Sales >= 10 then 'Diamond'
		when @Sales >= 2 then 'Multi Platinum'
		when @Sales >= 1 then 'Platinum'
		when @Sales >= 0.5 then 'Gold'
		else 'Uncertified'
	end
end 
go

select
    title,
    Artist,
    [US_sales_(m)],
    dbo.fn_Album_Certification([US_sales_(m)]) as Sales_Certification
from
    album a
join 
    artist ar on a.artist_id = ar.artist_id
