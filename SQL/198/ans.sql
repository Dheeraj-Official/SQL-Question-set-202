use worldEvents;
go

-- Step 1: build the comma-delimited, quoted list of event names
declare @DecadeStart date = '1980-01-01';
declare @DecadeEnd   date = '1989-12-31';

declare @EventList varchar(max) = '';

select
    @EventList = @EventList + QUOTENAME(EventName, '''') + ','
from
    tblEvent
where
    EventDate between @DecadeStart and @DecadeEnd;

-- remove the trailing comma
set @EventList = LEFT(@EventList, LEN(@EventList) - 1);

-- (optional) see what the list looks like
select @EventList;

-- Step 2: use the list to filter tblEvent via dynamic SQL
declare @sql varchar(max) =
    'SELECT * FROM tblEvent WHERE EventName IN ( ' + @EventList + ')';

exec (@sql);