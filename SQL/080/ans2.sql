use WorldEvents

select 
    vv.Category,
    count(*) as 'NumberEvents'
from 
    vvEverything vv
where 
    vv.Continent = 'Africa'
Group BY
    vv.Category 
order by
    NumberEvents desc;