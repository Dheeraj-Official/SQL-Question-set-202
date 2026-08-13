use WorldEvents;
go

create or alter function dbo.fnLetterCount(@first varchar(MAX), @second varchar(MAX))
returns int
as
begin
    declare @eventcount int = LEN(REPLACE(@first, ' ', ''));
    declare @detailscount int = LEN(REPLACE(@second, ' ', ''));

    return @eventcount + @detailscount;
end
go

select
    eventName,
    EventDetails,
    EventDate,
    dbo.fnLetterCount(eventName, EventDetails) as LetterCount
from
    tblEvent