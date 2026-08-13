use WorldEvents;

Select 
    EventDetails AS What,
    EventDate AS [When]
From 
    tblEvent
Where 
    YEAR(EventDate) = 2005 AND MONTH(EventDate) = 2 