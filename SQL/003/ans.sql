USE WorldEvents;

select 
    top 3
    CategoryID, CategoryName 
from 
    dbo.tblCategory
order by 
    CategoryName desc;
