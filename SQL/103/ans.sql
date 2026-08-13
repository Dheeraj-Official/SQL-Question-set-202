use WorldEvents

declare @FirstDate DATE = '01-Jan-1991';
declare @LastDate DATE = '31-Dec-1991';

select 
    EventName,
    EventDate,
    countryName
from
    tblEvent
join
    tblCountry
on
    tblEvent.countryID = tblCountry.countryID
where
    EventDate between @FirstDate and @LastDate