use WorldEvents


select
    EventName,
    DATENAME(dw, EventDate) + ' ' +  
    DATENAME(DAY, EventDate) + 
    CASE 
        WHEN DATENAME(DAY, EventDate) = 1 THEN 'st'
        WHEN DATENAME(DAY, EventDate) = 2 THEN 'nd'
        WHEN DATENAME(DAY, EventDate) = 3 THEN 'rd'
        ELSE 'th'
    END + ' ' +
    DATENAME(MONTH, EventDate) + ' ' +
    DATENAME(YEAR, EventDate)
from 
    tblEvent