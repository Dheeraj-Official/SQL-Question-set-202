use WorldEvents;
GO

Create or alter PROC uspAugustEvents
as 
Select 
    eventid,
    eventName,
    eventDetails,
    EventDate
from
    tblEvent
where
    MONTH(EventDate) = 8
go

exec uspAugustEvents