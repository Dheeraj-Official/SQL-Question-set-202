use Music_01;

select * 
from
    dbo.fn_Shows_by_Artist('bad bunny') as s
order by
    s.[Number of shows] desc;
